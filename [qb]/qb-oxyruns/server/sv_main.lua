local QBCore = exports['qb-core']:GetCoreObject()

--- Returns the amount of cops online and on duty
--- @return integer number - amount of cops
local GetCopCount = function()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

--- Calculates the amount of cash rolls to launder
--- @return integer number - amount
local GetLaunderAmount = function()
    local cops = GetCopCount()
    if cops > 10 then cops = 10 end -- cap at 10 cops for no insane returns
    local min = 20 + (cops * 10) -- 300 base + 100 per cop minimum
    local max = 30 + (cops * 20) -- 600 base + 190 per cop minimum
    local retval = math.random(min, max)
    return retval
end

RegisterNetEvent('qb-oxyruns:server:Reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        -- Cash
        -- local cash = math.random(250, 300)
        -- Player.Functions.AddMoney("cash", cash, "oxy-money")

        -- Launder
        -- local launder = math.random(100)
        -- local item = Player.Functions.GetItemByName(Config.LaunderItem)
        -- if item and launder <= Config.LaunderChance then
        --     local amount = item.amount
        --     local removeAmount = GetLaunderAmount()
        --     if removeAmount > amount then removeAmount = amount end
        --     Player.Functions.RemoveItem(Config.LaunderItem, removeAmount)
        --     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LaunderItem], "remove", removeAmount)
        --     Wait(250)
        --     Player.Functions.AddMoney('cash', removeAmount, 'oxy-launder')
        --     TriggerClientEvent('QBCore:Notify', src, "You have laundered some money...", "success", 2500)
        -- end

        -- Wash Money
        local num_bags = 0
        local total_worth = 0
        local extra_money = GetLaunderAmount()

        for _, item in pairs(Player.PlayerData.items) do
            if item.name == "markedbills" then
                num_bags = num_bags + 1
                if type(item.info) ~= 'string' and tonumber(item.info.worth) then
                    total_worth = total_worth + tonumber(item.info.worth)
                    Player.Functions.RemoveItem(item.name, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
                end
            end
        end

        if num_bags < 1 then return TriggerClientEvent('okokNotify:Alert', src, 'Tiền Bẩn', 'Bạn không có tiền bẩn để rửa', 5000, 'error') end
        local real_worth = (total_worth + extra_money) * 0.8
        Player.Functions.AddMoney('cash', real_worth, 'Rửa tiền bẩn')
        -- QBCore.Functions.Notify(src, 'Bạn đã rửa tiền bẩn và nhận được $'..real_worth, 'success')
        TriggerClientEvent('okokNotify:Alert', src, 'Tiền Bẩn', 'Bạn đã rửa tiền bẩn và nhận được $'..real_worth, 5000, 'success')
        TriggerEvent("qb-log:server:CreateLog", "black_money", "Rửa Tiền", "red", "Tên: **".. Player.PlayerData.charinfo.lastname .. Player.PlayerData.charinfo.firstname .. "** \nCitizenid: *"..Player.PlayerData.citizenid.."* \nID: *"..src.."* \nTúi tiền: **"..num_bags.." cái** \nSố tiền: **" .. total_worth.. "$** \nTiền extra: **" .. extra_money .. "$** \nTiền Sạch: **" .. real_worth .. "$**")

        -- Oxy
        -- local oxy = math.random(100)
        -- if oxy <= Config.OxyChance then
        --     Player.Functions.AddItem(Config.OxyItem, 1, false)
        --     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.OxyItem], "add", 1)
        -- end

        -- Rare loot
        -- local rareLoot = math.random(100)
        -- if rareLoot <= Config.RareLoot then
        --     Player.Functions.AddItem(Config.RareLootItem, 1, false)
        --     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareLootItem], "add", 1)
        -- end
    end
end)

QBCore.Functions.CreateCallback('qb-oxyruns:server:StartOxy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.Functions.GetItemByName('markedbills') then return TriggerClientEvent('okokNotify:Alert', src, 'Tiền Bẩn', 'Bạn không có tiền bẩn để rửa', 5000, 'error') end

    if Player.PlayerData.money.cash >= Config.StartOxyPayment then
        local amount = GetCopCount()
        if amount >= Config.MinCops then
            TriggerClientEvent('okokNotify:Alert', src, 'Phương Tiện', 'Sau khi xong công việc hãy quay lại đây và trả xe', 10000, 'info')
            Player.Functions.RemoveMoney('cash', Config.StartOxyPayment, "Tiền muớn xe rửa tiền")
            cb(true)
        else
            TriggerClientEvent('QBCore:Notify', src, "Không có đủ " .. Config.MinCops .. ' cảnh sát', "error",  2500)
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Bạn không có đủ tiền để thuê xe", "error",  3500)
        cb(false)
    end
end)

RegisterNetEvent('qb-oxyruns:server:deposit', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney('cash', Config.StartOxyPayment, 'Tiền trả lại xe rửa tiền')
end)
