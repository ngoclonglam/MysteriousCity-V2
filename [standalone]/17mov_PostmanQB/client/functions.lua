QBCore = exports['qb-core']:GetCoreObject()

function Notify(msg)
    QBCore.Functions.Notify(msg)
end

function SetVehicle(vehicle)
    exports['ps-fuel']:SetFuel(vehicle, 100.0)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.030+ factor, 0.03, 0, 0, 0, 150)
end

function PrepeareVehicle()
    -- Before Vehicle spawn
end

function ChangeClothes(type) 

    RequestAnimDict("clothingshirt")
    while not HasAnimDictLoaded("clothingshirt") do Citizen.Wait(0) end

    local PlayerPed = PlayerPedId()
    TaskPlayAnim(PlayerPed, "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1000)

    if type == "work" then
        local Player = QBCore.Functions.GetPlayerData()
        local gender = Player.charinfo.gender
        if gender == 0 then
            for k,v in pairs(Config.Clothes.male) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
        else
            for k,v in pairs(Config.Clothes.female) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
        end
    else 
        -- Choose Here your default skin manager script
        TriggerEvent('fivem-appearance:client:reloadSkin')
        
        -- QBCore.Functions.TriggerCallback('fivem-appearance:getPlayerSkin', function(appearance)
        --     for k,v in pairs(appearance.components) do
        --         SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
        --     end
        -- end)

        -- ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        --     TriggerEvent('skinchanger:loadSkin', skin)
        -- end)
    end
    Citizen.Wait(1000)
    ClearPedTasks(PlayerPed)
end