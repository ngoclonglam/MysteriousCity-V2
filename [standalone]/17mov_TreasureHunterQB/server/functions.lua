QBCore = exports['qb-core']:GetCoreObject()
function GetPlayerIdentity(source)
    local xPlayer
    while xPlayer == nil do
        xPlayer = QBCore.Functions.GetPlayer(source)
        Citizen.Wait(100)
    end
    return xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname 
end     

function Notify(source, msg)
    TriggerClientEvent("QBCore:Notify", source, msg)
end

function Pay(source, amount, treasureFoundNumber)
    QBCore.Functions.GetPlayer(source).Functions.AddMoney("cash", amount)
    Notify(source, Config.Lang["reward"] .. amount)
    -- if treasureFoundNumber > 0 then
    --     local Player = QBCore.Functions.GetPlayer(source)
    --     local rewardItems = {"jewerly", "rolex", "vali"} -- Add here ur Item names
    --     for k,v in pairs(rewardItems) do
    --         Player.Functions.AddItem(v, treasureFoundNumber)
    --     end
    -- end
end