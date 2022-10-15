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

function Pay(source, amount)
    QBCore.Functions.GetPlayer(source).Functions.AddMoney("cash", amount)
end

function PayPenalty(source, amount)
    QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", amount)
end