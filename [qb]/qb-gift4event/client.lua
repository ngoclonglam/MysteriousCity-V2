local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('gift4event:client:Open', function(item)
    TriggerEvent('animations:client:EmoteCommandStart', {"yeah"})
    QBCore.Functions.Progressbar("use_event_gift", Config.Lang.process.open_gift, 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('gift4event:server:Opened', item)
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify(Config.Lang.error.canceled, "error")
    end)
end)

RegisterNetEvent('gift4event:client:SpawnVehicle', function(car)
    TriggerEvent('QBCore:Command:SpawnVehicle', car)
    QBCore.Functions.Progressbar("receive_car", Config.Lang.process.register_vehicle, 3000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
    }, {
    }, {}, {}, function() -- Done
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped)

        if veh and veh ~= 0 then
            local plate = QBCore.Functions.GetPlate(veh)
            local props = QBCore.Functions.GetVehicleProperties(veh)

            if QBCore.Shared.Vehicles[car] and next(QBCore.Shared.Vehicles[car]) then
                TriggerServerEvent('qb-admin:server:SaveCar', props, QBCore.Shared.Vehicles[car], GetHashKey(veh), plate)
            else
                QBCore.Functions.Notify(Config.Lang.error.cannot_register_vehicle, 'error')
            end
        end
    end, function() -- Cancel
    end)
end)