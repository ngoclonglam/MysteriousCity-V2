



CreateThread(function()
     while true do
         Wait(100)
         SetRadarZoom(1100)
     end
end)

 CreateThread(function()
     while true do
         Wait(100)
         SetBigmapActive(false, false)
     end
 end)




 CreateThread(function()
    while true do
        Wait(1)
        local ped = PlayerPedId()
        if GetEntityMaxHealth(ped) ~= 200 then
            SetEntityMaxHealth(ped, 200)
            SetEntityHealth(ped, 200)
        end
    end
end)


CreateThread(function()
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
        Wait(4)
    end
    end
end)



