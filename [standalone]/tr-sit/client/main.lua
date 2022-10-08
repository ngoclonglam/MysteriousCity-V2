local QBCore = exports['qb-core']:GetCoreObject()
local debugProps, sitting, lastPos, currentSitCoords, currentScenario, occupied = {}
local disableControls = false
local currentObj = nil

exports('sitting', function()
    return sitting
end)

local function WakeUp()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())

	TaskStartScenarioAtPosition(playerPed, currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
	while IsPedUsingScenario(PlayerPedId(), currentScenario) do
		Wait(100)
	end
	ClearPedTasks(playerPed)

	FreezeEntityPosition(playerPed, false)
	FreezeEntityPosition(currentObj, false)
	TriggerServerEvent('tr-sit:leavePlace', currentSitCoords)
	currentSitCoords, currentScenario = nil, nil
	sitting = false
	disableControls = false
end

local RoundFloat = function(number, num)
    return math.floor(number*math.pow(10,num)+0.5) / math.pow(10,num)
end

local function sit(object, modelName, data)
	disableControls = true
	currentObj = object
	FreezeEntityPosition(object, true)
	
	local objPos = GetEntityCoords(object)
	local objHead = GetEntityHeading(object)
	
	local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(playerPed)
	
	local objectCoords = RoundFloat(objPos.x, 1) .. ", " .. RoundFloat(objPos.y, 1) .. ", " .. RoundFloat(objPos.z, 1)
	
	local offset = GetObjectOffsetFromCoords(objPos.x, objPos.y, objPos.z, objHead, data.sideOffset, data.forwardOffset, data.verticalOffset)

	QBCore.Functions.TriggerCallback('tr-sit:getPlace', function(occupied)
		if occupied then
			QBCore.Functions.Notify(Config.Text["Occupied"], 'error')
		else
			lastPos, currentSitCoords = playerPos, objectCoords

			TriggerServerEvent('tr-sit:takePlace', objectCoords)

			currentScenario = data.scenario
			TaskStartScenarioAtPosition(playerPed, currentScenario, offset.x, offset.y, offset.z, (objHead + 180.0) + data.rotationOffset, 0, true, false)
			
			Wait(2500)
			if GetEntitySpeed(PlayerPedId()) > 0 then
				ClearPedTasks(PlayerPedId())
				TaskStartScenarioAtPosition(playerPed, currentScenario, offset.x, offset.y, offset.z, (objHead + 180.0) + data.rotationOffset, 0, true, false)
			end

			sitting = true
		end
	end, objectCoords)
end

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if sitting then
			if Config.DrawText == "QB" then
				exports['qb-core']:DrawText(Config.Text["StandUp"], Config.DrawTextLocation)
			elseif Config.DrawText == "CD" then
				TriggerEvent('cd_drawtextui:ShowUI', 'show', Config.Text["StandUp"])
			end
		end

		if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
			if Config.DrawText == "QB" then
				exports['qb-core']:HideText()
			elseif Config.DrawText == "CD" then
				TriggerEvent('cd_drawtextui:HideUI')
			end
			WakeUp()
		end

		if IsControlPressed(0, Config.GetUpKey) and IsInputDisabled(0) and IsPedOnFoot(playerPed) then
			if sitting then
				if Config.DrawText == "QB" then
					exports['qb-core']:KeyPressed()
				elseif Config.DrawText == "CD" then
					TriggerEvent('cd_drawtextui:HideUI')
				end
				Wait(7)
				WakeUp()
			end
		end
	end
end)

CreateThread(function()
	local Sitables = {}

	for _, v in pairs(Config.Interactables) do
		local model = GetHashKey(v)
		table.insert(Sitables, model)
	end
	Wait(100)
	exports['qb-target']:AddTargetModel(Sitables, {
        options = {
            {
                event = "tr-sit:Sit",
                icon = "fas fa-chair",
                label = Config.Text["TargetLabel"],
				entity = entity
            },
        },
        job = {"all"},
        distance = Config.MaxDistance
    })
end)

RegisterNetEvent("tr-sit:Sit", function(data)
	local playerPed = PlayerPedId()

	if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
		WakeUp()
	end

	if disableControls then
		DisableControlAction(1, 37, true)
	end

	local object, distance = data.entity, #(GetEntityCoords(playerPed) - GetEntityCoords(data.entity))

	if distance and distance < Config.MaxDistance then
		local hash = GetEntityModel(object)

		for k,v in pairs(Config.Sitable) do
			if GetHashKey(k) == hash then
				sit(object, k, v)
				break
			end
		end
	end
end)
