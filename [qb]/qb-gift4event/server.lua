local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('gift4event:server:Opened', function(item)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local data = {}
    local luck = math.random(1, 200)

    for _, gift in ipairs(Config.Gifts[item.name]) do
        if gift.luck.min <= luck and gift.luck.max >= luck then
            data.type = gift.type
            data.amount = gift.amount or 1
            data.name = gift.name
            goto giftFound
        end
    end

    ::giftFound::
    if player.Functions.RemoveItem(item.name, 1) then
        if data.type == "money" then
            player.Functions.AddMoney("cash", data.amount, "open-event-gift")
            TriggerClientEvent("QBCore:Notify", src, Config.Lang.success.cash_received .. data.amount, "success")
        elseif data.type == "item" then
            if player.Functions.AddItem(data.name, data.amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], "add", data.amount)
            else
                player.Functions.AddItem(item.name, 1)
                TriggerClientEvent("QBCore:Notify", src, Config.Lang.error.cannot_receive, "error")
                return
            end
        elseif data.type == "car" then
            TriggerClientEvent("gift4event:client:SpawnVehicle", src, data.name)
        end
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove", 1)
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Lang.error.cannot_open, "error")
    end
end)

for key, _ in pairs(Config.Gifts) do
    QBCore.Functions.CreateUseableItem(key, function(source, item)
        TriggerClientEvent("gift4event:client:Open", source, item)
    end)
end