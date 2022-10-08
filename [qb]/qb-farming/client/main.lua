local QBCore = exports['qb-core']:GetCoreObject()
local already = false

local field = {
    {
        coords = vector3(247.67, 6462.49, 31.31)
    },
}

local props = {}

local function toggleField(enable)
    SetNuiFocus(enable, enable)

    if enable then
        SendNUIMessage({
            action = 'open'
        })
    else
        SendNUIMessage({
            action = 'close'
        })
    end
end

local function startScenario(anim)
	TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end

local function isClosetField()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local temp = {}

    for k,v in pairs(field) do
        local dist = #(coords - v.coords)

        -- table.insert(temp, {key = k, dist = dist, coords = v.coords})
        temp[#temp + 1] = {
            key = k,
            dist = dist,
            coords = coords
        }
    end

    table.sort(temp, function(a,b) return a.dist < b.dist end)
    
    return temp[1]
end

local function isClosetPlant()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local temp = {}

    for k, v in pairs(props) do
        local dist = #(v.coords - coords)
        temp[#temp + 1] = {
            key = k,
            dist = dist
        }
    end

    table.sort(temp, function(a,b) return a.dist < b.dist end)
    
    return temp[1]
end

local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    toggleField(false)
end)

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    for _, value in pairs(props) do
        DeleteEntity(value.prop)
        DeleteObject(value.prop)
        table.remove(props)
    end
end)

RegisterNUICallback('escape', function(_, cb)
    toggleField(false)
    SetNuiFocus(false, false)

    cb('ok')
end)

local shops = {
    vector3(408.39, 6498.34, 27.73)
}

CreateThread(function ()
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        for _, v in pairs(shops) do
            local dist = #(coords - v)

            if dist <= 1.5 then
                ShowHelp("Nhấn E để mua hạt giống")

                if IsControlJustPressed(0, 38) then
                    toggleField(true)
                end
            else
                Wait(1000)
            end
        end

        Wait(0)
    end
end)

function ShowHelp(msg, _, duration)
    AddTextEntry('qbHelpNotification', "<FONT FACE='Baloo Paaji 2 SemiBold'>"..msg)
    BeginTextCommandDisplayHelp('qbHelpNotification')
	EndTextCommandDisplayHelp(0, false, true, duration or -1)
end

RegisterNUICallback('buy', function(data, cb)
    local item, count, price = data.item, data.count, data.price

    TriggerServerEvent('5m_farming:buyItem', item, count, price)
    cb('ok')
end)

CreateThread(function()
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        for _, v in pairs(field) do
            local dist = #(v.coords - coords)
            if dist <= 30.0 then
                ShowHelp("Trồng hạt giống và trở thành nông dân")
            else
                Wait(1000)
            end
        end

        Wait(1)
    end
end)

RegisterNetEvent('5m_farming:useItem')
AddEventHandler('5m_farming:useItem', function(itemname, label)
    local fieldS = isClosetField()
    local ped = PlayerPedId()
    local d, coords =  fieldS.dist, fieldS.coords
    local _, distance = QBCore.Functions.GetClosestPlayer()
    if not QBCore.Functions.SetTimer() then exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn có thể bị cảnh sát hỏi thăm', 5000, 'warning') end
    if not next(props) then
        if distance == -1 or distance >= 3.0 then
            if d <= 30.0 then
                if not already then
                    already = true
                    TriggerServerEvent('5m_farming:removeItem', itemname)
                    startScenario("world_human_gardener_plant")
                    Wait(4000)
                    ClearPedTasks(ped)

                    local x,y,z = table.unpack(coords)
                    z = z - 5.3
                    
                    local obj = CreateObject('prop_plant_01a', x, y, z, true, true, false)
                    FreezeEntityPosition(obj, true)
                    props[#props + 1] = {
                        label = label,
                        item = itemname,
                        state = 0,
                        water = 100,
                        prop = obj,
                        coords = coords
                    }
                    SetTimeout(10000, function()
                        already = false
                    end)
                else
                    exports['okokNotify']:Alert('Trồng Hạt', 'Bạn hãy đợi 10 giây sau để trồng tiếp cây mới', 5000, 'warning')
                end
            else
                exports['okokNotify']:Alert("Vị Trí", "Bạn đang không đứng trong cánh đồng", 5000, "error")
            end
        else
            exports['okokNotify']:Alert("Vị Trí", "Có người đang đứng gần bạn", 5000, "warning")
        end
    else
        local plantS = isClosetPlant()
        local dS = plantS.dist
        if d <= 30.0 then
            if dS >= 3.0 then
                if distance == -1 or distance >= 3.0 then
                    if not already then
                        already = true
                        TriggerServerEvent('5m_farming:removeItem', itemname)
                        startScenario("world_human_gardener_plant")
                        Wait(4000)
                        ClearPedTasks(ped)

                        local x,y,z = table.unpack(coords)
                        z = z - 5.3
                        
                        local obj = CreateObject('prop_plant_01a', x, y, z, true, true, false)
                        FreezeEntityPosition(obj, true)
                        props[#props + 1] = {
                            label = label,
                            item = itemname,
                            state = 0,
                            water = 100,
                            prop = obj,
                            coords = coords
                        }
                        SetTimeout(10000, function()
                            already = false
                        end)
                    else
                        exports['okokNotify']:Alert('Trồng Hạt', 'Bạn hãy đợi 10 giây sau để trồng tiếp cây mới', 5000, 'warning')
                    end
                else
                    exports['okokNotify']:Alert("Vị Trí", "Có người đang đứng gần bạn", 5000, "warning")
                end
            else
                exports['okokNotify']:Alert("Vị Trí", "Bạn trồng quá gần các cây khác", 5000, "error")
            end
        else
            exports['okokNotify']:Alert("Vị Trí", "Bạn đang không đứng trong cánh đồng", 5000, "error")
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        if props then
            for _, value in pairs(props) do
                local newState = (value.state + 1)

                if newState <= 100 then
                    local x,y,z = table.unpack(GetEntityCoords(value.prop))
                    SetEntityCoords(value.prop, x, y, (z + 0.04), 0, 0, 0, false)
                    value.state = value.state + 1
                end
            end
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        if props then
            for key, value in pairs(props) do
                if value.water <= 0.0 then
                    SetModelAsNoLongerNeeded(value.prop)
                    DeleteEntity(value.prop)
                    DeleteObject(value.prop)
                    table.remove(props, key)
                    exports['okokNotify']:Alert('Hạt Giống', 'Cây của bạn đã chết vì thiếu nước', 2500, 'error')
                else
                    value.water = round(value.water - 0.2, 1)
                end
            end
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        if props then
            for key, value in pairs(props) do
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local x, y, z = table.unpack(value.coords)
                if #(coords - vector3(x, y, z)) <= 10 then
                    z = z - 2.0
                    Draw3DText(x, y, z + 1.000, '🌾 : ' .. value.label, 4, 0.1, 0.1)
                    Draw3DText(x, y, z + 1.300, '💚 : ' .. (round((value.state / 100) * 100, 0)), 4, 0.1, 0.1)
                    Draw3DText(x, y, z + 1.600, '🚰 : ' .. value.water, 4, 0.1, 0.1)
                
                    if value.state >= 100 then
                        Draw3DText(x, y, z + 2.0, '[ ~r~[E]~w~ để thu hoạch]', 4, 0.1, 0.1)

                        if IsControlJustPressed(0, 38) then
                            SetModelAsNoLongerNeeded(value.prop)
                            DeleteEntity(value.prop)
                            DeleteObject(value.prop)
                            table.remove(props, key)

                            local ernte = math.random(8, 13)
                            TriggerServerEvent('5m_farming:giveItem', value.item, ernte)
                            -- QBCore.Functions.Notify('Bạn đã thu hoạch được ' .. ernte .. ' ' .. value.label, 'success')
                            exports['okokNotify']:Alert("Thu Hoạch", 'Bạn đã thu hoạch được '..ernte..' '..value.label, 2500, 'success')
                        end
                    end
                end
            end
        else
            Wait(1000)
        end

        Wait(1)
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('5m_farming:useKanne', function()
    local plantS = isClosetPlant()

    if plantS then
        local k,d = plantS.key, plantS.dist

        if d <= 2.0 then
            if (props[k].water + 30.0) > 100.0 then
                props[k].water = 100.0
            else
                props[k].water = props[k].water + 30.0
            end
        end
    else
        return
    end

    TriggerServerEvent('5m_farming:removeItem', 'giesskanne_voll')
end)

RegisterNetEvent('5m_farming:fillKanne')
AddEventHandler('5m_farming:fillKanne', function()
    if IsEntityInWater(PlayerPedId()) then
        startScenario("world_human_gardener_plant")
        Wait(5000)
        ClearPedTasks(PlayerPedId())

        TriggerServerEvent('5m_farming:fillKanne')
    end
end)

local verkauf = vector3(-2508.032, 3613.787, 14.19591)

CreateThread(function()
    while true do
        local dist = #(verkauf - GetEntityCoords(PlayerPedId()))

        if dist <= 2.5 then
            ShowHelp("Press ~INPUT_CONTEXT~ to sell crops")

            if IsControlJustPressed(0, 38) then
                TriggerServerEvent('5m_farming:sellItems')
                -- QBCore.Functions.Notify('Bạn đã bán các thành phẩm của bạn', 'success')
                exports['okokNotify']:Alert('Bán Đồ', 'Bạn đã bán các thành phẩm của bạn', 2500, 'success')
            end
        end

        Wait(1)
    end
end)

AddEventHandler('onResourceStop', function(resource) -- Mostly for development, restart the resource and it will put all the clothes back on.
	if resource == GetCurrentResourceName() then
        for _, value in pairs(props) do
            SetModelAsNoLongerNeeded(value.prop)
            DeleteEntity(value.prop)
		    DeleteObject(value.prop)
            table.remove(props)
        end
	end
end)