local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rez_zombies:server:lootItem', function(Type)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end
    if Type == "Epic" then
        Player.Functions.AddItem('lucky_coin', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lucky_coin'], "add")
        TriggerClientEvent('okokNotify:Alert', source, 'Bạn đã lấy được đồng xu may mắn')
    end
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pumpkin'], "add")
    Player.Functions.AddItem('pumpkin', 1)
end)