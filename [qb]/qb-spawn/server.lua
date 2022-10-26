local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid then
        local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] then
            cb(houses)
        else
            cb({})
        end
    else
        cb({})
    end
end)
