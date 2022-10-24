local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('zombie_loot:server:lootItem', function(Type)
    local Player = QBCore.Functions.GetPlayer(source)
    local lucky = math.random(1, 100)
    if not Player then return end

    if Type == "epic" then
        Player.Functions.AddItem('lucky_coin', 1)
        TriggerClientEvent('okokNotify:Alert', source, "Hallowen", "Bạn đã kiếm được đồng xu may mắn", 3000, "success")
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["lucky_coin"], 'add')
    elseif Type == "pumpkin" then
        if lucky >= 60 then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["pumpkin"], 'add')
            Player.Functions.AddItem('pumpkin', 1)
        else
            Player.Functions.AddMoney('cash', 100, 'Bí Ngô')
            QBCore.Functions.Notify(source, 'Bạn không tìm được bí ngô, nhưng bạn đã tìm được $100', 'success')
        end
    elseif Type == "normal" then
        if lucky >= 50 then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["pumpkin"], 'add')
            Player.Functions.AddItem('pumpkin', 1)
        else
            QBCore.Functions.Notify(source, 'Bạn không tìm được thứ gì cả')
        end
    end
end)