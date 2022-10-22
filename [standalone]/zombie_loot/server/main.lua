local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('zombie_loot:server:lootItem', function(Type)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    if Type == "epic" then
        Player.Functions.AddItem('lucky_coin', 1)
    end
    Player.Functions.AddItem('pumpkin', 1)
end)