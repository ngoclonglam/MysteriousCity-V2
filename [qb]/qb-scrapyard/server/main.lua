local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-scrapyard:server:LoadCompleteJobs', function()
    local src = source
    TriggerClientEvent("qb-scapyard:client:setCompleteJobs", src, Config.CompleteJobs)
end)

QBCore.Functions.CreateCallback('qb-scrapyard:checkOwnerVehicle', function(_, cb, plate)
    local result = MySQL.scalar.await("SELECT `plate` FROM `player_vehicles` WHERE `plate` = ?",{plate})
    if result then
        cb(false)
    else
        cb(true)
    end
end)

RegisterNetEvent('qb-scrapyard:server:SetAssignedVehicle', function(vehPlate)
    local player = QBCore.Functions.GetPlayer(source)
    Config.CurrentVehicles[player.PlayerData.citizenid] = vehPlate
end)

RegisterNetEvent('qb-scrapyard:server:ScrapVehicle', function(vehPlate, copCount)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local citizenid = player.PlayerData.citizenid
    local amountDeducted = 0

    if copCount < Config.MinimumRequiredPolice then amountDeducted = Config.AmountDeducted end
    if Config.CurrentVehicles[citizenid] == vehPlate then
        for _ = 1, math.random(2, 4), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            local itemcount = math.random(Config.MinItemAmountReceived - amountDeducted, Config.MaxItemAmountReceived - amountDeducted)
            player.Functions.AddItem(item, itemcount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', itemcount)
            Wait(500)
        end
        local Luck = math.random(1, 8)
        local Odd = math.random(1, 8)
        if Luck == Odd then
            local random = math.random(Config.MinItemAmountReceived - amountDeducted, Config.MaxItemAmountReceived - amountDeducted)
            player.Functions.AddItem("rubber", random)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rubber"], 'add', random)
        end
        Luck = math.random(1, 10)
        if Luck == 10 then
            local random = math.random(1, 3)
            player.Functions.AddItem("markedbills", random)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], 'add', random)
        end
        Config.CurrentVehicles[citizenid] = nil
        Config.CompleteJobs[citizenid] = Config.CompleteJobs[citizenid] or {}
        Config.CompleteJobs[citizenid][#Config.CompleteJobs[citizenid]+1] = vehPlate
        TriggerClientEvent("qb-scapyard:client:setCompleteJobs", src, Config.CompleteJobs)
        -- addon feature: set points for house robbery job that determin skill level/title of player
        SetJobPoints(src, 1, "add")
        TriggerClientEvent('qb-scapyard:client:JobPointsUpdated', src)
    end
end)

function SetJobPoints(src, points, type)
    local player = QBCore.Functions.GetPlayer(src)
    local currentPts = player.PlayerData.metadata[Config.JobMetadata] or 0
    if type == "add" then
        currentPts = currentPts + points
    else
        currentPts = currentPts - points
    end
    player.Functions.SetMetaData(Config.JobMetadata, currentPts)
end