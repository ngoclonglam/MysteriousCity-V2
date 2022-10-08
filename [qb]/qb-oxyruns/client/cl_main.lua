local QBCore = exports['qb-core']:GetCoreObject()

local started = false
local dropOffCount = 0
local hasDropOff = false
local returnCar = false

local oxyPed = nil
local madeDeal = false

local dropOffBlip = nil

local plate = nil

local peds = {
	'a_m_y_stwhi_02',
	'a_m_y_stwhi_01',
	'a_f_y_genhot_01',
	'a_f_y_vinewood_04',
	'a_m_m_golfer_01',
	'a_m_m_soucent_04',
	'a_m_o_soucent_02',
	'a_m_y_epsilon_01',
	'a_m_y_epsilon_02',
	'a_m_y_mexthug_01'
}

--- This function can be used to trigger your desired dispatch alerts
local AlertCops = function()
	--exports['qb-dispatch']:DrugSale() -- Project-SLoth qb-dispatch
	TriggerServerEvent('police:server:policeAlert', 'Suspicious Hand-off') -- Regular qbcore
end

--- Creates a drop off blip at a given coordinate
--- @param coords vector4 - Coordinates of a location
local CreateDropOffBlip = function(coords)
	dropOffBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(dropOffBlip, 51)
    SetBlipScale(dropOffBlip, 1.0)
    SetBlipAsShortRange(dropOffBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Deliver")
    EndTextCommandSetBlipName(dropOffBlip)
end

--- Creates a drop off ped at a given coordinate
--- @param coords vector4 - Coordinates of a location
local CreateDropOffPed = function(coords)
	if oxyPed ~= nil then return end
	local model = peds[math.random(#peds)]
	local hash = GetHashKey(model)

    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end
	oxyPed = CreatePed(5, hash, coords.x, coords.y, coords.z-1, coords.w, true, true)
	while not DoesEntityExist(oxyPed) do Wait(10) end
	ClearPedTasks(oxyPed)
    ClearPedSecondaryTask(oxyPed)
    TaskSetBlockingOfNonTemporaryEvents(oxyPed, true)
    SetPedFleeAttributes(oxyPed, 0, 0)
    SetPedCombatAttributes(oxyPed, 17, 1)
    SetPedSeeingRange(oxyPed, 0.0)
    SetPedHearingRange(oxyPed, 0.0)
    SetPedAlertness(oxyPed, 0)
    SetPedKeepTask(oxyPed, true)
	FreezeEntityPosition(oxyPed, true)
	exports['qb-target']:AddTargetEntity(oxyPed, {
		options = {
			{
				type = "client",
				event = "qb-oxyruns:client:DeliverOxy",
				icon = 'fas fa-capsules',
				label = 'Make Deal',
			}
		},
		distance = 2.0
	})
end

--- Creates a random drop off location
local CreateDropOff = function()
	local ped = PlayerPedId()
	local vehicle = IsPedInAnyVehicle(ped, false)
	local car = GetVehiclePedIsIn(ped)
	if vehicle then
		local plateShit = QBCore.Functions.GetPlate(car)
		if plateShit ~= plate then
			exports['okokNotify']:Alert('Phương Tiện', 'Bạn đã lên xe khác khi rửa tiền bẩn', 5000, 'error')
			started = false
			DoScreenFadeOut(500)
			Wait(500)
			QBCore.Functions.DeleteVehicle(veh)
			DoScreenFadeIn(500)
			Wait(500)
			return
		end
	end
	hasDropOff = true
	TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT', "Make your way to the drop-off..", 'fas fa-capsules', '#3480eb', 8000)
	dropOffCount += 1
	local randomLoc = Config.Locations[math.random(#Config.Locations)]
	-- Blip
	CreateDropOffBlip(randomLoc)
	-- PolyZone
	dropOffArea = CircleZone:Create(randomLoc.xyz, 85.0, {
		name = "dropOffArea",
		debugPoly = false
	})
	dropOffArea:onPlayerInOut(function(isPointInside, point)
		if isPointInside then
			if oxyPed == nil then
				TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT', "Make the delivery..", 'fas fa-capsules', '#3480eb', 8000)
				CreateDropOffPed(randomLoc)
			end
		end
	end)
end

--- Start an oxy run after paying the initial payment
local StartOxyrun = function()
	if started then return end
	started = true
	TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT', "Wait for a new location..", 'fas fa-capsules', '#3480eb', 8000)

	local coords = vector4(227.64, -39.86, 69.48, 162.03)

	QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
		veh = NetToVeh(netId)
		SetVehicleNumberPlateText(veh, 'Marked' .. tostring(math.random(1, 99)))
		plate = GetVehicleNumberPlateText(veh)
		SetEntityHeading(veh, coords.w)
		exports['ps-fuel']:SetFuel(veh, 100.0)
		TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
		TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
		SetVehicleEngineOn(veh, true, true)
	end, 'gburrito2', coords, true)

	while started do
		Wait(4000)
		if not hasDropOff then
			Wait(8000)
			CreateDropOff()
		end
	end
end

--- Deletes the oxy ped
local DeleteOxyped = function()
	FreezeEntityPosition(oxyPed, false)
	SetPedKeepTask(oxyPed, false)
	TaskSetBlockingOfNonTemporaryEvents(oxyPed, false)
	ClearPedTasks(oxyPed)
	TaskWanderStandard(oxyPed, 10.0, 10)
	SetPedAsNoLongerNeeded(oxyPed)
	Wait(20000)
	DeletePed(oxyPed)
	oxyPed = nil
end

RegisterNetEvent("qb-oxyruns:client:StartOxy", function()
	if started then return end
	QBCore.Functions.TriggerCallback('qb-oxyruns:server:StartOxy', function(canStart)
		if canStart then
			StartOxyrun()
		end
	end)
end)

RegisterNetEvent('qb-oxyruns:client:DeliverOxy', function()
	if madeDeal then return end
	local ped = PlayerPedId()
	if not IsPedOnFoot(ped) then return end
	if #(GetEntityCoords(ped) - GetEntityCoords(oxyPed)) < 5.0 then

		-- Anti spam

		madeDeal = true
		exports['qb-target']:RemoveTargetEntity(oxyPed)

		-- Alert Cops

		if math.random(100) <= Config.CallCopsChance then
			AlertCops()
		end

		-- Face each other

		TaskTurnPedToFaceEntity(oxyPed, ped, 1.0)
		TaskTurnPedToFaceEntity(ped, oxyPed, 1.0)
		Wait(1500)
		PlayAmbientSpeech1(oxyPed, "Generic_Hi", "Speech_Params_Force")
		Wait(1000)

		-- Playerped animation

		RequestAnimDict("mp_safehouselost@")
    	while not HasAnimDictLoaded("mp_safehouselost@") do Wait(10) end
    	TaskPlayAnim(ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
		Wait(800)
		
		-- Oxyped animation

		PlayAmbientSpeech1(oxyPed, "Chat_State", "Speech_Params_Force")
		Wait(500)
		RequestAnimDict("mp_safehouselost@")
		while not HasAnimDictLoaded("mp_safehouselost@") do Wait(10) end
		TaskPlayAnim(oxyPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
		Wait(3000)

		-- Remove blip

		RemoveBlip(dropOffBlip)
		dropOffBlip = nil

		-- Finishing up

		dropOffArea:destroy()
		Wait(2000)
		if dropOffCount == Config.RunAmount then
			-- TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT', "You are done delivering, go back to the pharmacy..", 'fas fa-capsules', '#3480eb', 20000)
			-- Reward
			TriggerServerEvent('qb-oxyruns:server:Reward')

			started = false
			dropOffCount = 0
			returnCar = true
		else
			TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT', "Delivery was good, you will be updated with the next drop-off..", 'fas fa-capsules', '#3480eb', 20000)
		end
		DeleteOxyped()
		hasDropOff = false
		madeDeal = false
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		local ped = PlayerPedId()
		local vehicle = IsPedInAnyVehicle(ped, false)
		local car = GetVehiclePedIsIn(ped)
		local isCar = false
		
		if started then
			if vehicle then
				local plateCar = QBCore.Functions.GetPlate(car)
				print('PlateCar: ', plateCar)
				print('Plate: ', plate)
				if plateCar == plate then
					isCar = true
				else
					print('nono')
					isCar = false
					started = false
					RemoveBlip(dropOffBlip)
					dropOffBlip = nil
					Wait(1000)
					dropOffArea:destroy()
					DeleteOxyped()
					dropOffCount = 0
					hasDropOff = false
					madeDeal = false
					DoScreenFadeOut(500)
					Wait(500)
					QBCore.Functions.DeleteVehicle(veh)
					exports['okokNotify']:Alert('Phương Tiện', 'Bạn đã lên xe khác trong khi rửa tiền', 5000, 'error')
					DoScreenFadeIn(500)
					Wait(500)
				end
			end
		else
			Wait(500)
		end

		if isCar then Wait(500) end

	end
end)

CreateThread(function()

	-- Starter Ped

	local pedModel = `g_m_m_chemwork_01`
	local pedId = PlayerPedId()
	RequestModel(pedModel)
	while not HasModelLoaded(pedModel) do Wait(10) end
	local ped = CreatePed(0, pedModel, Config.StartLocation.x, Config.StartLocation.y, Config.StartLocation.z-1.0, Config.StartLocation.w, false, false)
	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)

	-- Target

	exports['qb-target']:AddTargetEntity(ped, {
		options = {
			{
				type = "client",
				event = "qb-oxyruns:client:StartOxy",
				icon = 'fas fa-capsules',
				label = 'Start Oxyrun ($'..Config.StartOxyPayment..')',
			}
		},
		distance = 2.0
	})
	
	-- Return Car
	CreateThread(function()
		while true do
			Wait(1)
			local return_coords = vector3(235.23, -33.17, 69.71)
			local return_coords2 = vector3(231.54, -32.02, 69.72)
			local return_coords3 = vector3(228.71, -31.09, 69.72)
			local return_coords4 = vector3(228.3, -30.52, 69.73)
			local dist = #(return_coords - GetEntityCoords(pedId))
			local dist2 = #(return_coords2 - GetEntityCoords(pedId))
			local dist3 = #(return_coords3 - GetEntityCoords(pedId))
			local dist4 = #(return_coords4 - GetEntityCoords(pedId))
			
			local inside = false

			if dist <= 3 or dist2 <= 3 or dist3 <= 3 or dist4 <= 3 then
				if returnCar then
					inside = true
					exports['qb-core']:DrawText('Bấm E để trả lại xe rửa tiền', 'left')
					if IsControlJustReleased(0, 51) then
						local vehicle = IsPedInAnyVehicle(pedId, false)
						local car = GetVehiclePedIsIn(pedId)
						if vehicle then
							local plate_car = QBCore.Functions.GetPlate(car)
							if plate == plate_car then
								QBCore.Functions.DeleteVehicle(car)
								TriggerServerEvent('qb-oxyruns:server:deposit')
								DoScreenFadeOut(1500)
								Wait(1500)
								DoScreenFadeIn(1500)
								Wait(1500)
								exports['okokNotify']:Alert('Tiền Bẩn', 'Bạn đã trả xe và nhận lại $' .. Config.StartOxyPayment, 5000, 'success')
								returnCar = false
							else
								exports['okokNotify']:Alert('Phương Tiện', 'Đây không phải là xe rửa tiền', 5000, 'error')
							end
						else
							exports['okokNotify']:Alert('Phương Tiện', 'Bạn phải ngồi trong xe để trả lại xe', 5000, 'warning')
						end
					end
				end
			end

			

			if not inside then
				if not returnCar then exports['qb-core']:HideText() end
				if returnCar and dist >= 4 then exports['qb-core']:HideText() end
				Wait(2500)
			end
		end
	end)

	-- zone:onPlayerInOut(function(isPointInside)
	-- 	if isPointInside then
	-- 		exports['qb-core']:DrawText('Bấm E để trả lại xe rửa tiền', 'left')
	-- 		print('yes')
	-- 		CreateThread(function()
	-- 			while isPointInside do
	-- 				print('okay spawm đi')
	-- 				if IsControlJustPressed(0, 51) then
	-- 					local vehicle = IsPedInAnyVehicle(pedID, false)
	-- 					local plate_car = QBCore.Functions.GetPlate(vehicle)
	-- 					if vehicle then
	-- 						if plate == plate_car then
	-- 							QBCore.Functions.DeleteVehicle(vehicle)
	-- 							TriggerServerEvent('qb-oxyruns:server:deposit')
	-- 							DoScreenFadeOut(500)
	-- 							Wait(500)
	-- 							DoScreenFadeIn(500)
	-- 							Wait(500)
	-- 							exports['okokNotify']:Alert('Tiền Bẩn', 'Bạn đã trả xe và nhận lại $' .. Config.StartOxyPayment, 5000, 'success')
	-- 						else
	-- 							exports['okokNotify']:Alert('Phương Tiện', 'Đây không phải là xe rửa tiền', 5000, 'error')
	-- 						end
	-- 					else
	-- 						exports['okokNotify']:Alert('Phương Tiện', 'Bạn phải ngồi trong xe để trả lại xe', 5000, 'warning')
	-- 					end
	-- 				end
	-- 				Wait(0)
	-- 			end
	-- 		end)
	-- 	else
	-- 		print('no')
	-- 		exports['qb-core']:HideText()
	-- 	end
	-- end)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end
    QBCore.Functions.DeleteVehicle(veh)
end)