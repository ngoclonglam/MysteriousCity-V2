local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('zombie_loot:server:lootItem', function(Type)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    if Type == "epic" then
        Player.Functions.AddItem('lucky_coin', 1)
        TriggerClientEvent('okokNotify:Alert', source, "Hallowen", "Bạn đã kiếm được đồng xu may mắn", 3000, "success")
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["lucky_coin"], 'add')
    end
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["pumpkin"], 'add')
    Player.Functions.AddItem('pumpkin', 1)
end)