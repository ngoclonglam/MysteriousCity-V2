if Config.EnableCruise then
    local cruiseIsOn = false
    local cruiseSpeed = 999.0
    
    RegisterKeyMapping('cruise', 'Cruise Control', 'keyboard', Config.DefaultCruiseControlKey)
    local cruiseSpam = 0
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1700)
            if cruiseSpam > 0 then
                Citizen.Wait(3500)
                cruiseSpam = 0
            end
        end
    end)
    
    RegisterCommand('cruise', function()
        if cruiseSpam >= 3 then
            if Config.EnableSpamNotification  then
                Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"])
            end
            return
        end
        local player = playerPed
        local vehicle = GetVehiclePedIsIn(player, false)
        if (GetPedInVehicleSeat(vehicle, -1) == player and vehicle ~= 0) then
            cruiseIsOn = not cruiseIsOn
            if cruiseIsOn then
                Config.Notification(Config.Notifications["cruise_actived"]["message"], Config.Notifications["cruise_actived"]["type"])
            else
                Config.Notification(Config.Notifications["cruise_disabled"]["message"], Config.Notifications["cruise_disabled"]["type"])
            end
            local currSpeed = GetEntitySpeed(vehicle)
            cruiseSpeed = currSpeed
            
            local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
            SetEntityMaxSpeed(vehicle, maxSpeed)
            SendNUIMessage({type = "toggle_cruise", toggle = cruiseIsOn})
            cruiseSpam = cruiseSpam + 1
        end
    end, false)
end