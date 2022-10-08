local QBCore = exports['qb-core']:GetCoreObject()
local Blips = {}

CreateThread(function()
    LDBlip = AddBlipForCoord(LumberDepo.coords)
    SetBlipSprite (LDBlip, LumberDepo.SetBlipSprite)
    SetBlipDisplay(LDBlip, LumberDepo.SetBlipDisplay)
    SetBlipScale  (LDBlip, LumberDepo.SetBlipScale)
    SetBlipAsShortRange(LDBlip, true)
    SetBlipColour(LDBlip, LumberDepo.SetBlipColour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(LumberDepo.BlipLabel)
    EndTextCommandSetBlipName(LDBlip)
end)

ToogleBlips = function()
    if Config.UseBlips then
--[[         LDBlip = AddBlipForCoord(LumberDepo.coords)
        SetBlipSprite (LDBlip, LumberDepo.SetBlipSprite)
        SetBlipDisplay(LDBlip, LumberDepo.SetBlipDisplay)
        SetBlipScale  (LDBlip, LumberDepo.SetBlipScale)
        SetBlipAsShortRange(LDBlip, true)
        SetBlipColour(LDBlip, LumberDepo.SetBlipColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(LumberDepo.BlipLabel)
        EndTextCommandSetBlipName(LDBlip) ]]

        LJSBlip = AddBlipForCoord(LumberSeller.coords)
        SetBlipSprite (LJSBlip, LumberSeller.SetBlipSprite)
        SetBlipDisplay(LJSBlip, LumberSeller.SetBlipDisplay)
        SetBlipScale  (LJSBlip, LumberSeller.SetBlipScale)
        SetBlipAsShortRange(LJSBlip, true)
        SetBlipColour(LJSBlip, LumberSeller.SetBlipColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(LumberSeller.BlipLabel)
        EndTextCommandSetBlipName(LJSBlip)

        LJTR = AddBlipForCoord(vector3(-516.4, 5405.45, 73.95))
        SetBlipSprite (LJTR, 79)
        SetBlipDisplay(LJTR, 6)
        SetBlipScale  (LJTR, 0.65)
        SetBlipAsShortRange(LJTR, true)
        SetBlipColour(LJTR, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Bãi Gỗ")
        EndTextCommandSetBlipName(LJTR)

        LJTR2 = AddBlipForCoord(vector3(-626.4, 5395.08, 52.16))
        SetBlipSprite (LJTR2, 79)
        SetBlipDisplay(LJTR2, 6)
        SetBlipScale  (LJTR2, 0.65)
        SetBlipAsShortRange(LJTR2, true)
        SetBlipColour(LJTR2, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Bãi Gỗ")
        EndTextCommandSetBlipName(LJTR2)

        LJTR3 = AddBlipForCoord(vector3(-645.9, 5275.29, 72.41))
        SetBlipSprite (LJTR3, 79)
        SetBlipDisplay(LJTR3, 6)
        SetBlipScale  (LJTR3, 0.65)
        SetBlipAsShortRange(LJTR3, true)
        SetBlipColour(LJTR3, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Bãi Gỗ")
        EndTextCommandSetBlipName(LJTR3)

        LJTR4 = AddBlipForCoord(vector3(-544.46, 5227.5, 75.55))
        SetBlipSprite (LJTR4, 79)
        SetBlipDisplay(LJTR4, 6)
        SetBlipScale  (LJTR4, 0.65)
        SetBlipAsShortRange(LJTR4, true)
        SetBlipColour(LJTR4, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Bãi Gỗ")
        EndTextCommandSetBlipName(LJTR4)

        Blips = { --[[ LDBlip, ]] LJSBlip, LJTR, LJTR2, LJTR3, LJTR4, }
    else
        for k, _ in ipairs(Blips) do
            if Blips[k] then
                RemoveBlip(Blips[k])
            end
        end
    end
end