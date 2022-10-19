-------------------------------------
------- Created by T1GER#9080 -------
-------------------------------------

QBCore = exports['qb-core']:GetCoreObject()
local ESXMenu = exports['esx_menu_default']:GetMenu()

-- ## Plant Drugs ## --

local fieldplant = {
	{
		coords = vector3(1848.38, 4906.7, 44.27)
	},
	{
		coords = vector3(2602.18, 4881.77, 35.6)
	},
	{
		coords = vector3(2934.31, 4542.11, 49.01)
	},
	{
		coords = vector3(309.99, 4334.84, 49.1)
	}
}

local place = fieldplant[math.random(#fieldplant)]
print(place.coords)

local props = {}

-- ## Plant Drugs ## --

local player, coords = nil, {}
CreateThread(function()
    while true do player = PlayerPedId(); coords = GetEntityCoords(player); Wait(500) end
end)

local online_cops = 0
RegisterNetEvent('t1ger_drugs:updateCopsCount')
AddEventHandler('t1ger_drugs:updateCopsCount', function(count)
	online_cops = count
end)

local Job_NPC, lab_blips = {entity = nil, blip = nil}, {}
RegisterNetEvent('t1ger_drugs:intializeDrugs')
AddEventHandler('t1ger_drugs:intializeDrugs', function()
    if Job_NPC.entity then DeleteEntity(Job_NPC.entity); Wait(250) end
	-- Create NPC:
	local cfg = Config.DrugJobs.NPC
	T1GER_LoadModel(cfg.model)
	Job_NPC.entity = CreatePed(7, cfg.model, cfg.pos.x, cfg.pos.y, (cfg.pos.z - 0.98), cfg.heading, false, false)
	FreezeEntityPosition(Job_NPC.entity, true)
	SetBlockingOfNonTemporaryEvents(Job_NPC.entity, true)
	TaskStartScenarioInPlace(Job_NPC.entity, cfg.scenario, 0, false)
	SetEntityInvincible(Job_NPC.entity, true)

	-- Create NPC Blip:
	Job_NPC.blip = T1GER_CreateBlip(cfg.pos, Config.Blips[cfg.blip])

	-- Create Lab Blips:
	for _, v in pairs(Config.DrugLabs) do
		if v.blip then
			local data = Config.Blips[v.type]
			local return_blip = T1GER_CreateBlip(v.pos, data)
			-- table.insert(lab_blips, return_blip)
			lab_blips[#lab_blips + 1] = return_blip
		end
	end
end)

-- ## DRUG LABS ## --
local inside_lab = false
local closest_lab = 0

CreateThread(function()
    while true do
		Wait(1)
		local sleep = true
		for k, v in pairs(Config.DrugLabs) do
			local distance = #(coords - v.pos)
			local mk = Config.Markers[v.type]
			if distance < mk.drawDist then
				sleep = false
				if distance > 1.0 then
					DrawMarker(mk.type, v.pos.x, v.pos.y, v.pos.z, 0, 0, 0, 180.0, 0, 0, mk.scale.x, mk.scale.y, mk.scale.z,mk.color.r,mk.color.g,mk.color.b,mk.color.a, false, true, 2, false, false, false, false)
				end
				if distance <= 1.0 then
					T1GER_DrawTxt(v.pos.x, v.pos.y, v.pos.z, Config.DrugTypes[v.type].enter.text)
					if IsControlJustPressed(0, Config.DrugTypes[v.type].enter.key) then
						EnterClosestDrugLab(k,v)
						closest_lab = k
					end
				end
			end
		end
		if sleep then Wait(1000) end
	end
end)

local function isClosetField()
    local ped     = PlayerPedId()
    local coord   = GetEntityCoords(ped)
    local temp    = {}
	local dist = #(coord - place.coords)

	temp[#temp + 1] = {
		dist = dist,
		coords = coords
	}

    table.sort(temp, function(a,b) return a.dist < b.dist end)
    
    return temp[1]
end

local function isClosetPlant()
    local temp = {}

    for k, v in pairs(props) do
        local dist = #(v.coords - coords)

        -- table.insert(temp, {key = k, dist = dist})
        temp[#temp + 1] = {
            key = k,
            dist = dist
        }
    end

    table.sort(temp, function(a,b) return a.dist < b.dist end)
    
    return temp[1]
end

function EnterClosestDrugLab(id,val)
	T1GER_LoadModel(Config.Shells[val.shell].prop)
	local data = {}
	QBCore.Functions.TriggerCallback('t1ger_drugs:getLabCache', function(result)
		if next(result) then
			data = result
		else
			if Config.DrugLabs[id].creating == nil then
				TriggerServerEvent('t1ger_drugs:creatingLab', id, true)
				data = CreateShellObject(id,val,false)
			else
				return TriggerEvent('t1ger_drugs:notify', Lang['lab_being_created'])
			end
		end
	end, id)
	while next(data) == nil do Wait(100) end
	-- Check if shell exists:
	local obj_entity = NetworkGetEntityFromNetworkId(data.shell_netid)
	T1GER_GetControlOfEntity(obj_entity)
	local can_enter, recreate_lab = false, false
	if DoesEntityExist(obj_entity) then
		if #(GetEntityCoords(obj_entity) - data.shell_coords) < 1.5 then can_enter = true else recreate_lab = true end
	else
		recreate_lab = true
	end
	if recreate_lab then; data = CreateShellObject(id,val,true); while next(data) == nil do Wait(100) end; can_enter = true end
	while not can_enter do Wait(100) end
	-- Teleport:
	FadeTransition(true, 1000, false, 0)
	inside_lab = true
	SetEntityCoords(player, data.offsets.exit.x, data.offsets.exit.y, data.offsets.exit.z)
	SetEntityHeading(player, data.offsets.cfg.heading)
	FadeTransition(false, 1500, true, 1000)
end

-- local test_pos = nil
function CreateShellObject(id,val,recreate)
	-- Get Shell Coords:
	local shell_pos = GetSafeShellCoords(val.pos)
	-- test_pos = shell_pos
	-- Create Shell Object:
	local shell_created, shell_obj, shell_netid, shell_coords = CreateLabShell(id,val,shell_pos)
	while not shell_created do Wait(10) end
	-- offsets:
	local offsets_data = {}
	offsets_data.cfg = Config.Offsets[val.shell]
	offsets_data.exit = GetOffsetFromEntityInWorldCoords(shell_obj, offsets_data.cfg.exit.x, offsets_data.cfg.exit.y, offsets_data.cfg.exit.z)
	offsets_data.process = GetOffsetFromEntityInWorldCoords(shell_obj, offsets_data.cfg.process_pos.x, offsets_data.cfg.process_pos.y, offsets_data.cfg.process_pos.z)
	offsets_data.process_h = offsets_data.cfg.process_h
	offsets_data.package = GetOffsetFromEntityInWorldCoords(shell_obj, offsets_data.cfg.package_pos.x, offsets_data.cfg.package_pos.y, offsets_data.cfg.package_pos.z)
	offsets_data.package_h = offsets_data.cfg.package_h
	-- lab NPC:
	local NPC_Created, NPC, NPC_Net, NPC_COORDS = CreateLabPed(id, val, offsets_data.process, offsets_data.process_h)
	while not NPC_Created do Wait(10) end
	-- Sync Data:
	local data = { id = id, val = val, type = val.type, shell_obj = shell_obj, shell_netid = shell_netid, shell_coords = shell_coords, ped = NPC_Net, offsets = offsets_data }
	local data_synced = false
	if not recreate then
		data.process = {}
		data.package = {}
		data_synced = true
	else
		QBCore.Functions.TriggerCallback('t1ger_drugs:getLabCache', function(cache)
			data.process = cache.process
			data.package = cache.package
			data_synced = true
		end, id)
	end
	while not data_synced do
		Wait(100)
	end
	TriggerServerEvent('t1ger_drugs:sendCacheSV', id, data)
	TriggerServerEvent('t1ger_drugs:creatingLab', id, false)
	return data
end

function CreateLabShell(id,val,pos)
	local object = CreateObject(Config.Shells[val.shell].prop, pos.x, pos.y, pos.z, true, true)
	FreezeEntityPosition(object, true)
	SetEntityCoords(object, pos.x, pos.y, pos.z)
	-- Sync Shell:
	SetEntityAsMissionEntity(object, true, true)
	NetworkRegisterEntityAsNetworked(object)
	local net_id = NetworkGetNetworkIdFromEntity(object)
	SetNetworkIdCanMigrate(net_id, false)
	SetNetworkIdExistsOnAllMachines(net_id, true)
	NetworkSetNetworkIdDynamic(net_id, true)
	return true, object, net_id, pos
end

function CreateLabPed(_, val, pos, heading)
	local NPC_cfg = Config.DrugTypes[val.type].process
	local NPC = T1GER_CreatePed(7, NPC_cfg.model, pos.x, pos.y, pos.z, heading)
	FreezeEntityPosition(NPC, true)
	SetBlockingOfNonTemporaryEvents(NPC, true)
	SetEntityInvincible(NPC, true)
	NetworkRegisterEntityAsNetworked(NPC)
	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(NPC), false)
	local NPC_Net = PedToNet(NPC)
	SetNetworkIdExistsOnAllMachines(NPC_Net, true)
	NetworkSetNetworkIdDynamic(NPC_Net, true)
	-- NPC Anim:
	T1GER_LoadAnim(NPC_cfg.anim_dict)
	if next(NPC_cfg.props) then
		for i = 1, #NPC_cfg.props do
			local NPC_pos = GetEntityCoords(NPC)
			T1GER_LoadModel(NPC_cfg.props[i].model)
			local object = CreateObject(GetHashKey(NPC_cfg.props[i].model), NPC_pos.x, NPC_pos.y, (NPC_pos.z + 0.2),  true,  true, true)
			local boneIndex, obj_pos, obj_rot = GetPedBoneIndex(NPC, NPC_cfg.props[i].boneIndex), NPC_cfg.props[i].pos, NPC_cfg.props[i].rot
			AttachEntityToEntity(object, NPC, boneIndex, obj_pos.x, obj_pos.y, obj_pos.z, obj_rot.x, obj_rot.y, obj_rot.z, true, true, false, true, 1, true)
			Wait(50)
		end
	end
	TaskPlayAnim(NPC, NPC_cfg.anim_dict, NPC_cfg.anim_lib, 1.0, -1.0, -1, 25, 0, 0, 0, 0)
	return true, NPC, NPC_Net, pos
end

local processing, packaging = false, false
CreateThread(function()
    while true do
		Wait(1)
		local sleep = true
		if closest_lab ~= 0 then
			local cur_lab = Config.DrugLabs[closest_lab]
			if next(cur_lab.cache) then
				local shell_dist = #(coords - cur_lab.cache.shell_coords)
				if shell_dist <= 30.0 then
					sleep = false
					-- exit:
					local exit_dist = #(coords - cur_lab.cache.offsets.exit)
					if exit_dist <= 1.5 then
						sleep = false
						T1GER_DrawTxt(cur_lab.cache.offsets.exit.x, cur_lab.cache.offsets.exit.y, (cur_lab.cache.offsets.exit.z + 1.0), Config.DrugTypes[cur_lab.type].exit.text)
						if IsControlJustPressed(0, Config.DrugTypes[cur_lab.type].exit.key) then
							FadeTransition(true, 1000, false, 0)
							inside_lab = false
							SetRainLevel(-1.0)
							SetEntityCoords(player, cur_lab.pos.x, cur_lab.pos.y, (cur_lab.pos.z - 0.975))
							SetEntityHeading(player, cur_lab.h)
							closest_lab = 0
							FadeTransition(false, 1500, true, 1000)
						end
					end
					-- processing:
					local process_dist = #(coords - cur_lab.cache.offsets.process)
					if process_dist <= 1.5 and not processing then
						sleep = false
						local draw_text, collect = Config.DrugTypes[cur_lab.type].process.give.text, false
						if next(cur_lab.cache.process) and cur_lab.cache.process.done then draw_text = Config.DrugTypes[cur_lab.type].process.collect.text; collect = true end
						T1GER_DrawTxt(cur_lab.cache.offsets.process.x, cur_lab.cache.offsets.process.y, (cur_lab.cache.offsets.process.z + 1.0), draw_text)
						if IsControlJustPressed(0, Config.DrugTypes[cur_lab.type].process.give.key) and not collect then
							print('Before Cops:', online_cops)
							TriggerServerEvent('qb-t1ger-drugs:server:fetchCops')
							print('Current Cops:', online_cops)
							Wait(2000)
							if next(cur_lab.cache.process) == nil then
								ProcessDrugs(cur_lab.cache) else TriggerEvent('t1ger_drugs:notify', Lang['already_processing'])
							end
						elseif IsControlJustPressed(0, Config.DrugTypes[cur_lab.type].process.collect.key) and collect then
							processing = true
							CollectProcessedDrugs(cur_lab.cache)
						end
					end
					if process_dist > 1.5 and processing then
						ESXMenu.UI.Menu.CloseAll()
						processing = false
					end
					-- packaging:
					local package_dist = #(coords - cur_lab.cache.offsets.package)
					if package_dist <= 1.5 and not packaging then
						if next(cur_lab.cache.package) == nil and not cur_lab.cache.in_use then
							sleep = false
							T1GER_DrawTxt(cur_lab.cache.offsets.package.x, cur_lab.cache.offsets.package.y, (cur_lab.cache.offsets.package.z + 1.0), Config.DrugTypes[cur_lab.type].package.text)
							if IsControlJustPressed(0, Config.DrugTypes[cur_lab.type].package.key) then
								PackageDrugs(cur_lab.cache)
							end
						end
					end
					if package_dist > 2.0 and packaging then
						ESXMenu.UI.Menu.CloseAll()
						packaging = false
					end
				end
			end
		end
		if sleep then Wait(1500) end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		local sleep = true
		if inside_lab then
			sleep = false
			NetworkOverrideClockTime(21, 0, 0)
			ClearOverrideWeather()
			ClearWeatherTypePersist()
			SetWeatherTypePersist('EXTRASUNNY')
			SetWeatherTypeNow('EXTRASUNNY')
			SetWeatherTypeNowPersist('EXTRASUNNY')
			SetRainLevel(0.0)
		end
		if sleep then Wait(1500) end
	end
end)

function CollectProcessedDrugs(cache)
	QBCore.Functions.TriggerCallback('t1ger_drugs:collectProcessedDrugs', function(collected)
		if not collected then
			TriggerEvent('t1ger_drugs:notify', Lang['collect_to_slow'])
		end
		processing = false
	end, cache)
end

function ProcessDrugs(cache)
	if online_cops < 2 then return exports['okokNotify']:Alert('Cảnh Sát', 'Không đủ hai cảnh sát để chế cần', 5000, 'error') end
	processing = true
	local elements = {}
	local cfg = Config.DrugTypes[cache.type].process
	table.insert(elements, {label = cfg.output.label, name = cfg.output.label, item = cfg.output.item, amount = cfg.output.amount.min, time = cfg.time, type = 'slider', value = cfg.output.amount.min, min = cfg.output.amount.min, max = cfg.output.amount.max})
	table.insert(elements, {label = Lang['required_supplies'], value = 'text'})
	for i = 1, #cfg.input do
		table.insert(elements, {label = Lang['process_input_items']:format(cfg.input[i].amount, cfg.input[i].label), name = cfg.input[i].label, item = cfg.input[i].item, amount = cfg.input[i].amount, value = cfg.input[i].amount})
	end
	table.insert(elements, {label = Lang['confirm_button'], value = 'confirm'})
	ESXMenu.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_process_main',
		{
			title    = Lang['process_menu_title']:format(cfg.output.label),
			align    = 'center',
			elements = elements
		},
	function(data, menu)
		if data.current.value == 'confirm' then
			local menu_input, menu_output, menu_time = {}, {}, 0
			for i = 1, #menu.data.elements do
				if menu.data.elements[i].type == nil and menu.data.elements[i].name then
					if menu.data.elements[i].value <= 0 then
						return TriggerEvent('t1ger_drugs:notify', Lang['adjust_slider'])
					end
					table.insert(menu_input, {item = menu.data.elements[i].item, amount = menu.data.elements[i].value, name = menu.data.elements[i].name})
				end
				if menu.data.elements[i].type == 'slider' then
					menu_output = {item = menu.data.elements[i].item, amount = menu.data.elements[i].value, name = menu.data.elements[i].name}
					menu_time = menu.data.elements[i].time
				end
			end
			local process_data = {input = menu_input, output = menu_output, time = menu_time}
			TriggerServerEvent('t1ger_drugs:sendProcessDataSV', cache, process_data)
			menu.close()
			processing = false
		end
	end, function(data, menu)
		menu.close()
		processing = false
	end, function(data, menu)
		if tonumber(data.current.value) and data.current.type == 'slider' then
			local factor = (data.current.value/data.current.amount)
			for i = 1, #elements do
				local newData = {}
				if elements[i].type == nil and elements[i].name then
					newData.value = math.ceil(factor * elements[i].amount)
					newData.label = Lang['process_input_items']:format(newData.value, elements[i].name)
					menu.update({name = elements[i].name}, newData)
				end
			end
		end
		menu.refresh()
	end)
	processing = false
end

function PackageDrugs(cache)
	if online_cops < 2 then return exports['okokNotify']:Alert('Cảnh Sát', 'Không đủ hai cảnh sát để chế cần', 5000, 'error') end
	TriggerServerEvent('t1ger_drugs:updateInUseSV', cache, true)
	packaging = true
	FreezeEntityPosition(player, true)
	SetEntityCoords(player, cache.offsets.package.x, cache.offsets.package.y, cache.offsets.package.z)
	SetEntityHeading(player, cache.offsets.package_h)
	local cfg = Config.DrugTypes[cache.type].package
	local elements = {}
	table.insert(elements, {label = cfg.output.label, name = cfg.output.label, item = cfg.output.item, amount = cfg.output.amount.min, type = 'slider', value = cfg.output.amount.min, min = cfg.output.amount.min, max = cfg.output.amount.max})
	table.insert(elements, {label = Lang['required_supplies'], value = 'text'})
	for i = 1, #cfg.input do
		table.insert(elements, {label = Lang['package_input_items']:format(cfg.input[i].amount, cfg.input[i].label), name = cfg.input[i].label, item = cfg.input[i].item, amount = cfg.input[i].amount, value = cfg.input[i].amount})
	end
	table.insert(elements, {label = Lang['confirm_button'], value = 'confirm'})
	ESXMenu.UI.Menu.CloseAll()
	ESXMenu.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_package_main',
		{
			title    = Lang['package_menu_title']:format(cfg.output.label),
			align    = 'center',
			elements = elements
		},
	function(data, menu)
		if data.current.value == 'confirm' then
			local menu_input, menu_output = {}, {}
			for i = 1, #menu.data.elements do
				if menu.data.elements[i].type == nil and menu.data.elements[i].name then
					if menu.data.elements[i].value <= 0 then
						return TriggerEvent('t1ger_drugs:notify', Lang['adjust_slider'])
					end
					table.insert(menu_input, {item = menu.data.elements[i].item, amount = menu.data.elements[i].value, name = menu.data.elements[i].name})
				end
				if menu.data.elements[i].type == 'slider' then
					menu_output = {item = menu.data.elements[i].item, amount = menu.data.elements[i].value, name = menu.data.elements[i].name}
				end
			end
			local package_data = {input = menu_input, output = menu_output}
			QBCore.Functions.TriggerCallback('t1ger_drugs:requestPackaging', function(can_package)
				menu.close()
				if can_package then
					PlaySynchronizedScene(cache)
					TriggerServerEvent('t1ger_drugs:getPackagedDrugs', cache)
				end
				FreezeEntityPosition(player, false)
				packaging = false
				TriggerServerEvent('t1ger_drugs:updateInUseSV', cache, false)
			end, package_data, cache)
		end
	end, function(_, menu)
		menu.close()
		FreezeEntityPosition(player, false)
		packaging = false
		TriggerServerEvent('t1ger_drugs:updateInUseSV', cache, false)
	end, function(data, menu)
		if tonumber(data.current.value) and data.current.type == 'slider' then
			local factor = (data.current.value/data.current.amount)
			for i = 1, #elements do
				local newData = {}
				if elements[i].type == nil and elements[i].name and elements[i].amount ~= 0 then
					newData.value = math.ceil(factor * elements[i].amount)
					newData.label = Lang['process_input_items']:format(newData.value, elements[i].name)
					menu.update({name = elements[i].name}, newData)
				end
			end
		end
		menu.refresh()
	end)
end

function PlaySynchronizedScene(lab_cache)
	local cfg = Config.Scenes[lab_cache.type]
	local scene_coords = lab_cache.offsets.package - lab_cache.offsets.cfg.scene_pos
	local scene = {
		pos = scene_coords,
		rot = lab_cache.offsets.cfg.scene_rot,
		obj = {},
		obj_count = 0,
		cache = {},
		entity_count = 1
	}
	-- load anim:
	T1GER_LoadAnim(cfg.dict)
	-- create objects for scene:
	for k,v in pairs(cfg.objects) do
		local hash_key = GetHashKey(v)
		T1GER_LoadModel(hash_key)
		scene.obj[k] = CreateObject(hash_key, scene.pos.x, scene.pos.y, scene.pos.z, true, true, true)
		SetModelAsNoLongerNeeded(hash_key)
		scene.obj_count = scene.obj_count + 1
		while not DoesEntityExist(scene.obj[k]) do Wait(0) end
		SetEntityCollision(scene.obj[k], false, false)
		Wait(10)
	end
	-- Create Scenes:
	local math_ceil = math.ceil(scene.obj_count/3)
	local math_max = math.max(1, math_ceil)
	for i = 1, math.max(1, math_max), 1 do
		scene.cache[i] = NetworkCreateSynchronisedScene(scene.pos, scene.rot, 2, false, false, 1.0, 0, 1.0)
		Wait(10)
	end
	-- Create Peds:
	NetworkAddPedToSynchronisedScene(player, scene.cache[1], cfg.dict, cfg.player_anim, 1.0, 1.0, 0, 0, 1.0, 0)
	Wait(10)
	-- Entity Animations:
	for id,anim_name in pairs(cfg.entity_anims) do
		local target_scene = scene.cache[math.ceil(scene.entity_count/3)]
		NetworkAddEntityToSynchronisedScene(scene.obj[id], target_scene, cfg.dict, anim_name, 1.0, 1.0, 1)
		scene.entity_count = scene.entity_count + 1
	end
	Wait(10)
	-- Start Scenes:
	for i = 1, #scene.cache, 1 do
		NetworkStartSynchronisedScene(scene.cache[i])
    end
	-- Create Chair:
	if cfg.chair_prop then
		local hash_key = GetHashKey(cfg.chair_prop)
		T1GER_LoadModel(hash_key)
		scene.obj['chair_obj'] = CreateObject(hash_key, lab_cache.offsets.package.x, lab_cache.offsets.package.y, lab_cache.offsets.package.z, true, true, true)
		SetModelAsNoLongerNeeded(hash_key)
		while not DoesEntityExist(scene.obj['chair_obj']) do
			Wait(10)
		end
		SetEntityHeading(scene.obj['chair_obj'], (GetEntityHeading(player)-180.0))
		SetEntityCollision(scene.obj['chair_obj'], false, false)
	end
	-- Progress Bar
	if Config.ProgressBars then
		QBCore.Functions.Progressbar('drug_use', cfg.text, cfg.time, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() end)
	end
	-- Wait Timer:
	Wait(cfg.time)
	-- Stop Scenes:
	for i = 1, #scene.cache, 1 do
		NetworkStopSynchronisedScene(scene.cache[i])
    end
	-- Remove Anim Dict:
	RemoveAnimDict(cfg.dict)
	-- Remove Objects/Entities:
	for _, v in pairs(scene.obj) do
		NetworkFadeOutEntity(v, false, false)
		DeleteEntity(v)
	end
	packaging = false
	TriggerServerEvent('t1ger_drugs:updateInUseSV', lab_cache, false)
end

function GetSafeShellCoords(pos)
	local spawn_pos = (pos - vector3(0.0, 0.0, 8.0))
	local done = false
    local player_pos = {x = GetEntityCoords(player).x, y = GetEntityCoords(player).y, z = GetEntityCoords(player).z}
	while not done do
		Wait(1)
		local objects = ObjectNearSpawnPoint(spawn_pos.x, spawn_pos.y, spawn_pos.z)
		if objects then
			if spawn_pos.z > -140.0 then
				spawn_pos = (spawn_pos + vector3(0.25,-0.25,-0.60))
			else
				spawn_pos = (spawn_pos + vector3(-0.25,0.25,0.60))
			end
		end
		objects = ObjectNearSpawnPoint(spawn_pos.x, spawn_pos.y, spawn_pos.z)
		if not objects then
			local inWater = IsPropInWater(spawn_pos)
			if not inWater then
				local RayHandle = StartShapeTestRay(player_pos.x, player_pos.y, player_pos.z, spawn_pos.x, spawn_pos.y, spawn_pos.z, 1, PlayerPedId(), 0)
				local _, hit, endCoords, surfaceNormal, object = GetShapeTestResult(RayHandle)
				if hit == 1 then
					--print('Shell Obj Hit | Generating New Safe Coords')
					player_pos.z = (player_pos.z - 5.0)
					objects = true
				else
					done = true
				end
			else
				objects = true
			end
		end
	end
	return spawn_pos
end

function IsPropInWater(pos)
	local in_water = false
	T1GER_LoadModel(2120901815)
	local ped = T1GER_CreatePed(5, 2120901815, pos.x, pos.y, pos.z, 0.0)
	local ped_coords = GetEntityCoords(ped)
    local chk,height = GetWaterHeight(ped_coords.x, ped_coords.y, ped_coords.z)
    if not IsEntityInWater(ped) and not chk then in_water = false else in_water = true end
    DeleteEntity(ped)
    SetEntityAsNoLongerNeeded(ped)
    return in_water
end

-- function to check objects near point
function ObjectNearSpawnPoint(x,y,z)
    if IsAnyObjectNearPoint(x, y, z, 15.0, false) then
        return true
    else
        return false
    end
end

function FadeTransition(fadeOut, duration, wait, timer)
	if fadeOut then
		DoScreenFadeOut(duration); while not IsScreenFadedOut() do Wait(10) end
	else
		if wait then Wait(timer) end
		DoScreenFadeIn(duration)
	end
end

-- Function To DrawText to Plant Weed
function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)    
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Plant Weed
local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

RegisterNetEvent('t1ger_drugs:useKanne', function()
    local plantS = isClosetPlant()

	if plantS then
		local k,d = plantS.key, plantS.dist

		if d <= 2.0 then
			if (props[k].water + 30.0) > 100.0 then
				props[k].water = 100.0
			else
				props[k].water = props[k].water + 30.0
			end
		end
	else
		return
	end

	TriggerServerEvent('t1ger_drugs:removeItem', 'giesskanne_voll')
end)

RegisterNetEvent('t1ger_drugs:plantWeed', function(item, label)
	if QBCore.Functions.SetTimer() then return exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn không thể trồng cần', 5000, 'warning') end
	local field = isClosetField()
	local _, distance = QBCore.Functions.GetClosestPlayer()
	local d  = field.dist
	local decrease = 1
	local x, y, z = table.unpack(coords)
	local ped = PlayerPedId()
	z = z - 5.5
	if IsPedInAnyVehicle(ped, false) then return exports['okokNotify']:Alert('Cảnh Báo', 'Bạn đang ở trong xe, không thể trồng cần được', 5000, 'error') end
	-- if item == '' then
	-- 	decrease = 2
	-- end
	if QBCore.Functions.SetTimer() then return exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn không thể trồng cần', 5000, 'warning') end
	if not next(props) then
		if d <= 100.0 then
			if distance == -1 or distance >= 3.0 then
				TriggerServerEvent('t1ger_drugs:removeItem', item, label)
				TaskStartScenarioInPlace(player, "world_human_gardener_plant", 0, false)
				QBCore.Functions.Progressbar("weed_plant", "Trồng Cần..", 5000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
					disableInventory = true,
				}, {}, {}, {}, function() -- Done
					local obj = CreateObject('bkr_prop_weed_lrg_01b', x, y, z, true, true, false)
					FreezeEntityPosition(obj, true)
					props[#props + 1] = {
						item = item,
						label = label,
						state = 0,
						water = 100,
						coords = coords,
						decrease = decrease,
						prop = obj
					}
					ClearPedTasks(player)
				end, function()
					ClearPedTasks(player)
				end) -- Cancel
			else
				exports['okokNotify']:Alert("Vị Trí", "Có người đang đứng gần bạn", 5000, "warning")
			end
		else
			exports['okokNotify']:Alert('Trồng Cần', 'Bạn không đứng ở trong cánh đồng cần', '5000', 'warning')
		end
	else
		local plantS = isClosetPlant()
        local dS = plantS.dist
		if d <= 100.0 then
			if dS >= 3.0 then
				if distance == -1 or distance >= 3.0 then
					TriggerServerEvent('t1ger_drugs:removeItem', item, label)
					TaskStartScenarioInPlace(player, "world_human_gardener_plant", 0, false)
					QBCore.Functions.Progressbar("weed_plant", "Trồng Cần..", 5000, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
						disableInventory = true,
					}, {}, {}, {}, function() -- Done
						local obj = CreateObject('bkr_prop_weed_lrg_01b', x, y, z, true, true, false)
						FreezeEntityPosition(obj, true)
						props[#props + 1] = {
							item = item,
							label = label,
							state = 0,
							water = 100,
							coords = coords,
							decrease = decrease,
							prop = obj
						}
						ClearPedTasks(player)
					end, function()
						ClearPedTasks(player)
					end) -- Cancel
				else
					exports['okokNotify']:Alert("Vị Trí", "Có người đang đứng gần bạn", 5000, "warning")
				end
			else
				exports['okokNotify']:Alert("Vị Trí", "Bạn trồng quá gần các cây khác", 5000, "error")
			end
		else
			exports['okokNotify']:Alert('Trồng Cần', 'Bạn không đứng ở trong cánh đồng cần', '5000', 'warning')
		end
	end
end)

RegisterNetEvent("t1ger_drugs:harvestWeed", function(data)
	TaskStartScenarioInPlace(player, "world_human_gardener_plant", 0, false)
	QBCore.Functions.Progressbar("pick_weed", "Hái Cần..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {}, {}, {}, function() -- Done
		DeleteObject(data.plant)
		table.remove(props, data.weed)
		ClearPedTasks(player)
		TriggerServerEvent('t1ger_drugs:getWeed')
	end, function()
		ClearPedTasks(player)
	end) -- Cancel
end)

CreateThread(function() 
	while true do 
		Wait(1500)

		for _, value in pairs(props) do
			local newState = (value.state + 1)
			
			if newState <= 100 then
				local x, y, z = table.unpack(GetEntityCoords(value.prop))
				SetEntityCoords(value.prop, x, y, z + 0.009, 0, 0, 0, false)
				value.state = value.state + 1
			end
			
		end
	end
end)

CreateThread(function() 
	while true do
		Wait(1000)
		for k, value in pairs(props) do
			if value.water <= 0 then
				SetModelAsNoLongerNeeded(value.prop)
                DeleteEntity(value.prop)
                DeleteObject(value.prop)
				table.remove(props, k)
				exports['okokNotify']:Alert('Cây Cần', 'Cây của bạn đã chết vì thiếu nước', 5000, 'warning')
			else
				-- value.water = value.water - 1
				value.water = value.water - value.decrease
			end
		end
	end
end)

CreateThread(function()
	while true do
		for key, value in pairs(props) do
			local x, y, z = table.unpack(value.coords)
			if #(coords - vector3(x, y, z)) <= 10 then
				z = z - 2.0
				Draw3DText(x, y, z + 1.000, '🌾 ' .. value.label, 4, 0.1, 0.1)
				Draw3DText(x, y, z + 1.300, '💚 ' .. (round((value.state / 100) * 100, 0)), 4, 0.1, 0.1)
				Draw3DText(x, y, z + 1.600, '🚰 ' .. (round(value.water, 0)), 4, 0.1, 0.1)

				if value.state >= 100 then
					exports['qb-target']:AddEntityZone("plant-weed-"..value.prop, value.prop, {
						name = "plant-weed-"..value.prop,
						heading = GetEntityHeading(value.prop),
						debugPoly = false,
					}, {
						options = {
							{
								type = "client",
								event = "t1ger_drugs:harvestWeed",
								icon = "fa-solid fa-scythe",
								label = "Hái Cần",
								plant = value.prop,
								weed = key,
							},
						},
						distance = 1.5
					})
					-- Phải làm cái này xong rồi mới deleteobject
					-- DeletObject(value.prop)
					-- table.remove(props, key)
				end
			end
		end
		Wait(5)
	end
end)


-- Sync Drug Labs Cache:
RegisterNetEvent('t1ger_drugs:sendCacheCL')
AddEventHandler('t1ger_drugs:sendCacheCL', function(data, id)
	Config.DrugLabs[id].cache = data
end)

-- Sync In Use States:
RegisterNetEvent('t1ger_drugs:updateInUseCL')
AddEventHandler('t1ger_drugs:updateInUseCL', function(id, state)
	Config.DrugLabs[id].cache.in_use = state
end)

-- Sync Creating Lab state:
RegisterNetEvent('t1ger_drugs:updateCreatingLab')
AddEventHandler('t1ger_drugs:updateCreatingLab', function(id, state)
	Config.DrugLabs[id].creating = state
end)

-- ## DRUG JOBS ## --

local interacting, job_started = false, false
CreateThread(function()
    while true do
		Wait(1)
		local sleep = true
		if DoesEntityExist(Job_NPC.entity) then
			local NPC_coords = GetEntityCoords(Job_NPC.entity)
			local distance = #(coords - NPC_coords)
			if distance < 2.0 and not interacting then
				sleep = false
				T1GER_DrawTxt(NPC_coords.x, NPC_coords.y, NPC_coords.z, Lang['draw_talk'])
				if IsControlJustPressed(0, Config.DrugJobs.NPC.keybind) then
					if not job_started then
						interacting = true
						DrugJobMainMenu()
					else
						TriggerEvent('t1ger_drugs:notify', Lang['u_already_have_job'])
					end
				end
			end
			if distance > 2.0 and interacting then
				ESXMenu.UI.Menu.CloseAll()
				interacting = false
			end
		end
		if sleep then Wait(1000) end
	end
end)

function DrugJobMainMenu()
	-- Talk Animation:
	local cfg = Config.DrugJobs
	T1GER_LoadAnim(cfg.NPC.ply_anim.dict)
	FreezeEntityPosition(player, true)
	TaskPlayAnim(player, cfg.NPC.ply_anim.dict, cfg.NPC.ply_anim.lib, 1.0, 0.5, -1, 31, 1.0, 0, 0)
	if Config.ProgressBars then
		QBCore.Functions.Progressbar('drug_job', Lang['progbar_talking'], cfg.NPC.ply_anim.time * 1000, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() end)
	end
	Wait(cfg.NPC.ply_anim.time * 1000)
	ClearPedTasks(player)
	FreezeEntityPosition(player, false)
	-- Build Menu:
	local elements = {}
    for i = 1, #cfg.NPC.menu do
        if cfg.NPC.menu[i].enable then
            table.insert(elements, {label = cfg.NPC.menu[i].label:format(cfg.NPC.menu[i].fees), value = cfg.NPC.menu[i]})
        end
    end
	ESXMenu.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_job_main_menu',
		{
			title    = 'Select Drug Job',
			align    = 'center',
			elements = elements
		},
	function(data, menu)
		if isCop then ESXMenu.UI.Menu.CloseAll(); interacting = false; return TriggerEvent('t1ger_drugs:notify', Lang['police_not_allowed']) end
        menu.close()
        TriggerServerEvent('t1ger_drugs:requestDrugJob', data.current.value)
        Wait(1000)
		interacting = false
	end, function(data, menu)
		menu.close()
		interacting = false
	end)
end

RegisterNetEvent('t1ger_drugs:jobConfigCL')
AddEventHandler('t1ger_drugs:jobConfigCL',function(data)
    Config.DrugJobs.Jobs = data
end)

local job_veh, job_end = nil, false

RegisterNetEvent('t1ger_drugs:drugJobEvent')
AddEventHandler('t1ger_drugs:drugJobEvent', function(num, data, veh_model)
	job_started = true
	TriggerEvent('t1ger_drugs:job_notify', Lang['go_to_the_location'])
    local job = Config.DrugJobs.Jobs[num]
	local job_complete = false
	local job_blip = T1GER_CreateBlip(job.pos, Config.Blips[job.blip])
    local job_goons, veh_lockpicked, lockpicking = {}, false, false
    local delivery = {cfg = nil, created = false, blip = nil, done = false}
    local drugs_taken, package_in_hand, package_obj = false, false, nil

    while not job_complete do
        Wait(1)
        local sleep = true
        local distance = #(coords - job.pos)
        if distance < 150 then
            sleep = false
            -- Spawn Job Vehicle:
			if distance < 100.0 and not job.veh_spawned then
				ClearAreaOfVehicles(job.pos.x, job.pos.y, job.pos.z, 10.0, false, false, false, false, false)
				job_veh = T1GER_CreateVehicle(veh_model, job.pos, job.heading)
				job.veh_spawned = true
				TriggerServerEvent('t1ger_drugs:jobConfigSV', Config.DrugJobs.Jobs)
			end
			-- Spawn Goons:
			if distance < 100.0 and not job.goons_spawned then
				ClearAreaOfPeds(job.pos.x, job.pos.y, job.pos.z, 10.0, 1)
				SetPedRelationshipGroupHash(player, GetHashKey("PLAYER"))
				AddRelationshipGroup('JobNPCs')
				for i = 1, #job.goons do
					local t1 = job.goons[i]
					job_goons[i] = T1GER_CreatePed(4, t1.model, t1.pos.x, t1.pos.y, t1.pos.z, t1.heading)
					NetworkRegisterEntityAsNetworked(job_goons[i])
					SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(job_goons[i]), true)
					SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(job_goons[i]), true)
					SetPedCanSwitchWeapon(job_goons[i], true)
					SetPedArmour(job_goons[i], t1.armor)
					SetPedAccuracy(job_goons[i], t1.accuracy)
					SetEntityVisible(job_goons[i], true)
					T1GER_LoadAnim(t1.anim.dict)
					TaskPlayAnim(job_goons[i], t1.anim.dict, t1.anim.lib, 8.0, -8, -1, 49, 0, 0, 0, 0)
					GiveWeaponToPed(job_goons[i], GetHashKey(t1.weapon), 255, false, false)
					SetPedDropsWeaponsWhenDead(job_goons[i], false)
					SetPedCombatAttributes(job_goons[i], false)
					SetPedFleeAttributes(job_goons[i], 0, false)
					SetPedEnableWeaponBlocking(job_goons[i], true)
					SetPedRelationshipGroupHash(job_goons[i], GetHashKey("JobNPCs"))
					TaskGuardCurrentPosition(job_goons[i], 15.0, 15.0, 1)
				end
				job.goons_spawned = true
				TriggerServerEvent('t1ger_drugs:jobConfigSV', Config.DrugJobs.Jobs)
			end
			-- Activate NPC's:
			if distance < 60.0 and job.goons_spawned and not job.player then
				SetPedRelationshipGroupHash(player, GetHashKey("PLAYER"))
				AddRelationshipGroup('JobNPCs')
				for i = 1, #job_goons do
					ClearPedTasksImmediately(job_goons[i])
					TaskCombatPed(job_goons[i], player, 0, 16)
					SetPedFleeAttributes(job_goons[i], 0, false)
					SetPedCombatAttributes(job_goons[i], 5, true)
					SetPedCombatAttributes(job_goons[i], 16, true)
					SetPedCombatAttributes(job_goons[i], 46, true)
					SetPedCombatAttributes(job_goons[i], 26, true)
					SetPedSeeingRange(job_goons[i], 75.0)
					SetPedHearingRange(job_goons[i], 50.0)
					SetPedEnableWeaponBlocking(job_goons[i], true)
				end
				SetRelationshipBetweenGroups(0, GetHashKey("JobNPCs"), GetHashKey("JobNPCs"))
				SetRelationshipBetweenGroups(5, GetHashKey("JobNPCs"), GetHashKey("PLAYER"))
				SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("JobNPCs"))
				job.player = true
				TriggerServerEvent('t1ger_drugs:jobConfigSV', Config.DrugJobs.Jobs)
			end
			-- Lockpick Vehicle:
			local veh_pos = GetEntityCoords(job_veh)
			local veh_dist = #(coords - veh_pos)
			if veh_dist < 2.5 and not veh_lockpicked and not lockpicking then
				T1GER_DrawTxt(veh_pos.x, veh_pos.y, veh_pos.z, Lang['draw_lockpick'])
				if IsControlJustPressed(0, Config.DrugJobs.Settings.lockpick.key) then
					lockpicking = true
					local anim = {dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', name = 'machinic_loop_mechandplayer'}
					T1GER_LoadAnim(anim.dict)
					TriggerEvent('t1ger_drugs:police_notify', Lang['shots_fired_gta'])
					SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
					Wait(250)
					FreezeEntityPosition(player, true)
					TaskPlayAnimAdvanced(player, anim.dict, anim.name, job.lockpick.pos.x, job.lockpick.pos.y, job.lockpick.pos.z, 0.0, 0.0, job.lockpick.heading, 3.0, 1.0, -1, 31, 0, 0, 0 )
					-- Car Alarm:
					if Config.DrugJobs.Settings.alarm.enable then
						SetVehicleAlarm(job_veh, true)
						SetVehicleAlarmTimeLeft(job_veh, (Config.DrugJobs.Settings.alarm.timer * 1000))
						StartVehicleAlarm(job_veh)
					end
					if Config.ProgressBars then
						QBCore.Functions.Progressbar('drug_lockpicking', Lang['progbar_lockpicking'], Config.DrugJobs.Settings.lockpick.time * 1000, false, false, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() end)
					end
					Wait(Config.DrugJobs.Settings.lockpick.time * 1000)
					ClearPedTasks(player)
					FreezeEntityPosition(player, false)
					veh_lockpicked = true
					lockpicking = false
					TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(job_veh))
					SetVehicleDoorsLockedForAllPlayers(job_veh, false)
				end
			end
            -- Create Delivery Blip & Route:
			if veh_lockpicked and not delivery.created then
				if GetEntityModel(GetVehiclePedIsIn(player, false)) == GetHashKey(veh_model) then
					if DoesBlipExist(job_blip) then RemoveBlip(job_blip) end
					math.randomseed(GetGameTimer())
					delivery.cfg = Config.DrugJobs.Delivery[math.random(1, #Config.DrugJobs.Delivery)]
					TriggerEvent('t1ger_drugs:job_notify', Lang['deliver_veh_msg'])
					if DoesBlipExist(delivery.blip) then RemoveBlip(delivery.blip) end
					delivery.blip = T1GER_CreateBlip(delivery.cfg.pos, Config.Blips[delivery.cfg.blip])
					delivery.created = true
				end
			end
        end
        -- Delivery Section:
        if delivery.created then
            local delivery_dist = #(coords - delivery.cfg.pos)
			if delivery_dist < 75.0 then
                sleep = false
                if not delivery.done then
                    local mk = Config.Markers[delivery.cfg.marker]
                    if delivery_dist < mk.drawDist then
                        if DoesEntityExist(job_veh) then
                            if GetEntityModel(GetVehiclePedIsIn(player, false)) == GetHashKey(veh_model) then
                                DrawMarker(mk.type, delivery.cfg.pos.x, delivery.cfg.pos.y, (delivery.cfg.pos.z), 0, 0, 0, 180.0, 0, 0, mk.scale.x, mk.scale.y, mk.scale.z,mk.color.r,mk.color.g,mk.color.b,mk.color.a, false, true, 2, false, false, false, false)
                                if delivery_dist < 2.0 then
                                    T1GER_DrawTxt(delivery.cfg.pos.x, delivery.cfg.pos.y, delivery.cfg.pos.z, Lang['draw_deliver'])
                                    if IsControlJustPressed(0, 38) then
                                        if DoesBlipExist(delivery.blip) then RemoveBlip(delivery.blip) end
                                        SetVehicleForwardSpeed(job_veh, 0)
                                        SetVehicleEngineOn(job_veh, false, false, true)
                                        SetVehicleDoorOpen(job_veh, 2 , false, false)
                                        SetVehicleDoorOpen(job_veh, 3 , false, false)
                                        if IsPedInAnyVehicle(player, true) then
                                            TaskLeaveVehicle(player, job_veh, 4160)
                                            SetVehicleDoorsLockedForAllPlayers(job_veh, true)
                                        end
                                        Wait(700)
                                        FreezeEntityPosition(job_veh, true)
                                        delivery.done = true
                                    end
                                end
                            end
                        end
                    end
                end
                if delivery.done and not drugs_taken then
                    if not IsPedInAnyVehicle(player, true) then
                        if DoesEntityExist(job_veh) and GetEntityModel(job_veh) == GetHashKey(veh_model) then
                            local d1 = GetModelDimensions(GetEntityModel(job_veh))
                            local trunk_pos = GetOffsetFromEntityInWorldCoords(job_veh, 0.0,d1["y"]+0.60,0.0)
                            local trunk_dist = #(trunk_pos - coords)
                            if trunk_dist < 2.0 and not package_in_hand then
                                T1GER_DrawTxt(trunk_pos.x, trunk_pos.y, trunk_pos.z, Lang['draw_grab_pack'])
                                if IsControlJustPressed(0, 38) then
                                    T1GER_LoadAnim('anim@heists@box_carry@')
                                    TaskPlayAnim(player, 'anim@heists@box_carry@', 'idle', 1.0, -1.0, -1, 49, 0, 0, 0, 0)
                                    Wait(300)
                                    local prop = GetHashKey('prop_cs_cardbox_01')
                                    SetCurrentPedWeapon(player, 0xA2719263)
                                    local bone = GetPedBoneIndex(player, 28422)
                                    T1GER_LoadModel(prop)
                                    package_obj = CreateObject(prop, 1.0, 1.0, 1.0, 1, 1, 0)
                                    AttachEntityToEntity(package_obj, player, bone, 0.0, 0.0, 0.0, 135.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
                                    package_in_hand = true
                                end
                            end
                            local ply_vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 6.0, 0, 70)
                            if GetEntityModel(ply_vehicle) ~= GetHashKey(veh_model) then
                                local d2 = GetModelDimensions(GetEntityModel(ply_vehicle))
                                local veh_pos = GetOffsetFromEntityInWorldCoords(ply_vehicle, 0.0,d2["y"]+0.60,0.0)
                                local veh_dist = #(veh_pos - coords)
                                if veh_dist < 2.0 and package_in_hand then
                                    T1GER_DrawTxt(veh_pos.x, veh_pos.y, veh_pos.z, Lang['draw_put_pack'])
                                    if IsControlJustPressed(0, 47) then
                                        ClearPedTasks(player)
                                        DeleteEntity(package_obj)
                                        TriggerServerEvent('t1ger_drugs:giveJobReward', data.type)
										TriggerEvent('t1ger_drugs:job_notify', Lang['job_complete'])
                                        drugs_taken = true
                                        job_end = true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
		if job.veh_spawned then
			if not DoesEntityExist(job_veh) then
				job_end = true
				TriggerEvent('t1ger_drugs:job_notify', Lang['veh_is_taken'])
			end
		end
		if veh_lockpicked and DoesEntityExist(job_veh) then
			local veh_pos = GetEntityCoords(job_veh)
			if #(coords - veh_pos) > 50.0 then
				job_end = true
				TriggerEvent('t1ger_drugs:job_notify', Lang['too_far_from_veh'])
			end
		end
        if job_end then
            Config.DrugJobs.Jobs[num].inUse = false
            Config.DrugJobs.Jobs[num].goons_spawned = false
            Config.DrugJobs.Jobs[num].veh_spawned = false
            Config.DrugJobs.Jobs[num].player = false
            TriggerServerEvent('t1ger_drugs:jobConfigSV', Config.DrugJobs.Jobs)
            Wait(500)
            DeleteVehicle(job_veh)
            job_veh = nil
            if DoesBlipExist(job_blip) then RemoveBlip(job_blip) end
            if DoesBlipExist(delivery.blip) then RemoveBlip(delivery.blip) end
            local i = 0
            for k,v in pairs(Config.DrugJobs.Jobs[num].goons) do
                if DoesEntityExist(job_goons[i]) then
                    DeleteEntity(job_goons[i])
                end
                i = i +1
            end
            job_complete = true
            job_end = false
			job_started = false
            break
        end
        if sleep then Wait(1000) end
    end
end)

RegisterNetEvent('hospital:server:SetDeathStatus', function(bool)
    if bool then job_end = true end
end)

RegisterCommand(Config.DrugJobs.Settings.cancel_job, function(source, args)
	job_end = true
	TriggerEvent('t1ger_drugs:notify', Lang['cancel_job'])
    ClearPedTasks(player)
    FreezeEntityPosition(player, false)
end, false)

-- ## DRUG PICK ## --
-- RegisterNetEvent('t1ger_drugs:getWeedStage', function(stage, state, k)
-- 	Config.Weed[k][stage] = state
-- end)

-- RegisterNetEvent('t1ger_drugs:animWeed', function(heading) 
-- 	local ped = PlayerPedId()
-- 	TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
-- 	SetEntityHeading(ped, heading)
-- end)

-- function StartPicking(weed, heading) 
-- 	local ped = PlayerPedId()
-- 	local pickingTimer = 5000
-- 	FreezeEntityPosition(ped, true)
-- 	TriggerEvent('t1ger_drugs:animWeed', heading)
-- 	QBCore.Functions.Progressbar("Picking....", Lang['pick_weed'], pickingTimer, false, true, {
-- 		disableMovement = true,
-- 		disableCarMovement = true,
-- 		disableMouse = false,
-- 		disableCombat = true,
-- 	}, {}, {}, {}, function()
-- 		TriggerServerEvent('t1ger_drugs:setWeedStage', "isPicked", true, weed)
-- 		TriggerServerEvent('t1ger_drugs:setWeedTimer')
-- 		TriggerServerEvent('t1ger_drugs:getWeed')
-- 		-- TaskPlayAnim(trClassic, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
-- 		FreezeEntityPosition(ped, false)
-- 	end, function()
-- 		ClearPedTasks(ped)
-- 		TriggerServerEvent('t1ger_drugs:setWeedStage', "isPicked", false, weed)
-- 		-- TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
-- 		FreezeEntityPosition(ped, false)
-- 	end)
-- end

-- function WeedPicking(weed, heading) 
-- 	if not Config.Weed[weed]["isPicked"] then
-- 		StartPicking(weed, heading)
-- 	else
-- 		TriggerEvent('t1ger_drugs:notify', Lang['already_picked'], 'error')
-- 	end
-- end

-- CreateThread(function() 
-- 	for k, v in pairs(Config.Weed) do
-- 		exports['qb-target']:AddBoxZone("weed"..k, vector3(v.coords.x, v.coords.y, v.coords.z + 0.5), 2.5, 2, {
-- 			name = "weed"..k,
-- 			debugPoly = false,
-- 			heading = v.heading,
-- 			minZ = v.coords.z - 2,
-- 			maxZ = v.coords.z + 2,
-- 		}, {
-- 			options = {
-- 				{
-- 					action 	= function()
-- 						WeedPicking(k, v.heading)
-- 					end,
-- 					icon  	= "fa-solid fa-cannabis",
-- 					label 	= "Hái cần"
-- 				}
-- 			},
-- 		distance = 1.5
-- 	})
-- 	end
-- end)

-- ## DRUG SALE ## --

local drug_ped = false
local old_ped = nil
local selling_drugs = false
local can_sell_drugs = false

CreateThread(function()
	while true do
		Wait(100)
		local sleep = true
		if not IsPedInAnyVehicle(player, true) then
			if can_sell_drugs then
				local found_ped = false
				local handle, NPC = FindFirstPed()
				local success
				repeat
					local npc_pos = GetEntityCoords(NPC)
					local npc_dist = #(coords - npc_pos)
					if npc_dist < 5.0 then
						sleep = false
						if NPC_Accepted(NPC) and npc_dist < 3.0 then
							found_ped = NPC
							break
						end
					end
					success, NPC = FindNextPed(handle, NPC)
				until not success
				EndFindPed(handle)
				drug_ped = found_ped
			end
		else
			drug_ped = false
			Wait(2000)
		end
		if sleep then Wait(1000) end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		local sleep = true
		if can_sell_drugs then
			if drug_ped then
				sleep = false
				local ped_pos = GetEntityCoords(drug_ped)
				if #(coords - ped_pos) < 2.0 and not selling_drugs then
					if online_cops >= Config.DrugSale.min_cops then
						T1GER_DrawTxt(ped_pos.x, ped_pos.y, ped_pos.z, Lang['draw_sell_drugs'])
						if (IsControlJustPressed(1,74) and not selling_drugs) then
							selling_drugs = true
							SellDrugsToNPC(drug_ped, ped_pos)
						end
					end
				end
			end
		end
		if sleep then Wait(1000) end
	end
end)

function SellDrugsToNPC(drug_ped, ped_pos)
	local cfg = Config.DrugSale
	QBCore.Functions.TriggerCallback('t1ger_drugs:getUserInventory', function(inv_drugs, has_drugs)
		if has_drugs then
			QBCore.Functions.TriggerCallback('t1ger_drugs:getPlayerMaxCap', function(maxCap)
				if not maxCap then
					old_ped = drug_ped
					TaskStandStill(old_ped, 5000.0)
					SetEntityAsMissionEntity(old_ped)
					FreezeEntityPosition(old_ped, true)
					FreezeEntityPosition(player, true)
					ClearPedTasksImmediately(old_ped)
					SetEntityHeading(old_ped, GetHeadingFromVector_2d(ped_pos.x-coords.x,ped_pos.y-coords.y)+180)
					SetEntityHeading(player, GetHeadingFromVector_2d(ped_pos.x-coords.x,ped_pos.y-coords.y))
					-- Progress Bars:
					if Config.ProgressBars then
						QBCore.Functions.Progressbar('drug_selling', Lang['progbar_selling'], cfg.sell_time, false, false, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() end)
					end
					Wait(cfg.sell_time)
					-- Chances:
					if math.random(0,100) <= cfg.sell_chance then
						T1GER_LoadAnim("mp_common")
						TaskPlayAnim(player, "mp_common", "givetake2_a", 8.0, 8.0, 2000, 0, 1, 0,0,0)
						TaskPlayAnim(old_ped, "mp_common", "givetake2_a", 8.0, 8.0, 2000, 0, 1, 0,0,0)
						math.randomseed(GetGameTimer())
						local num = math.random(1,#inv_drugs)
						local drug = inv_drugs[num]
						TriggerServerEvent('t1ger_drugs:sellDrugsToNPC', drug)
					else
						if math.random(0,100) <= cfg.report_chance then
							TriggerEvent('t1ger_drugs:police_notify', Lang['drug_sale'])
							TriggerEvent('t1ger_drugs:notify', Lang['sale_rejected_pol_noti'])
						else
							TriggerEvent('t1ger_drugs:notify', Lang['sale_rejected'])
						end
					end
					FreezeEntityPosition(old_ped, false)
					FreezeEntityPosition(player, false)
					SetPedAsNoLongerNeeded(old_ped)
					Wait(Config.DrugSale.wait_timer)
					selling_drugs = false
				else
					TriggerEvent('t1ger_drugs:notify', Lang['max_cap_reached'])
					selling_drugs = false
				end
			end)
		else
			TriggerEvent('t1ger_drugs:notify', Lang['no_more_drugs'])
			can_sell_drugs = false
			selling_drugs = false
		end
	end)
end

-- Sell Drug State:
RegisterNetEvent('t1ger_drugs:sellStateCL')
AddEventHandler('t1ger_drugs:sellStateCL', function(state)
	can_sell_drugs = state
end)

-- NPC Checks before sale:
function NPC_Accepted(entity)
	if not IsPedAPlayer(entity) and not IsPedInAnyVehicle(entity,false) and not IsEntityDead(entity) and IsPedHuman(entity) and not isEntityBlacklisted(entity) and entity ~= old_ped then
		return true
	end
	return false
end

-- Blacklsited NPC's:
function isEntityBlacklisted(entity)
	for k,v in pairs(Config.DrugSale.blacklisted) do
		if GetEntityModel(entity) == GetHashKey(v) then
			return true
		end
	end
	return false
end

-- Command to sell drugs:
RegisterCommand(Config.DrugSale.command, function(source, args)
	if can_sell_drugs then
		can_sell_drugs = false
		TriggerEvent('t1ger_drugs:notify', 'Bạn đã vô hiệu hóa bán thuốc')
	else
		QBCore.Functions.TriggerCallback('t1ger_drugs:getUserInventory', function(_, has_drugs)
			if has_drugs then
				can_sell_drugs = true
				TriggerEvent('t1ger_drugs:notify', 'Bạn đã kích hoạt bán thuốc')
			else
				can_sell_drugs = false
				TriggerEvent('t1ger_drugs:notify', Lang['no_more_drugs'])
			end
		end)
	end
end, false)

-- ## DRUG EFFECTS SECTION ## --

RegisterNetEvent('t1ger_drugs:useDrugsCL')
AddEventHandler('t1ger_drugs:useDrugsCL', function(k,v)
	if not IsPedInAnyVehicle(player) then
		TaskStartScenarioInPlace(player, v.scenario.name, 0, true)
	end
	if v.progressBar.enable then
		QBCore.Functions.Progressbar('drug_use', v.progressBar.text, v.scenario.timer, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() end)
	end
	Wait(v.scenario.timer)
	ClearPedTasks(player)
	TriggerServerEvent('t1ger_drugs:notUsingItem')
	if v.armor.enable then
		if GetPedArmour(player) <= (100-v.armor.value) then
			AddArmourToPed(player,v.armor.value)
		elseif GetPedArmour(player) <= 99 then
			SetPedArmour(player,100)
		end
	end
	if v.health.enable then
		if GetEntityHealth(player) <= (200-v.health.value) then
			SetEntityHealth(player,GetEntityHealth(player)+v.health.value)
		elseif GetEntityHealth(player) <= 199 then
			SetEntityHealth(player,200)
		end
	end
	local timer = 0
	while timer < v.duration do
		if v.sprint.enable then SetRunSprintMultiplierForPlayer(player,v.sprint.value) end
		if v.timeCycleMod.enable then SetTimecycleModifier(v.timeCycleMod.type) end
		if v.motion_blur then SetPedMotionBlur(player, true) end
		if v.stamina then ResetPlayerStamina(player) end
		Wait(1000)
		timer = timer + 1
	end
    SetTimecycleModifier("default")
	SetPedMotionBlur(player, false)
    SetRunSprintMultiplierForPlayer(player,1.0)
end)

-- ## DRUG CONVERTING ## --
RegisterNetEvent('t1ger_drugs:drugConverting')
AddEventHandler('t1ger_drugs:drugConverting', function(value)
	local anim = {dict = 'misscarsteal1car_1_ext_leadin', lib = 'base_driver2'}
	T1GER_LoadAnim(anim.dict)
	if not IsPedInAnyVehicle(player) then
		TaskPlayAnim(player, anim.dict, anim.lib, 8.0, -8, -1, 49, 0, 0, 0, 0)
		if Config.ProgressBars then
			QBCore.Functions.Progressbar('drug_convert', value.text, value.time, false, false, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() end)
		end
		Wait(value.time)
		ClearPedTasks(player)
	else
		if Config.ProgressBars then
			QBCore.Functions.Progressbar('drug_convert', value.text, value.time, false, false, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() end)
		end
		Wait(value.time)
	end
	TriggerServerEvent('t1ger_drugs:notUsingItem')
end)

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    for _, value in pairs(props) do
        DeleteObject(value.prop)
        table.remove(props)
    end
end)
