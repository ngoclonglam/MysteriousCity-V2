



Citizen.CreateThread(function()
     local ped = PlayerPedId()
     while true do
         Citizen.Wait(100)
         SetRadarZoom(1100)
     end
end)

 Citizen.CreateThread(function()
     while true do
         Citizen.Wait(100)
         SetBigmapActive(false, false)
     end
 end)




 Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if GetEntityMaxHealth(PlayerPedId()) ~= 200 then
            SetEntityMaxHealth(PlayerPedId(), 200)
            SetEntityHealth(PlayerPedId(), 200)
        end
    end
end)


Citizen.CreateThread(function()
    if Config.CarnameandStreetname then
    while true do
        HideHudComponentThisFrame(6) -- VEHICLE_NAME
        HideHudComponentThisFrame(7) -- AREA_NAME
        HideHudComponentThisFrame(8) -- VEHICLE_CLASS
        HideHudComponentThisFrame(9) -- STREET_NAME
        HideHudComponentThisFrame(3) -- CASH
        HideHudComponentThisFrame(4) -- MP_CASH
        HideHudComponentThisFrame(21) -- 21 : HUD_COMPONENTS
        HideHudComponentThisFrame(22) -- 22 : HUD_WEAPONS
        DisplayAmmoThisFrame(false)
        Citizen.Wait(4)
    end
    end
end)



