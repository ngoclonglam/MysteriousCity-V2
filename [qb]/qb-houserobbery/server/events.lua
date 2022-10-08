local QBCore = exports['qb-core']:GetCoreObject()

-- Callbacks

QBCore.Functions.CreateCallback('qb-houserobbery:server:AskJob', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local citizenid = player.PlayerData.citizenid

    if Jobs[citizenid] and next(Jobs[citizenid]) and Jobs[citizenid].state ~= Config.JobState.Ready then
        cb(Jobs[citizenid])
        return
    end

    if GetAvailableJobs() > 0 then
        for house, _ in pairs(Config.Houses) do
            if not Config.Houses[house]["opened"] and not Config.Houses[house]["assigned"] then
                Config.Houses[house]["assigned"] = true
                TriggerClientEvent('qb-houserobbery:client:HouseAssigned', -1, house)
                Jobs[citizenid] = { houseId = house, houseInfo = Config.Houses[house], state = Config.JobState.Assigned}
                cb(Jobs[citizenid])
                return
            end
        end
    end

    cb(nil)
end)

RegisterNetEvent('qb-houserobbery:server:JobStateChanged', function(state)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local citizenid = player.PlayerData.citizenid

    if Jobs[citizenid] and next(Jobs[citizenid]) and Jobs[citizenid].state ~= state then
        Jobs[citizenid].state = state
    end
end)