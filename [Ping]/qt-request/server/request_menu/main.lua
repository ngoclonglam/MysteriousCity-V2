local QBCore = exports['qb-core']:GetCoreObject()
local RequestData = {}
-- local index = 0

RegisterServerEvent('request_menu:sendData')
AddEventHandler('request_menu:sendData', function(job, info)
    local src = source
    local identifierr = QBCore.Functions.GetIdentifier(src, 'license')
    if not RequestData[job] then
        RequestData[job] = {}
    end
    local isRequest = false
    for _, v in pairs(RequestData[job]) do
        if v.identifier == identifierr then
            isRequest = true
        end
    end
    if not isRequest then
        table.insert(RequestData[job], {identifier = identifierr, job = job, time = os.time(), status = 0, info = info, name = GetPlayerName(source), source = source, coords = GetEntityCoords(GetPlayerPed(source))})
        TriggerClientEvent('request_menu:sync', -1)
        local playerList = GetPlayerByJob(job)
        for i = 1, #playerList, 1 do
            TriggerClientEvent('QBCore:Notify', playerList[i], "Có người cần giúp đỡ", 'primary',30000)
        end
    end
end)

QBCore.Functions.CreateCallback("request_menu:getData", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local cbData = {}
    local Request = RequestData[xPlayer.PlayerData.job.name]
    if Request then
        for k, v in pairs(Request) do
            local Player = GetPlayerIdentifiers(v.source)
            local status = 0
            local player = "none"
            if Player then
                player = v.source
            end
            if v.status ~= 0 then
                local receiver = GetPlayerIdentifiers(source)
                if receiver then
                    status = v.status
                end
            end
            table.insert(cbData, {id = k, source = player, status = status, time = os.time() - v.time, info = v.info, srcname = v.name, coords = v.coords})
        end
    end
    cb({cbData, GetPlayerName(source)})
end)

RegisterServerEvent("request_menu:acceptRequest")
AddEventHandler("request_menu:acceptRequest", function(id, target)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    RequestData[xPlayer.PlayerData.job.name][id].status = GetPlayerName(source)
    local Player = GetPlayerIdentifiers(RequestData[xPlayer.PlayerData.job.name][id].source)
    TriggerClientEvent('request_menu:sync', -1)
    if xPlayer.PlayerData.job.name == "ambulance" and Player then
        TriggerClientEvent('request_menu:daconguoinhan', target, xPlayer.PlayerData.job.name, GetPlayerName(_source), id)
    elseif xPlayer.PlayerData.job.name == "mechanic" and Player then
        TriggerClientEvent('request_menu:daconguoinhan', target, xPlayer.PlayerData.job.name, GetPlayerName(_source), id)
    elseif xPlayer.PlayerData.job.name == "police" and Player then
        TriggerClientEvent('request_menu:daconguoinhan', target, xPlayer.PlayerData.job.name, GetPlayerName(_source), id)
    elseif xPlayer.PlayerData.job.name == "fire" and Player then
        TriggerClientEvent('request_menu:daconguoinhan', target, xPlayer.PlayerData.job.name, GetPlayerName(_source), id)
    end
end)

RegisterServerEvent("request_menu:removeRequest")
AddEventHandler("request_menu:removeRequest", function(id, target)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if QBCore.Functions.GetPlayer(target) then TriggerClientEvent('request_menu:huynhan', target, xPlayer.PlayerData.job.name, GetPlayerName(source)) end
    RequestData[xPlayer.PlayerData.job.name][id] = nil
    TriggerClientEvent('request_menu:sync', -1)
end)

RegisterServerEvent('request_menu:cancelRequest')
AddEventHandler('request_menu:cancelRequest', function(id, target)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if QBCore.Functions.GetPlayer(target) then TriggerClientEvent('request_menu:huynhan', target, xPlayer.PlayerData.job.name, GetPlayerName(source)) end
    RequestData[xPlayer.PlayerData.job.name][id].status = 0
    TriggerClientEvent('request_menu:sync', -1)
end)

RegisterServerEvent('request_menu:huydichvu')
AddEventHandler('request_menu:huydichvu', function(id, jobname)
    if id and jobname then
        RequestData[jobname][id] = nil
        TriggerClientEvent('request_menu:sync', -1)
    end
end)

function GetPlayerByJob(job)
    local playerList = {}
    for _, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player then
            if (Player.PlayerData.job.name == job and Player.PlayerData.job.onduty) then
                table.insert(playerList, v)
            end
        end
    end
    return playerList
end

function tprint(t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end