CreateThread(function()
	while true do
		for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
			SetScenarioTypeEnabled(sctyp, false)
		end
		for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
			SetScenarioGroupEnabled(scgrp, false)
		end
		Wait(10000)
	end
end)

AddEventHandler("populationPedCreating", function(x, y, z)
	Wait(500)	-- Give the entity some time to be created
	local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
	if Config.DisableAmbience then
		StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
	end
	SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)	
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
end)

CreateThread(function()
	local sleep
	while true do
		sleep = 1000
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped, 0) then
			sleep = 0
			SetPedMinGroundTimeForStungun(ped, math.random(4000, 7000))
		end
		Wait(sleep)
	end
end)


CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	SetMaxWantedLevel(0)
end)

if Config.DisableIdleCamera then --Disable Idle Cinamatic Cam
	DisableIdleCamera(true)
end

-- CreateThread(function()
-- 	local inside = false
-- 	local carDealer = PolyZone:Create({
-- 		vector2(-363.85711669922, -862.86657714844),
-- 		vector2(-364.35104370118, -970.29016113282),
-- 		vector2(-316.8046875, -986.37463378906),
-- 		vector2(-268.66345214844, -886.1801147461)
-- 	  }, {
-- 		name = "CarDealer",
-- 		minZ = 31.080614089966,
-- 		maxZ = 32.73040008545,
-- 		debugPoly = false
-- 	})

-- 	carDealer:onPlayerInOut(function(isPointInside)
-- 		inside = isPointInside
-- 		if inside then
-- 			while true do
-- 				print('yes')
-- 				ClearAreaOfPeds(-333.08, -918.05, 32.8, 200.0, 1)
-- 				ClearAreaOfVehicles(-333.08, -918.05, 32.8, 200.0, false, false, false, false, false, false)
-- 				Wait(5000)
-- 			end
-- 		end

-- 		if not inside then Wait(1000) end
-- 	end)

-- 	-- while true do
-- 	-- 	ClearAreaOfPeds(-333.08, -918.05, 32.8, 100.0, 1)
-- 	-- 	ClearAreaOfVehicles(-333.08, -918.05, 32.8, 100.0, false, false, false, false, false, false)
-- 	-- 	Wait(1000)
-- 	-- end
-- end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER")then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
				end
			end
		else
			Wait(500)
		end
        Wait(7)
    end
end)

CreateThread(function()
	local pedPool = GetGamePool('CPed')
	for _, v in pairs(pedPool) do
		SetPedDropsWeaponsWhenDead(v, false)
	end
end)

CreateThread(function()
	BarBlip = AddBlipForCoord(6.07, -708.06, 46.02)
	SetBlipSprite (BarBlip, 93)
	SetBlipDisplay(BarBlip, 4)
	SetBlipScale  (BarBlip, 0.95)
	SetBlipAsShortRange(BarBlip, true)
	SetBlipColour(BarBlip, 51)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Mysterious Bar")
	EndTextCommandSetBlipName(BarBlip)

	FarmerBlip = AddBlipForCoord(246.66, 6461.73, 31.23)
	SetBlipSprite (FarmerBlip, 417)
	SetBlipDisplay(FarmerBlip, 4)
	SetBlipScale  (FarmerBlip, 0.95)
	SetBlipAsShortRange(FarmerBlip, true)
	SetBlipColour(FarmerBlip, 51)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Làm Nông")
	EndTextCommandSetBlipName(FarmerBlip)
end)