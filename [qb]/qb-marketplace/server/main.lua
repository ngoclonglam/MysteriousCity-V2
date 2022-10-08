local QBCore = exports['qb-core']:GetCoreObject()
local mItems = {}

MySQL.ready(function ()
	local items = MySQL.query.await('SELECT * FROM marketplace_items', {})
	if not items then return end

	for _, v in ipairs(items) do
		mItems[v.name] = {
            amount = v.amount,
            name   = v.name,
            shop   = v.shop,
            info   = v.info,
        }
	end
end)

local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            QBCore.Functions.GetIdentifier(id, 'license'),
            QBCore.Functions.GetIdentifier(id, 'discord'),
            QBCore.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'qb-pawnshop'
        })
    TriggerEvent('qb-log:server:CreateLog', 'pawnshop', 'Player Banned', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'qb-pawnshop', reason), true)
    DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

local function addItemAmount(shopName, itemName, amount)
    if not mItems[itemName] then
        mItems[itemName] = {}
        mItems[itemName].amount = 0
    end
    -- QBCore.Debug(mItems[itemName])
    mItems[itemName].amount = mItems[itemName].amount + tonumber(amount)

    MySQL.insert('INSERT INTO marketplace_items (shop, name, amount) VALUES (:shop_name, :name, :amount) ON DUPLICATE KEY UPDATE amount = :amount',
    {
        ['shop_name'] = shopName,
        ['name'] = itemName,
        ['amount'] = mItems[itemName].amount
    })
end

local function removeItemAmount(shopName, itemName, amount)
    local isRemoved = false
    if tonumber(amount) > 0 then
        if not mItems[itemName] then
            mItems[itemName] = {}
            mItems[itemName].amount = 0
        end
        mItems[itemName].amount = mItems[itemName].amount - amount
        if mItems[itemName].amount < 0 then mItems[itemName].amount = 0 end
        MySQL.update('UPDATE marketplace_items SET amount = ? WHERE name = ? and shop = ?', { mItems[itemName].amount, itemName, shopName })
    end
    return isRemoved
end

RegisterNetEvent('qb-marketplace:server:sellItems', function(shopName, itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.ShopLocation) do
        dist = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
        if dist < 2 then
            break
        end
    end
    if dist > 5 then exploitBan(src, 'sellMarketplaceItems Exploiting') return end
    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        addItemAmount(shopName, itemName, tonumber(itemAmount))
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
        else
            Player.Functions.AddMoney('cash', totalPrice)
        end
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice }),'success')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove', tonumber(itemAmount))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_items'), 'error')
    end
    TriggerClientEvent('qb-marketplace:client:bossMenu', src)
end)

RegisterNetEvent("qb-marketplace:server:UpdateShopItems", function(shop, itemData, amount)
    removeItemAmount(shop, itemData.name, amount)
end)

QBCore.Functions.CreateCallback('qb-marketplace:server:getAvailItems', function(source, cb, shop)
    local items = {}
    for _, item in pairs(mItems) do
        if shop == item.shop then
            items[#items+1] = {
                name = item.name,
                amount = item.amount,
                price = Config.Shops[shop].items[item.name].price * 2,
            }
        end
    end
    cb(items)
end)

QBCore.Functions.CreateCallback('qb-marketplace:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)
