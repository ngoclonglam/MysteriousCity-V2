local spawnedPeds = {}
local lastCoords = nil
local playerCoords

CreateThread(function()
	while true do
		Wait(500)
        playerCoords = GetEntityCoords(PlayerPedId())
        if lastCoords and #(playerCoords - lastCoords) <= Config.DistanceSpawn then
            Wait(1000)
            goto next
        else
            lastCoords = playerCoords
        end
		for k,v in pairs(Config.PedList) do
			local distance = #(playerCoords - v.coords.xyz)

			if distance < Config.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end

			if distance >= Config.DistanceSpawn and spawnedPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
        ::next::
	end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end

	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end

	SetEntityAlpha(spawnedPed, 0, false)

	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end

	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end

	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(50)
		end

		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end

	if Config.FadeIn then
		for i = 0, 255, 51 do
			Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end

	return spawnedPed
end

exports('RegisterPed', function(data)
    if not data or type(data) ~= "table" or not next (data) then return end -- Return immediately if ped's data is nil
    -- Check if vector existing or used
    for _, ped in ipairs(Config.PedList) do
        local distance = #(ped.coords - data.coords)
        if distance == 0 then
            print("Location for ped at ("..data.coords.x..","..data.coords.y..","..data.coords.z..") has been used")
            return -- Return immediately if coords has been used by another ped
        end
    end
    
    Config.PedList[#Config.PedList+1] = {
        model = data.model or `csb_cop`, -- Model name as a hash.
        coords = data.coords,
        gender = data.gender or 'male',  -- The gender of the ped, used for the CreatePed native.
        animDict = data.animDict or "anim@amb@nightclub@peds@",
        animName = data.animName or "rcmme_amanda1_stand_loop_cop"
    }
end)