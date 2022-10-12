local QBCore =  exports['qb-core']:GetCoreObject()
local hasJob = false
local aajuns = false
local culege = false
-- local cursaf = false
local paid = false
local cutie = 0
local worked = false
local typeP = nil
local price = 5000
-- local total = 0
local reset = false

function DrawText3D(x, y, z, text, scl) 

    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    
    local scale = (1 / dist) * scl
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 1.1 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function CreateCar()
    local coords = vector4(-2170.73, 4274.89, 48.96, 150.42)
	QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        veh = NetToVeh(netId)
        SetVehicleNumberPlateText(veh, "FARMER")
        SetEntityHeading(veh, coords.w)
        exports['ps-fuel']:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        SetVehicleLights(veh, 2)
        SetVehicleNumberPlateTextIndex(veh, 2)
        SetVehicleColours(veh, 147, 41)
        SetEntityAsMissionEntity(veh, true, true)
        SetEntityInvincible(veh, false)
        SetModelAsNoLongerNeeded(GetHashKey("kalahari"))
        
        for i = 0,24 do
            SetVehicleModKit(veh,0)
            RemoveVehicleMod(veh,i)
        end
    end, "kalahari", coords, true)
end


local coordonate = {
    {376.74, 6506.03, 28.04},
    {369.99, 6506.59, 28.44},
    {363.18, 6506.63, 28.53},
    {355.20, 6506.04, 28.50},
    {347.63, 6506.10, 28.82},
    {339.82, 6506.54, 28.69},
    {330.91, 6506.53, 28.58},
    {321.62, 6506.36, 29.22},
    {321.88, 6516.89, 29.13},
    {330.51, 6516.48, 28.96},
    {338.59, 6516.33, 28.94},
    {347.66, 6516.87, 28.78},
    {355.04, 6516.81, 28.22},
    {362.60, 6517.04, 28.26},
    {369.81, 6516.99, 28.37},
    {377.89, 6516.59, 28.37},
    {369.43, 6530.64, 28.43},
    {361.66, 6530.53, 28.39},
    {353.68, 6529.97, 28.44},
    {346.18, 6530.48, 28.73},
    {338.55, 6530.27, 28.56},
    {329.79, 6530.33, 28.60},
    {322.19, 6530.15, 29.17},
    {281.02, 6530.73, 30.17},
    {281.38, 6519.42, 30.16},
    {282.03, 6507.37, 30.13},
    {274.07, 6507.49, 30.40},
    {272.63, 6518.74, 30.44},
    {270.89, 6530.15, 30.49},
    {262.10, 6527.85, 30.72},
    {2330.2463378906, 5036.1245117188, 44.325420379639},
}

local function resetCherry()
    table.insert(coordonate, {376.74, 6506.03, 28.04})
    table.insert(coordonate, {369.99, 6506.59, 28.44})
    table.insert(coordonate, {363.18, 6506.63, 28.53})
    table.insert(coordonate, {355.20, 6506.04, 28.5})
    table.insert(coordonate, {347.63, 6506.1, 28.82})
    table.insert(coordonate, {339.82, 6506.54, 28.69})
    table.insert(coordonate, {330.91, 6506.53, 28.58})
    table.insert(coordonate, {321.62, 6506.36, 29.22})
    table.insert(coordonate, {321.88, 6516.89, 29.13})
    table.insert(coordonate, {330.51, 6516.48, 28.96})
    table.insert(coordonate, {338.59, 6516.33, 28.94})
    table.insert(coordonate, {347.66, 6516.87, 28.78})
    table.insert(coordonate, {355.04, 6516.81, 28.22})
    table.insert(coordonate, {362.6, 6517.04, 28.26})
    table.insert(coordonate, {369.81, 6516.99, 28.37})
    table.insert(coordonate, {377.89, 6516.59, 28.37})
    table.insert(coordonate, {369.43, 6530.64, 28.43})
    table.insert(coordonate, {361.66,6530.53, 28.39})
    table.insert(coordonate, {353.68, 6529.97, 28.44})
    table.insert(coordonate, {346.18, 6530.48, 28.73})
    table.insert(coordonate, {338.55, 6530.27, 28.56})
    table.insert(coordonate, {329.79, 6530.33, 28.6})
    table.insert(coordonate, {322.19, 6530.15, 29.17})
    table.insert(coordonate, {2330.2463378906, 5036.1245117188, 44.325420379639})
end

local function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local carPos = GetEntityCoords(veh, false)
        local pos = GetEntityCoords(ped)

        if culege then
            if #(vector3(pos.x, pos.y, pos.z) - vector3(carPos.x , carPos.y, carPos.z)) <= 7.0 and DoesEntityExist(veh) then
                DrawText3D(carPos.x, carPos.y, carPos.z, "Nhấn ~y~[E]~w~ để bỏ hộp cherry vào xe", 1.2)
                DrawText3D(carPos.x, carPos.y, carPos.z+2, "~r~"..cutie.."~w~/~g~30", 1.2)
                if IsControlJustPressed(1,51) then
                    DeleteEntity(myObject)
                    TriggerServerEvent('hell_cherryfarmer:itemReward')
                    worked = false
                    ClearPedTasksImmediately(ped)
                    culege = false
                    cutie = cutie + 1
                    if cutie == 1 then
                        local objectModel1 = GetHashKey("v_ind_cf_chckbox1")
                        myObject1 = CreateObject(objectModel1, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject1, veh, veh, 0.23, -0.8,4, -0.5, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                    elseif cutie == 15 then
                        local objectModel2 = GetHashKey("v_ind_cf_chckbox1")
                        myObject2 = CreateObject(objectModel2, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject2, veh, veh, 0.13, -1.3,4, -0.9, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                    elseif cutie == 30 then
                        local objectModel3 = GetHashKey("v_ind_cf_chckbox1")
                        myObject3 = CreateObject(objectModel3, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject3, veh, veh, -0.23, -0.8,4, -0.9, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                        aajuns = false
                        exports['okokNotify']:Alert('Công Việc', 'Bạn đã hái hết các cherry trong vườn, hãy đi rửa cherry', 5000, 'success')
                        SetNewWaypoint(94.03, 6355.89)
                        cutie = cutie + 1
                    end
                end
            end
        end

        if aajuns == true and hasJob == true then
            for i, v in pairs(coordonate) do
                local metrii2 = #(vector3(v[1], v[2], v[3]) - GetEntityCoords(ped))
                if metrii2 <= 40 then
                    DrawMarker(2, v[1], v[2], v[3], 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 35, 170, 25, 165, 0, 0, 2, 1, 0, 1, 0,1)
                    local metrii3 = #(vector3(v[1], v[2], v[3]) - GetEntityCoords(ped))
                    if metrii3 <= 1 then
                        DrawText3D(pos.x, pos.y, pos.z, "Nhấn ~y~[E]~w~ để hái cherry", 1.2)
                        if IsControlJustPressed(1,51) then
                            if not IsPedInAnyVehicle(ped, false) then
                                if #(vector3(pos.x, pos.y, pos.z) - vector3(carPos.x, carPos.y, carPos.z)) <= 20 and hasJob and aajuns and DoesEntityExist(veh) then
                                    if culege == false then
                                        if reset then
                                            reset = false
                                        end
                                        worked = true
                                        table.remove(coordonate, i)
                                        LoadAnim('amb@prop_human_movie_bulb@idle_a')
                                        TaskPlayAnim(ped, 'amb@prop_human_movie_bulb@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                        QBCore.Functions.Progressbar("pick_cherry", "Đang Hái Cherry..", 5000, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            ClearPedTasks(ped)
                                            RequestAnimDict("anim@heists@box_carry@")
                                            TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
                                            local objectModel = GetHashKey("v_ind_cf_chckbox1")
                                            local bone = GetPedBoneIndex(ped, 28422)
                                            RequestModel(objectModel)
                                            myObject = CreateObject(objectModel, pos.x, pos.y, pos.z, true, true, false)
                                            AttachEntityToEntity(myObject, ped, bone, 0.0, 0,3, -0.2, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                                            FreezeEntityPosition(myObject, true)
                                            SetEntityInvincible(myObject, true)
                                            SetEntityCollision(myObject,0,1)
                                            culege = true
                                            if not QBCore.Functions.SetTimer() then exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn có thể bị cảnh sát hỏi thăm', 5000, 'warning') end

                                            exports['okokNotify']:Alert('Thông Tin', 'Bỏ hộp cherry vào xe', 5000, 'info')
                                        end, function()
                                            ClearPedTasks(ped)
                                            worked = false
                                        end) -- Cancel
                                    else
                                        exports['okokNotify']:Alert('Thông Tin', 'Bạn đã lấy cherry rồi', 5000, 'error')
                                    end
                                else
                                    exports['okokNotify']:Alert('Phương Tiện', 'Xe của bạn không ở gần để hái cherry', 5000, 'error')
                                end
                            else
                                exports['okokNotify']:Alert('Quy Luật', 'Bạn phải ra khỏi xe để hái cherry', 5000, 'error')
                            end
                        end
                    end
                end
            end
        end

        local metriii = #(GetEntityCoords(ped) - vector3(-58.21, 6522.49, 31.49))
        if metriii <= 1 then
            DrawText3D(pos.x, pos.y, pos.z, " Nhấn ~y~[E]~w~ để bán cherry", 1.2)
            if IsControlJustReleased(0, 51) then
                if not IsPedInAnyVehicle(ped, false) then
                    TriggerServerEvent("hell_cherryfarmer:sell")
                    -- exports['okokNotify']:Alert('Thông Tin', 'Người thu cherry đã đi du lịch', 5000, 'warning')
                else
                    exports['okokNotify']:Alert('Thông Tin', 'Bạn phải đi xuống xe để bán cherry', 5000, 'warning')
                end
            end
        else
            Wait(500)
        end

        local metrii = #(GetEntityCoords(ped) - vector3(-2173.88, 4282.2, 49.12))
        if metrii <= 2 and not IsPedInAnyVehicle(ped, false) then
            DrawText3D(pos.x, pos.y, pos.z + 0.6, "Nhấn ~y~[E]~w~ để trở thành người hái cherry", 1.2)
            if IsControlJustPressed(1,51) then
                if hasJob == false then
                    aajuns = true
                    hasJob = true
                    
                    local Player = QBCore.Functions.GetPlayerData()
                    if Player.money.cash >= price then
                        paid = true
                        typeP = 'cash'
                        TriggerServerEvent('hell_cherryfarmer:rentCar', 'cash', price, 'remove')
                    elseif Player.money.bank >= price then
                        paid = true
                        typeP = 'bank'
                        TriggerServerEvent('hell_cherryfarmer:rentCar', 'bank', price, 'remove')
                    else
                        return exports['okokNotify']:Alert('Thông Tin', 'Bạn không có đủ $'.. price ..' để trả tiền thuê xe', 3000, 'error')
                    end

                    if paid then
                        CreateCar()
                        SetNewWaypoint(vector2(370.26, 6506.63))
                    end
                else
                    exports['okokNotify']:Alert('Công Việc', 'Bạn đã là người hái cherry', 5000, 'warning')
                end
            end
        elseif metrii <= 3 and IsPedInAnyVehicle(ped, false) then
            DrawText3D(pos.x, pos.y, pos.z + 0.6, "Nhấn ~y~[E]~w~ để trả xe", 1.2)
            if IsControlJustPressed(1, 51) then
                local vehicle = GetVehiclePedIsIn(ped, true)
                if QBCore.Functions.GetPlate(vehicle) == "FARMER" then
                    TaskLeaveVehicle(ped, vehicle, 0)
                    SetVehicleDoorsLocked(vehicle)
                    Wait(3500)
                    QBCore.Functions.DeleteVehicle(vehicle)
                    DeleteEntity(myObject1)
                    DeleteEntity(myObject2)
                    DeleteEntity(myObject3)
                    TriggerServerEvent('hell_cherryfarmer:rentCar', typeP, price - 500, 'add')
                    DeleteWaypoint()
                    hasJob = false
                    culege = false
                    cutie = 0
                else
                    exports['okokNotify']:Alert('Phương Tiện', 'Xe này không phải biển số xe của hái cherry', 5000, 'error')
                end
            end
        else
            Wait(500)
        end

        -- writing here
        local washi = #(GetEntityCoords(ped) - vector3(94.03, 6355.89, 31.38))
        if washi <= 3 then
            DrawText3D(pos.x, pos.y, pos.z, 'Hãy rửa cherry để đem bán', 1.2)
            if washi <= 2 then
                if IsControlJustPressed(0, 51) then
                    if not IsPedInAnyVehicle(ped, false) then
                        if not reset then
                            cutie = 0
                            aajuns = true
                            resetCherry()
                            reset = true
                        end
                        local item = QBCore.Functions.HasItem('w_cherry')  
                        if item then
                            local lucky = math.random(1, 3)
                            LoadAnim('amb@prop_human_bum_bin@idle_a')
                            TaskPlayAnim(ped, 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
                            Wait(1000)
                            DoScreenFadeOut(800)
                            Wait(800)
                            QBCore.Functions.Progressbar("wash_cherry", "Rửa Cherry..", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true,
                            }, {}, {}, {}, function() -- Done
                                ClearPedTasks(ped)
                                TriggerServerEvent('hell_cherryfarmer:washReward', lucky)
                                DoScreenFadeIn(800)
                                Wait(800)
                            end, function()
                                ClearPedTasks(ped)
                                DoScreenFadeIn(800)
                                Wait(800)
                            end) -- Cancel
                        else
                            exports['okokNotify']:Alert('Công Việc', 'Bạn không có cherry để rửa', 5000, 'error')
                        end
                    else
                        exports['okokNotify']:Alert('Phương Tiện', 'Bạn không thể rửa cherry khi ngồi trên xe' , 5000, 'warning')
                    end
                end
            end
        else
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource) -- Mostly for development, restart the resource and it will put all the clothes back on.
	if resource == GetCurrentResourceName() then
		DeleteEntity(veh)
        DeleteEntity(myObject1)
        DeleteEntity(myObject2)
        DeleteEntity(myObject3)
        DeleteEntity(myObject)
        DeleteWaypoint()
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteEntity(veh)
    DeleteEntity(myObject)
    DeleteEntity(myObject1)
    DeleteEntity(myObject2)
    DeleteEntity(myObject3)
    DeleteWaypoint()
    hasJob = false
    aajuns = false
    paid   = false
    culege = false
    cutie  = 0
    resetCherry()
end)
