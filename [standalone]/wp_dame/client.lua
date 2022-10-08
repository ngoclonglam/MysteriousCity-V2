--[[ Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 0.6)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.168)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.065)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HATCHET"), 0.168)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 0.185)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.15)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.15)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.1)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 0.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.85)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.65)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MG"), 1.2)
        Wait(0)
    end
end) ]]

--[[ Citizen.CreateThread(function()
    while true do
        Wait(0)
        
        local playerPed = GetPlayerPed(-1)
        local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(playerPed)]
        
        if weaponsConfig then
            N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.modifier)
        else
            Wait(500)
        end
    end
end) ]]

Citizen.CreateThread(function()
    for _, weaponConf in pairs(Config.Weapons) do
        SetWeaponDamageModifier(weaponConf.model, weaponConf.modifier)
    end

    -- Disable head shot
    SetPedSuffersCriticalHits(ped, false)
end)

--[[ Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
        -- Disable head shot
        SetPedSuffersCriticalHits(ped, false)
    end
end) ]]