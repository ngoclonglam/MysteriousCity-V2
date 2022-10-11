local tankObj, maskObj, hasGear
QBCore = exports['qb-core']:GetCoreObject()

function Notify(msg)
    QBCore.Functions.Notify(msg)
end

function SetVehicle(vehicle)
    exports['ps-fuel']:SetFuel(vehicle, 100.0)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end

function PrepeareVehicle()
    -- Before Vehicle spawn
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

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function ChangeClothes(type)
    RequestAnimDict("clothingshirt")
    while not HasAnimDictLoaded("clothingshirt") do
        Wait(0)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1000)
    if type == "work" and not hasGear then
        local maskModel = `p_d_scuba_mask_s`
        local tankModel = `p_s_scuba_tank_s`

        RequestModel(tankModel)
        while not HasModelLoaded(tankModel) do
            Wait(0)
        end

        RequestModel(maskModel)
        while not HasModelLoaded(maskModel) do
            Wait(0)
        end

        tankObj = CreateObject(tankModel, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(tankObj, ped, GetPedBoneIndex(ped, 24818), -0.25, -0.25, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)

        maskObj = CreateObject(maskModel, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(maskObj, ped, GetPedBoneIndex(ped, 12844), 0.0, 0.0, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
        hasGear = true
        
        CreateThread(function()
            while hasGear do
                Citizen.Wait(0)
                SetEnableScuba(ped, true)
                SetEnableScubaGearLight(ped, true)
                SetPlayerUnderwaterTimeRemaining(PlayerId(), 100.0)
                SetPedMaxTimeUnderwater(PlayerPedId(), 100.0)
            end
            SetEnableScuba(ped, false)
            SetPedMaxTimeUnderwater(PlayerPedId(), 10.0)
            SetEnableScubaGearLight(ped, false)
        end)
        
        local Player = QBCore.Functions.GetPlayerData()
        local gender = Player.charinfo.gender
        if gender == 0 then
            for k,v in pairs(Config.Clothes.male.components) do
                SetPedComponentVariation(ped, v["component_id"], v["drawable"], v["texture"], 0)
            end
        else
            for k,v in pairs(Config.Clothes.female.components) do
                SetPedComponentVariation(ped, v["component_id"], v["drawable"], v["texture"], 0)
            end
        end
    elseif hasGear and type == "citizen" then
        DetachEntity(maskObj, 0, 1)
        DeleteEntity(maskObj)
        DetachEntity(tankObj, 0, 1)
        DeleteEntity(tankObj)
        tankObj, maskObj, hasGear = nil, nil, false
        SetEnableScuba(ped, false)
        SetEnableScubaGearLight(ped, false)
        -- Choose Here your default skin manager script
        TriggerServerEvent('qb-clothes:loadPlayerSkin')
        
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
    ClearPedTasks(ped)
end

function AddBlipForTreasure(coords)
    local radius, randomX, randomY = 50.0, 10, 15
    if Config.EasyMode then
        radius, randomX, randomY = 25, 5, 7.5
    end
    
    local newCoords = vec3(coords.x + math.random(1, 10), coords.y + math.random(1, 15), coords.z)

    local radiusBlip = AddBlipForRadius(newCoords, 50.0)
    SetBlipRotation(radiusBlip, 0)
    SetBlipColour(radiusBlip, 50)

    local labelBlip = AddBlipForCoord(newCoords)
    SetBlipSprite(labelBlip, 597)
    SetBlipDisplay(labelBlip, 4)
    SetBlipScale(labelBlip, 0.7)
    SetBlipColour(labelBlip, 50)
    SetBlipAsShortRange(labelBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.Lang["treasureBlipName"])
    EndTextCommandSetBlipName(labelBlip)
    return radiusBlip, labelBlip
end

function AddBlipWhenNearby(coords)
    local nearbyBlip = AddBlipForCoord(coords)
    SetBlipSprite(nearbyBlip, 568)
    SetBlipDisplay(nearbyBlip, 4)
    SetBlipScale(nearbyBlip, 1.0)
    SetBlipColour(nearbyBlip, 46)
    SetBlipAsShortRange(nearbyBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.Lang["treasure"])
    EndTextCommandSetBlipName(nearbyBlip)

    PlaySoundFrontend(-1, 'Close', 'DLC_H3_Tracker_App_Sounds', true)
    return nearbyBlip
end