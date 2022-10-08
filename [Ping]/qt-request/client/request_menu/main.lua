local QBCore = exports['qb-core']:GetCoreObject()
local RequestData = {}
local isRequestMenuOpen = false

AddEventHandler('request_menu:open', function()
    InitData()
    OpenMenu()
end)

RegisterKeyMapping('request', '<FONT FACE="Baloo Paaji 2 SemiBold">Mở request', 'keyboard', 'F2')

RegisterCommand('request', function()
    TriggerEvent('request_menu:open')
end)

RegisterNetEvent("request_menu:sync")
AddEventHandler("request_menu:sync", function()
    if isRequestMenuOpen then
        InitData()
    end
end)

RegisterNUICallback('request:accept', function(data, _)
    local id = data.id:gsub("%s", "")
    id = tonumber(id)
    for _, v in ipairs(RequestData) do
        if v.id == id then
            local target = v.source
            SetNewWaypoint(v.targetCoords.x, v.targetCoords.y)
            TriggerServerEvent("request_menu:acceptRequest", id, target)
        end
    end
end)

RegisterNUICallback('request:getPos', function(data, _)
    local id = data.id:gsub("%s", "")
    id = tonumber(id)
    for _, v in ipairs(RequestData) do
        if v.id == id then
            SetNewWaypoint(v.targetCoords.x, v.targetCoords.y)
        end
    end
end)

RegisterNUICallback('request:remove', function(data, _)
    local id = data.id:gsub("%s", "")
    id = tonumber(id)
    for _, v in ipairs(RequestData) do
        if v.id == id then
            local target = v.source
            TriggerServerEvent('request_menu:removeRequest', id, target)
        end
    end
end)

RegisterNUICallback('request:cancel', function(data, _)
    local id = data.id:gsub("%s", "")
    id = tonumber(id)
    for k, v in ipairs(RequestData) do
        if v.id == id then
            local target = v.source
            TriggerServerEvent('request_menu:cancelRequest', id, target)
        end
    end
end)

OpenMenu = function()
    if not isUIOpen then
        isUIOpen = true
        isRequestMenuOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            name = 'request_menu',
            event = 'toggle',
            open = true
        })
    end
end

InitData = function()
    QBCore.Functions.TriggerCallback("request_menu:getData", function(data)
        local requestData = {}
        for _,v in ipairs(data[1]) do
            if v.source ~= "none" or v.status then
                local pedCoords = GetEntityCoords(PlayerPedId())
                local targetCoords = v.coords
                local distance = GetDistanceBetweenCoords(pedCoords, targetCoords, true)
                local status = 0
                if v.status ~= 0 then
                    status = v.status
                end
                local isAccept = 0
                if v.status == data[2] then
                    isAccept = 1
                end
                table.insert(requestData, {id = v.id, name = v.srcname, distance = math.floor(distance).." m", status = status , time = v.time.." giây trước", source = v.source, isAccept = isAccept, info = v.info, targetCoords = targetCoords})
            end
        end
        RequestData = requestData
        SendNUIMessage({
            name = "request_menu",
            event = "init",
            initData = requestData
        })
    end)
end