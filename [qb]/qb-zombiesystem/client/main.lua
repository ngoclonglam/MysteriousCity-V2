local QBCore = exports['qb-core']:GetCoreObject()
local zoneName = 'zombie-zone'
local entitys = {}

local Models = {
    "u_m_y_zombie_01",
}

local walks = {
	"move_m@drunk@verydrunk",
	"move_m@drunk@moderatedrunk",
	"move_m@drunk@a",
	"anim_group_move_ballistic",
	"move_lester_CaneUp",
}

-- Functions -- 
function SpawnZombie()
    AddRelationshipGroup("zombie")
    SetRelationshipBetweenGroups(0, GetHashKey("zombie"), GetHashKey("zombie"))
	SetRelationshipBetweenGroups(5, GetHashKey("zombie"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("zombie"))

	while #entitys < Config.ZombieAmount do
        print('spawn')
		Wait(1)
        EntityModel = Models[math.random(1, #Models)]
		EntityModel = string.upper(EntityModel)
		RequestModel(GetHashKey(EntityModel))
		while not HasModelLoaded(GetHashKey(EntityModel)) or not HasCollisionForModelLoaded(GetHashKey(EntityModel)) do
			Wait(1)
        end

		local zombie = GenerateZombieCoords()
        local entity = CreatePed(4, GetHashKey(EntityModel), zombie.x, zombie.y, zombie.z, 0.0, true, false)
        local walk = walks[math.random(1, #walks)]

        RequestAnimSet(walk)
        while not HasAnimSetLoaded(walk) do
            Wait(1)
        end
        --TaskGoToEntity(entity, PlayerPedId(), -1, 0.0, 1.0, 1073741824, 0)
        SetPedMovementClipset(entity, walk, 1.0)
        TaskWanderStandard(entity, 1.0, 10)
        SetCanAttackFriendly(entity, true, true)
        SetPedCanEvasiveDive(entity, false)
        SetPedRelationshipGroupHash(entity, GetHashKey("zombie"))
        SetPedCombatAbility(entity, 0)
        SetPedCombatRange(entity,0)
        SetPedCombatMovement(entity, 0)
        SetPedAlertness(entity,0)
        SetPedIsDrunk(entity, true)
        SetPedConfigFlag(entity,100,1)
        ApplyPedDamagePack(entity,"BigHitByVehicle", 0.0, 9.0)
        ApplyPedDamagePack(entity,"SCR_Dumpster", 0.0, 9.0)
        ApplyPedDamagePack(entity,"SCR_Torture", 0.0, 9.0)
        DisablePedPainAudio(entity, true)
        StopPedSpeaking(entity,true)
        SetEntityAsMissionEntity(entity, true, true)

        if not NetworkGetEntityIsNetworked(entity) then
            NetworkRegisterEntityAsNetworked(entity)
        end

        entitys[#entitys+1] = entity

        for i, zom in pairs(entitys) do
			if not DoesEntityExist(zom) then
				SetEntityAsNoLongerNeeded(zom)
				table.remove(entitys, i)
			-- else
			-- 	local playerX, playerY, _ = table.unpack(GetEntityCoords(PlayerPedId(), true))
			-- 	local pedX, pedY, _ = table.unpack(GetEntityCoords(zom, true))	

			-- 	if pedX < playerX - Config.DespawnDistance or pedX > playerX + Config.DespawnDistance or pedY < playerY - Config.DespawnDistance or pedY > playerY + Config.DespawnDistance then
			-- 		local model = GetEntityModel(zom)
			-- 		SetEntityAsNoLongerNeeded(zom)
			-- 		SetModelAsNoLongerNeeded(model)
			-- 		--Trace("zom Eliminated\n")
			-- 		table.remove(entitys, i)
			-- 	end
			end

			if IsEntityInWater(zom) then
				local model = GetEntityModel(zom)
				SetEntityAsNoLongerNeeded(zom)
				SetModelAsNoLongerNeeded(model)
				DeleteEntity(zom)
				table.remove(entitys,i)
				--Trace("Zombie Eliminated from Water\n")
			end
		end
	end
end

-- Validate Coordinates
function ValidateZombieCoord(zombieCoord)
	if #entitys > 0 then
		local validate = true
		for _, v in pairs(entitys) do
			if #(zombieCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if #(zombieCoord - Config.SpawnZombie.coords) > 150 then
			validate = false
		end
		return validate
	else
		return true
	end
end

-- Generate Box Coords
function GenerateZombieCoords()
	while true do
		Wait(1)
		local zombieCoordX, zombieCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-100, 100)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-100, 100)
		zombieCoordX = Config.SpawnZombie.coords.x + modX
		zombieCoordY = Config.SpawnZombie.coords.y + modY
		local coordZ = GetCoordZPlants(zombieCoordX, zombieCoordY)
		local coord = vector3(zombieCoordX, zombieCoordY, coordZ)
		if ValidateZombieCoord(coord) then
			return coord
		end
	end
end

-- Check Height of Coordinates
function GetCoordZPlants(x, y)
	local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
	for _, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 39.94
end

local function pickupDead(data)
    local player = PlayerPedId()
    QBCore.Functions.Progressbar("pick_dead", "Tìm kiếm xác zombie..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16
    }, {}, {}, function() -- Done
        ClearPedSecondaryTask(player)
		local model = GetEntityModel(data.zomb)
        SetEntityAsNoLongerNeeded(data.zomb)
		SetModelAsNoLongerNeeded(model)
        DeleteEntity(data.zomb)
		table.remove(entitys, data.key)
        takeGun()
		TriggerServerEvent('qb-zombie:server:takeDead')
	end, function()
		ClearPedSecondaryTask(player)
	end) -- Cancel
end

-- Threads
if Config.Halloween then
    CreateThread(function()
        while true do
            local hour = GetClockHours()
            if hour < Config.TimeStart and hour > Config.TimeEnd then
                Wait(10000)
            else
                SpawnZombie()
                for _, zomb in pairs(entitys) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local zomCoords = GetEntityCoords(zomb)
                    if #(playerCoords - zomCoords) < 0.6 then
                        if IsPedRagdoll(zomb, 1) ~= 1 then
                            if not IsPedGettingUp(zomb) then
                                RequestAnimDict("misscarsteal4@actor")
                                TaskPlayAnim(zomb,"misscarsteal4@actor","stumble",1.0, 1.0, 500, 9, 1.0, 0, 0, 0)
                                local playerPed = PlayerPedId()
                                local maxHealth = GetEntityMaxHealth(playerPed)
                                local health = GetEntityHealth(playerPed)
                                local newHealth = math.min(maxHealth, math.floor(health - maxHealth / 8))
                                SetEntityHealth(playerPed, newHealth)
                                Wait(2000)
                                TaskGoToEntity(zomb, playerPed, -1, 0.0, 1.0, 1073741824, 0)
                                --TaskGoStraightToCoord(entity, playerX, playerY, playerZ, 1.0, 0, 0,0)
                            end
                        end
                    else
                        Wait(500)
                    end
                end
            end
            Wait(1)
        end
    end)
end

if Config.ZombieDrop then
    CreateThread(function()
        while true do
            Wait(1)
            for i, zombDead in pairs(entitys) do
                if not DoesEntityExist(zombDead) then
                    table.remove(entitys, i)
                end

                if IsPedDeadOrDying(zombDead, 1) == 1 then
                    if GetPedSourceOfDeath(zombDead) == PlayerPedId() then
                        if not IsPedInAnyVehicle(PlayerPedId(), false) then
                            exports['qb-target']:AddTargetEntity(zombDead, {
                                options = {
                                    {
                                        icon = "fa-solid fa-hammer",
                                        label = "Lụm Đồ",
                                        key = i,
                                        zomb = zombDead,
                                        action = function()
                                            pickupDead()
                                        end
                                    }
                                },
                                distance = 3.0
                            })
                        end
                    end
                end
            end
        end
    end)
end