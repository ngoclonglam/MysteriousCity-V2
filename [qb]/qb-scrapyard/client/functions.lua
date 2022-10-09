local QBCore = exports['qb-core']:GetCoreObject()

Notifier = exports['pNotify']
Alert = exports['ps-dispatch']

local mCurrentCops = 0
local mAssignedJob = {}
local mJobPoints = 0
local mNextJobPoints = Config.JobRank[#Config.JobRank].pts

local mClosestScrapyard = 0
local mIsEmailSent = false
local mIsBusy = false

-- Util Functions

-- Load Model
local function loadModel(model)
	RequestModel(model); while not HasModelLoaded(model) do Wait(1) end
end

-- Function to create job ped(s):
local function createPed(type, model, x, y, z, heading)
	loadModel(model)
	local NPC = CreatePed(type, GetHashKey(model), x, y, z, heading, true, true)
	SetEntityAsMissionEntity(NPC)
	return NPC
end

-- Load Anim
local function loadAnimDict(animDict)
	RequestAnimDict(animDict); while not HasAnimDictLoaded(animDict) do Wait(1) end
end

local function setupPed(rank)
    local armor = Config.GoonAttributes[#Config.GoonAttributes].armor
    local accuracy = Config.GoonAttributes[#Config.GoonAttributes].accuracy
    if Config.GoonAttributes[rank] then
        armor = Config.GoonAttributes[rank].armor
        accuracy = Config.GoonAttributes[rank].accuracy
    end

    local weapon = Config.GoonWeapons[#Config.GoonWeapons][math.random(1, #Config.GoonWeapons[#Config.GoonWeapons])]
    if Config.GoonWeapons[rank] then
        weapon = Config.GoonWeapons[rank][math.random(1, #Config.GoonWeapons[rank])]
    end

    local ped = {
        model = Config.Goons["Model"][math.random(1, #Config.Goons["Model"])],
        anim = Config.Goons["Anim"][math.random(1, #Config.Goons["Anim"])],
        armor = armor,
        accuracy = accuracy,
        weapon = weapon,
    }
    return ped
end

local function drawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Local Functions

local function isVehicleValid(vehiclePlate)
	local retval = false
    if GetAssignedVehiclePlate() == vehiclePlate then
        retval = true
    end
	return retval
end

-- Global Functions

CreateThread(function()
	for id in pairs(Config.Locations) do
        if Config.Locations[id]["showBlip"] then
            local blip = AddBlipForCoord(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z)
            SetBlipSprite(blip, 380)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.7)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, 9)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Lang:t('text.scrapyard'))
            EndTextCommandSetBlipName(blip)
        end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		if mClosestScrapyard ~= 0 then
			local pos = GetEntityCoords(PlayerPedId())
			if #(pos - vector3(Config.Locations[mClosestScrapyard]["deliver"].x, Config.Locations[mClosestScrapyard]["deliver"].y, Config.Locations[mClosestScrapyard]["deliver"].z)) < 10.0 then
				if IsPedInAnyVehicle(PlayerPedId()) then
					local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
					if vehicle ~= 0 and vehicle ~= nil then
						local vehpos = GetEntityCoords(vehicle)
						if #(pos - vector3(vehpos.x, vehpos.y, vehpos.z)) < 2.5 and not mIsBusy then
							drawText3Ds(vehpos.x, vehpos.y, vehpos.z, Lang:t('text.disassemble_vehicle'))
							if IsControlJustReleased(0, 38) then
								if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                                    local vehiclePlate = QBCore.Functions.GetPlate(vehicle)
									if isVehicleValid(vehiclePlate) then
										QBCore.Functions.TriggerCallback('qb-scrapyard:checkOwnerVehicle',function(retval)
                                            if #Config.CompleteJobs[PlayerData.citizenid] == Config.MaxAllowedJobs then
                                                SendNotification(Lang:t('error.limit_reached'), "error")
                                                return
                                            end
											if retval then
                                                -- Don't trigger police alert
                                                -- SendAlert(Lang:t('alert.police_alert'), vehicle)
												ScrapVehicle(vehicle)
											else
												SendNotification(Lang:t('error.smash_own'), "error")
											end
										end,vehiclePlate)
									else
										SendNotification(Lang:t('error.cannot_scrap'), "error")
									end
								else
									SendNotification(Lang:t('error.not_driver'), "error")
								end
							end
						end
					end
				end
			end
            -- addon feature: if use target disable drawtext, we're gonna use ped instead
			if #(pos - vector3(Config.Locations[mClosestScrapyard]["list"].x, Config.Locations[mClosestScrapyard]["list"].y, Config.Locations[mClosestScrapyard]["list"].z)) < 1.5 and not Config.UseTarget then
				if not IsPedInAnyVehicle(PlayerPedId()) and not mIsEmailSent then
					drawText3Ds(Config.Locations[mClosestScrapyard]["list"].x, Config.Locations[mClosestScrapyard]["list"].y, Config.Locations[mClosestScrapyard]["list"].z, Lang:t('text.email_list'))
					if IsControlJustReleased(0, 38) then
						CreateListEmail()
					end
				end
			end
		end
	end
end)

function ScrapVehicle(vehicle)
	mIsBusy = true
	local scrapTime = math.random(28000, 37000)
	ScrapVehicleAnim(scrapTime)
	QBCore.Functions.Progressbar("scrap_vehicle", Lang:t('text.demolish_vehicle'), scrapTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		TriggerServerEvent("qb-scrapyard:server:ScrapVehicle", QBCore.Functions.GetPlate(vehicle), mCurrentCops)
		SetEntityAsMissionEntity(vehicle, true, true)
		DeleteVehicle(vehicle)
		mIsBusy = false
	end, function() -- Cancel
		StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		mIsBusy = false
		SendNotification(Lang:t('error.canceled'), "error")
	end)
end

function SetClosestScrapyard()
	local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
	for id in pairs(Config.Locations) do
		if current ~= nil then
			if #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z)) < dist then
				current = id
				dist = #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z))
			end
		else
			dist = #(pos - vector3(Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z))
			current = id
		end
	end
	mClosestScrapyard = current
end

function ScrapVehicleAnim(time)
    time = (time / 1000)
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    local openingDoor = true
    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
			time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

function SendNotification(msg, type, timeout)
    if Config.EnableAddOnNotifer and Notifier then
        Notifier:SendNotification({text = msg, type=type, timeout = timeout})
    else
        QBCore.Functions.Notify(msg, type, timeout)
    end
end

function SendAlert(msg, veh)
    if Config.EnableAddOnAlert and Alert then
        Alert:CarDisassembled(veh)
    else
        TriggerServerEvent('police:server:policeAlert', msg)
    end
end

function SendEmail()
    local vehModel = mAssignedJob["vehicle"]["model"]
    local vehName = QBCore.Shared.Vehicles[vehModel].name.." "..QBCore.Shared.Vehicles[vehModel].brand
    CreateThread(function ()
        -- Wait(5 * 60 * 1000)
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message = Lang:t("email.message", { value = vehName }),
            button = {
                enabled = true,
                buttonEvent = "qb-scapyard:client:acceptJob",
                buttonData = { vehModel = vehModel, }
            }
        })

        local title = Lang:t('phone.title')
        local text = Lang:t('phone.text')
        local icon = "fas fa-briefcase"
        local color = "green"
        local timeout = Config.NotificationTimeout
        local maxRetries = 12
        while maxRetries > 0 and mAssignedJob["vehicle"] and not mAssignedJob["vehicle"]["location"] do
            TriggerEvent('qb-phone:client:CustomNotification', title, text, icon, color, timeout)
            maxRetries = maxRetries - 1
            Wait(5 * 60 * 1000) -- Resent notification every 5 minutes
        end
    end)
end

function SetCopCount(amount)
    mCurrentCops = amount
end

function AssignedVehicle()
    local maxRank = 0
    for k, v in ipairs(Config.JobRank) do
        if mJobPoints >= v.pts then maxRank = k end
    end
    mAssignedJob["rank"] = math.random(maxRank)
    local rank = mAssignedJob["rank"]

    mAssignedJob["vehicle"] = {}
    mAssignedJob["vehicle"]["model"] = Config.Vehicles[1][math.random(#Config.Vehicles[1])]
    if Config.Vehicles[rank] then
        mAssignedJob["vehicle"]["model"] = Config.Vehicles[rank][math.random(#Config.Vehicles[rank])]
    end
end

function SpawnVehicle(vehModel)
    mAssignedJob["vehicle"] = mAssignedJob["vehicle"] or {}

    if not mAssignedJob["vehicle"] or mAssignedJob["vehicle"]["model"] ~= vehModel then
        SendNotification(Lang:t('error.email_expired'),"error", 10000)
        return
    end

    local location = nil
    local heading
    local spawnLocation = Config.SpawnLocations[math.random(mAssignedJob["rank"] or 1)]

    while not location do
        local parking = spawnLocation[math.random(#spawnLocation)]
        local parkingSpots = parking["ParkingSpots"]
        for _, parkingSpot in ipairs(parkingSpots) do
            local veh, distance = QBCore.Functions.GetClosestVehicle(vector3(parkingSpot.x,parkingSpot.y, parkingSpot.z))
            if veh == -1 or distance >= 1.5 then
                location = parkingSpot
                heading = location.w
                break
            end
        end
    end

    QBCore.Functions.SpawnVehicle(vehModel, function(veh)
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipColour(blip, 3)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 3)
        
        SetEntityHeading(veh, heading)

        mAssignedJob["vehicle"]["entity"] = veh
        mAssignedJob["vehicle"]["location"] = location
        mAssignedJob["vehicle"]["plate"] = QBCore.Functions.GetPlate(veh)
        mAssignedJob["blip"] = blip
        SendNotification(Lang:t("success.vehicle_location"), "success", Config.NotificationTimeout)
        TriggerServerEvent("qb-scrapyard:server:SetAssignedVehicle", mAssignedJob["vehicle"]["plate"])
    end, location, true)
end

function GetAssignedJob()
    mAssignedJob["vehicle"] = mAssignedJob["vehicle"] or {}
    return mAssignedJob["vehicle"]["model"]
end

function GetAssignedVehiclePlate()
    mAssignedJob["vehicle"] = mAssignedJob["vehicle"] or {}
    return mAssignedJob["vehicle"]["plate"]
end

function SpawnVehicleOwner()
    CreateThread(function ()
        mAssignedJob["vehicle"] = mAssignedJob["vehicle"] or {}

        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local location = mAssignedJob["vehicle"]["location"]
        local rank = mAssignedJob["rank"]
        local distance = #(coords-vector3(location.x, location.y, location.z))
        local target = Config.JobInfo[rank] or Config.JobInfo[#Config.JobInfo]
        local goons = {}

        while location and not mAssignedJob["vehicle"]["haskey"] do
            Wait(500)
            if distance < 100.0 and not mAssignedJob["vehicle"]["pedspawned"] then
                ClearAreaOfPeds(location.x, location.y, location.z, 10.0, 1)
                SetPedRelationshipGroupHash(player, GetHashKey("PLAYER"))
                AddRelationshipGroup('JobNPCs')
                for i = 1, target.maxguard do
                    local t1 = setupPed(rank)
                    goons[i] = createPed(4, t1.model, location.x + math.random(10, 30), location.y + math.random(10, 30), location.z)
                    NetworkRegisterEntityAsNetworked(goons[i])
                    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(goons[i]), true)
                    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(goons[i]), true)
                    SetPedCanSwitchWeapon(goons[i], true)
                    SetPedArmour(goons[i], t1.armor)
                    SetPedAccuracy(goons[i], t1.accuracy)
                    SetEntityVisible(goons[i], true)
                    SetPedCombatAbility(goons[i], 2)
                    loadAnimDict(t1.anim.dict)
                    TaskPlayAnim(goons[i], t1.anim.dict, t1.anim.lib, 8.0, -8, -1, 49, 0, 0, 0, 0)
                    GiveWeaponToPed(goons[i], GetHashKey(t1.weapon), 255, false, false)
                    SetPedDropsWeaponsWhenDead(goons[i], false)
                    SetPedCombatAttributes(goons[i], false)
                    SetPedFleeAttributes(goons[i], 0, false)
                    SetPedEnableWeaponBlocking(goons[i], true)
                    SetPedRelationshipGroupHash(goons[i], GetHashKey("JobNPCs"))
                    TaskGuardCurrentPosition(goons[i], 15.0, 15.0, 1)
                end
                mAssignedJob["vehicle"]["pedspawned"] = true
            end
            -- Activate NPC's:
            if distance < 60.0 and mAssignedJob["vehicle"]["pedspawned"] and not mAssignedJob["player"] then
                SetPedRelationshipGroupHash(player, GetHashKey("PLAYER"))
                AddRelationshipGroup('JobNPCs')
                for i = 1, #goons do
                    ClearPedTasksImmediately(goons[i])
                    TaskCombatPed(goons[i], player, 0, 16)
                    SetPedFleeAttributes(goons[i], 0, false)
                    SetPedCombatAttributes(goons[i], 5, true)
                    SetPedCombatAttributes(goons[i], 16, true)
                    SetPedCombatAttributes(goons[i], 46, true)
                    SetPedCombatAttributes(goons[i], 26, true)
                    SetPedSeeingRange(goons[i], 75.0)
                    SetPedHearingRange(goons[i], 50.0)
                    SetPedEnableWeaponBlocking(goons[i], true)
                end
                SetRelationshipBetweenGroups(0, GetHashKey("JobNPCs"), GetHashKey("JobNPCs"))
                SetRelationshipBetweenGroups(5, GetHashKey("JobNPCs"), GetHashKey("PLAYER"))
                SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("JobNPCs"))
                mAssignedJob["player"]  = true
            end
        end
    end)
end

function LockpickFinish(success)
    if success then
        SetClosestScrapyard()
        if mAssignedJob["blip"] then RemoveBlip(mAssignedJob["blip"]) end
        local location = Config.Locations[mClosestScrapyard].deliver
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipColour(blip, 3)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 3)
        mAssignedJob["vehicle"]["location"] = nil
        mAssignedJob["deliver"] = location
        mAssignedJob["blip"] = blip
        mAssignedJob["vehicle"]["haskey"] = true
        SendNotification(Lang:t("success.scrap_location"), "success", Config.NotificationTimeout)
    end
end

function ResetJob(success)
    if mAssignedJob["blip"] then RemoveBlip(mAssignedJob["blip"]) else return end
    mAssignedJob = {}
    if success then
        SendNotification(Lang:t("success.job_accomplished"), "success", Config.NotificationTimeout)
    else
        SendNotification(Lang:t("error.job_failed"), "error", Config.NotificationTimeout)
    end
end

function UpdatePlayerData()
    PlayerData = QBCore.Functions.GetPlayerData()
    mJobPoints = PlayerData.metadata[Config.JobMetadata] or 0
end

function GetJobTitle()
    local title = Config.JobRank[1].title -- init level
    for _, rank in ipairs(Config.JobRank) do
        if mJobPoints >= rank.pts then
            title = rank.title
        elseif mNextJobPoints > rank.pts then
            mNextJobPoints = rank.pts
        end
    end
    return title
end

function GetJobPoints()
    return mJobPoints
end

function GetNextJobPoints()
    return mNextJobPoints
end