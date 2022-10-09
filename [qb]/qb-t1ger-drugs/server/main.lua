-------------------------------------
------- Created by T1GER#9080 -------
-------------------------------------

local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function ()
    while GetResourceState(GetCurrentResourceName()) ~= 'started' do Wait(0) end
    if GetResourceState(GetCurrentResourceName()) == 'started' then InitialDrugSystem() end
end)

--- Returns the amount of cops online and on duty
--- @return integer number - amount of cops
local GetCopCount = function()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

local online_cops = 0
function FetchOnlineCops()
	local count = 0
	for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
		for _, job in pairs(Config.Police.Jobs) do
			if v.PlayerData.job.name == job and v.PlayerData.job.onduty then
				count = count + 1
			end
		end
	end
    if online_cops ~= count then
        TriggerClientEvent('t1ger_drugs:updateCopsCount', -1, count)
    end
	online_cops = count
	SetTimeout(Config.Police.Timer * 60000, FetchOnlineCops)
end
FetchOnlineCops()

RegisterNetEvent('qb-t1ger-drugs:server:fetchCops', function()
	FetchOnlineCops()
end)

QBCore.Functions.CreateCallback('t1ger_drugs:fetchDrugInv', function(source, cb)
	cb(GetDrugInventory(source))
end)

function InitialDrugSystem()
	Wait(1000)
    TriggerClientEvent('t1ger_drugs:intializeDrugs', -1)
end

local using_item = {}

-- ## DRUG LABS ## --

QBCore.Functions.CreateCallback('t1ger_drugs:getLabCache',function(source, cb, id)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	cb(Config.DrugLabs[id].cache)
end)

RegisterServerEvent('t1ger_drugs:sendCacheSV')
AddEventHandler('t1ger_drugs:sendCacheSV',function(id, data)
	Config.DrugLabs[id].cache = data
	TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[id].cache, id)
end)

RegisterServerEvent('t1ger_drugs:updateInUseSV')
AddEventHandler('t1ger_drugs:updateInUseSV',function(cache, state)
	Config.DrugLabs[cache.id].cache.in_use = state
	TriggerClientEvent('t1ger_drugs:updateInUseCL', -1, cache.id, state)
end)

RegisterServerEvent('t1ger_drugs:creatingLab')
AddEventHandler('t1ger_drugs:creatingLab',function(id, state)
	Config.DrugLabs[id].creating = state
	TriggerClientEvent('t1ger_drugs:updateCreatingLab', -1, id, state)
end)

RegisterServerEvent('t1ger_drugs:sendProcessDataSV')
AddEventHandler('t1ger_drugs:sendProcessDataSV',function(cache, data)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local items = data.input
	-- check if has items:
	for i = 1, #items do
		local item_count = xPlayer.Functions.GetItemByName(items[i].item)
		if not item_count then return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item3']:format(items[i].amount, items[i].name)) end
		if item_count.amount < items[i].amount then
			local missing_count = (items[i].amount - item_count.amount)
			return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item']:format(missing_count, items[i].name, data.output.amount, data.output.name))
		end
	end
	-- check if table is empty:
	if next(Config.DrugLabs[cache.id].cache.process) == nil then
		local cache_data = {
			id = cache.id,
			identifier = xPlayer.PlayerData.citizenid,
			input = data.input,
			output = data.output,
			time = (data.time * 1000 * 60),
			done = false,
			collected = false
		}
		Config.DrugLabs[cache.id].cache.process = cache_data
		TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[cache.id].cache, cache.id)
		for i = 1, #items do xPlayer.Functions.RemoveItem(items[i].item, items[i].amount) end
	else
		return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['process_to_slow'])
	end
end)

QBCore.Functions.CreateCallback('t1ger_drugs:collectProcessedDrugs',function(source,cb,cache)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if next(Config.DrugLabs[cache.id].cache.process) ~= nil then
		if not Config.DrugLabs[cache.id].cache.process.collected then
			Config.DrugLabs[cache.id].cache.process.collected = true
			local output = Config.DrugLabs[cache.id].cache.process.output
			xPlayer.Functions.AddItem(output.item, output.amount)
			TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['process_collected']:format(output.amount, output.name))
			Config.DrugLabs[cache.id].cache.process = {}
			TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[cache.id].cache, cache.id)
			cb(true)
		else
			cb(false)
		end
	else
		cb(false)
	end
end)

QBCore.Functions.CreateCallback('t1ger_drugs:requestPackaging',function(source, cb, data, cache)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local items = data.input
	-- check if has items:
	for i = 1, #items do
		local item_count = xPlayer.Functions.GetItemByName(items[i].item)
		if not item_count then return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item3']:format(items[i].amount, items[i].name)) end
		if item_count.amount < items[i].amount then
			local missing_count = (items[i].amount - item_count.amount)
			return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item2']:format(missing_count, items[i].name, data.output.amount, data.output.name))
		end
	end
	-- check if in_use:
	if next(Config.DrugLabs[cache.id].cache.package) ~= nil then
		return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['package_to_slow'])
	else
		local cache_data = {in_use = true, identifier = xPlayer.PlayerData.citizenid, input = data.input, output = data.output}
		Config.DrugLabs[cache.id].cache.package = cache_data
		TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[cache.id].cache, cache.id)
		for i = 1, #items do xPlayer.Functions.RemoveItem(items[i].item, items[i].amount) end
	end
	cb(true)
end)

RegisterServerEvent('t1ger_drugs:getPackagedDrugs')
AddEventHandler('t1ger_drugs:getPackagedDrugs',function(cache)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local output = Config.DrugLabs[cache.id].cache.package.output
	if Config.DrugTypes[cache.type].package.output.scale.enable then
		local percent = ((Config.DrugTypes[cache.type].package.output.scale.percent/100) + 1)
		local scale_item = xPlayer.Functions.GetItemByName(Config.DrugTypes[cache.type].package.output.scale.item)
		if scale_item and scale_item.amount >= 1 then
			output.amount = math.floor(output.amount * percent)
		end
	end
	xPlayer.Functions.AddItem(output.item, output.amount)
	TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['packaging_done']:format(output.amount, output.name))
	Config.DrugLabs[cache.id].cache.package = {}
	TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[cache.id].cache, cache.id)
end)

CreateThread(function() -- do not touch this thread function!
	while true do
	Wait(1000)
		for i = 1, #Config.DrugLabs do
			if next(Config.DrugLabs[i].cache) ~= nil and next(Config.DrugLabs[i].cache.process) ~= nil then
				if not Config.DrugLabs[i].cache.process.done then
					if Config.DrugLabs[i].cache.process.time <= 0 then
						local xPlayer = QBCore.Functions.GetPlayerByCitizenId(Config.DrugLabs[i].cache.process.identifier)
						if xPlayer then
                            local sender, subject = Config.Blips[Config.DrugLabs[i].type].label, Lang['adv_noti_subject']
                            local msg = Lang['process_is_done']:format(Config.DrugLabs[i].cache.process.output.name)
                            local textureDict, iconType = 'CHAR_LESTER_DEATHWISH', 7
							TriggerClientEvent('t1ger_drugs:notifyAdvanced', xPlayer.PlayerData.source, sender, subject, msg, textureDict, iconType)
							Config.DrugLabs[i].cache.process.done = true
							TriggerClientEvent('t1ger_drugs:sendCacheCL', -1, Config.DrugLabs[i].cache, i)
						end
					else
						Config.DrugLabs[i].cache.process.time = Config.DrugLabs[i].cache.process.time - 1000
						--print("v.time: "..Config.DrugLabs[i].cache.process.time)
					end
				end
			end
		end
	end
end)

-- ## Plant Drugs ## -- 
RegisterNetEvent('t1ger_drugs:removeItem', function(item, label)
	local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.RemoveItem(item, 1)
	if item == "giesskanne_voll" then
		label = "Hehe"
	else
		TriggerClientEvent('okokNotify:Alert', source, 'Bạn đã trồng cây ' .. label .. ' hãy nhớ chăm sóc cây', 5000, 'success')
	end
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "remove")
	
end)

-- ## DRUG JOBS ## --
RegisterNetEvent("t1ger_drugs:getWeed", function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	-- local lucky = math.random(1, 3)
	local cfg = Config.DrugJobs.Reward['weed']
	
    for i = 1, #cfg do
        math.randomseed(GetGameTimer())
        if math.random(0,100) <= cfg[i].chance then
            local amount = math.random(cfg[i].amount.min, cfg[i].amount.max)
            xPlayer.Functions.AddItem(cfg[i].item, amount)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[cfg[i].item], "add")
        end
        Wait(200)
    end
end)

QBCore.Functions.CreateUseableItem("weed_seed", function(source)
	local cops = 1
	if online_cops >= cops then
   		TriggerClientEvent("t1ger_drugs:plantWeed", source, 'weed_seed', 'Cần Sa')
	else
		TriggerClientEvent('okokNotify:Alert', source, 'Trồng Cần', 'Không có đủ ' .. cops .. 'cảnh sát để trồng cần', 'error')
	end
end)
-- ##			## --

RegisterServerEvent('t1ger_drugs:requestDrugJob')
AddEventHandler('t1ger_drugs:requestDrugJob', function(data)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        if xPlayer.PlayerData.money.cash >= data.fees then
            if online_cops >= data.minCops then
                if not HasCooldown(xPlayer.PlayerData.citizenid) then
                    local can_start, num = GetAvailableJob(xPlayer.PlayerData.source)
                    if can_start and num ~= nil then
                        xPlayer.Functions.RemoveMoney('cash', data.fees)
                        if Config.DrugJobs.Settings.cooldown.enable then
                            TriggerEvent('t1ger_drugs:addCooldown', xPlayer.PlayerData.source)
                        end
                        local vehicle = Config.DrugJobs.Vehicles[math.random(1, #Config.DrugJobs.Vehicles)]
                        TriggerClientEvent('t1ger_drugs:drugJobEvent', xPlayer.PlayerData.source, num, data, vehicle)
                    end
                else
					local seconds, timer = GetCooldownTime(xPlayer.PlayerData.citizenid)
					if seconds then
						return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['job_cooldown_1']:format(timer))
					else
						return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['job_cooldown_2']:format(timer))
					end
                end
            else
                return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['not_enough_cops'])
            end
        else
            return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['not_enough_money'])
        end
    end
end)

function GetAvailableJob(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local can_start = false
    math.randomseed(GetGameTimer())
	local id = math.random(1, #Config.DrugJobs.Jobs)
    local i = 0
    while Config.DrugJobs.Jobs[id].inUse and i < 100 do
        i = i + 1
        math.randomseed(GetGameTimer())
        id = math.random(1, #Config.DrugJobs.Jobs)
    end
    if i == 100 then
        TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['no_jobs_available'])
        can_start = false
        id = nil
    else
        can_start = true
        Config.DrugJobs.Jobs[id].inUse = true
		Config.DrugJobs.Jobs[id].src = source
        TriggerClientEvent('t1ger_drugs:jobConfigCL', -1, Config.DrugJobs.Jobs)
    end
    return can_start, id
end

RegisterServerEvent('t1ger_drugs:giveJobReward')
AddEventHandler('t1ger_drugs:giveJobReward',function(drug_type)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local cfg = Config.DrugJobs.Reward[drug_type]

    for i = 1, #cfg do
        math.randomseed(GetGameTimer())
        if math.random(0,100) <= cfg[i].chance then
            local amount = math.random(cfg[i].amount.min, cfg[i].amount.max)
            xPlayer.Functions.AddItem(cfg[i].item, amount)
        end
        Wait(200)
    end
end)

RegisterServerEvent('t1ger_drugs:jobConfigSV')
AddEventHandler('t1ger_drugs:jobConfigSV',function(cfg)
    TriggerClientEvent('t1ger_drugs:jobConfigCL', -1, cfg)
end)

RegisterServerEvent('t1ger_drugs:sendPoliceAlert')
AddEventHandler('t1ger_drugs:sendPoliceAlert', function(coords, street_name, msg)
    local message = msg:format(street_name)
	TriggerClientEvent('t1ger_drugs:sendPoliceAlertCL', -1, coords, message)
end)

AddEventHandler('playerDropped', function()
	for k,v in pairs(Config.DrugJobs.Jobs) do
		if v.src == source then
			Config.DrugJobs.Jobs[k].inUse = false
			Config.DrugJobs.Jobs[k].goons_spawned = false
			Config.DrugJobs.Jobs[k].veh_spawned = false
			Config.DrugJobs.Jobs[k].player = false
			Config.DrugJobs.Jobs[k].src = 0
			TriggerEvent('t1ger_drugs:jobConfigSV', Config.DrugJobs.Jobs)
			break
		end
	end
end)

-- ## JOB COOLDOWN ## --

local job_cooldown = {}
RegisterServerEvent('t1ger_drugs:addCooldown')
AddEventHandler('t1ger_drugs:addCooldown',function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    table.insert(job_cooldown, {identifier = xPlayer.PlayerData.citizenid, time = (Config.DrugJobs.Settings.cooldown.time * 60000)})
end)

CreateThread(function()
	while true do
        Wait(1000)
		for k,v in pairs(job_cooldown) do if v.time <= 0 then table.remove(job_cooldown, k) else v.time = v.time - 1000 end end
	end
end)

function GetCooldownTime(identifier)
	for k,v in pairs(job_cooldown) do
		if v.identifier == identifier then
			local seconds, cooldown_time = false, (v.time/60000)
			if cooldown_time < 60000 then
				cooldown_time = v.time/1000
				seconds = true
			end
			return seconds, math.ceil(cooldown_time)
		end
	end
end

function HasCooldown(identifier)
	for k,v in pairs(job_cooldown) do if v.identifier == identifier then return true end end
	return false
end

-- ## DRUG SALE ## --
local sold_drugs = {}

-- Callback to get inventory drugs:
QBCore.Functions.CreateCallback('t1ger_drugs:getUserInventory',function(source,cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local drugInventory, hasDrugs = GetDrugInventory(xPlayer.PlayerData.source)
	cb(drugInventory, hasDrugs)
end)

-- Callback to get max cap:
QBCore.Functions.CreateCallback('t1ger_drugs:getPlayerMaxCap',function(source,cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if (CheckSoldDrugsAmount(xPlayer.PlayerData.citizenid) < Config.DrugSale.max_cap) or (Config.DrugSale.max_cap == 0) then
		cb(false)
	else
		cb(true)
	end
end)

-- Check Sold Drugs Amount:
function CheckSoldDrugsAmount(identifier)
	if #sold_drugs > 0 then
		for k,v in pairs(sold_drugs) do
			if v.identifier == identifier then
				return v.amount
			else
				if k == #sold_drugs then
					table.insert(sold_drugs, {identifier = identifier, amount = 0})
					return CheckSoldDrugsAmount(identifier)
				end
			end
		end
	else
		table.insert(sold_drugs, {identifier = identifier, amount = 0})
		return CheckSoldDrugsAmount(identifier)
	end
end

RegisterServerEvent('t1ger_drugs:sellDrugsToNPC')
AddEventHandler('t1ger_drugs:sellDrugsToNPC', function(drug)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local cfg = Config.DrugTypes[drug.type].sell
    math.randomseed(GetGameTimer())
    -- calculate drug price:
    local sell_price = math.random(cfg.items[drug.item].min, cfg.items[drug.item].max)
    if cfg.multiplier.enable and (online_cops >= cfg.multiplier.min_cops) then
        local multiplier = (cfg.multiplier.value/100 + 1.0)
        sell_price = (math.floor(sell_price * multiplier))
    end
    -- calculate sell amount:
    math.randomseed(GetGameTimer())
    local sell_amount = math.random(Config.DrugSale.amount.min, Config.DrugSale.amount.max)
    if sell_amount > drug.count then sell_amount = drug.count end
    -- execute sale:
    sell_price = (sell_price * sell_amount)
	AddToSoldAmount(xPlayer.PlayerData.citizenid, sell_amount)
	if Config.DrugSale.dirty_cash then
		local markedbills   = xPlayer.Functions.GetItemByName('markedbills')
		local info = {
			worth = sell_price
		}
		if markedbills then
			local worth = markedbills.info.worth
			local itemSlot = markedbills.slot
			local newWorth = tonumber(worth + sell_price)
			xPlayer.PlayerData.items[itemSlot].info.worth = newWorth
			xPlayer.Functions.SetInventory(xPlayer.PlayerData.items, true)
			xPlayer.Functions.RemoveItem(drug.item, sell_amount)
		else
			xPlayer.Functions.AddItem('markedbills', 1, false, info)
			xPlayer.Functions.RemoveItem(drug.item, sell_amount)
		end
	else
		xPlayer.Functions.AddMoney('cash', sell_price)
		xPlayer.Functions.RemoveItem(drug.item, sell_amount)
	end
	TriggerClientEvent('t1ger_drugs:notify', source, Lang['you_sold_drugs']:format(sell_amount, drug.label, sell_price))
end)

function GetDrugInventory(plyID)
	local xPlayer = QBCore.Functions.GetPlayer(plyID)
	local inv_drugs = {}
    for k,v in pairs(Config.DrugTypes) do
		for name,qty in pairs(v.sell.items) do
			local inv_item = xPlayer.Functions.GetItemByName(name)
			if inv_item and inv_item.amount > 0 then
				table.insert(inv_drugs, {type = k, item = inv_item.name, count = inv_item.amount, label = inv_item.label})
			end
		end
    end
	if next(inv_drugs) ~= nil then return inv_drugs, true else return nil, false end
end

function AddToSoldAmount(identifier, amount)
	for k,v in pairs(sold_drugs) do if v.identifier == identifier then v.amount = v.amount + amount; return end end
end

-- ## DRUG EFFECTS ## --
CreateThread(function()
	for item,data in pairs(Config.DrugEffects) do
		QBCore.Functions.CreateUseableItem(item, function(source)
			local xPlayer = QBCore.Functions.GetPlayer(source)
			if not usingItem(xPlayer.PlayerData.citizenid) then
                table.insert(using_item, {identifier = xPlayer.PlayerData.citizenid})
				xPlayer.Functions.RemoveItem(item, 1)
				TriggerClientEvent('t1ger_drugs:useDrugsCL', xPlayer.PlayerData.source, item, data)
            else
                TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['already_consuming_drug'])
			end
		end)
	end
end)

RegisterServerEvent('t1ger_drugs:notUsingItem')
AddEventHandler('t1ger_drugs:notUsingItem',function(plyID)
	local src = source
	if plyID ~= nil then src = plyID end
    local xPlayer = QBCore.Functions.GetPlayer(src)
	if next(using_item) ~= nil then
		for k,v in pairs(using_item) do
			if v.identifier == xPlayer.PlayerData.citizenid then
				table.remove(using_item, k)
				break
			end
		end
	end
end)

-- Drug Item Conversions:
CreateThread(function()
	for k,v in pairs(Config.DrugItemConverter) do
		QBCore.Functions.CreateUseableItem(k, function(source)
            local xPlayer = QBCore.Functions.GetPlayer(source)
			if xPlayer then
				-- check if converting:
				if usingItem(xPlayer.PlayerData.citizenid) then
					return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['already_converting'])
				end
				-- get num and scale:
				local num, scale = 'a', xPlayer.Functions.GetItemByName(v.scale.item)
				if v.scale.enable and scale and scale.amount >= 1 then num = 'b' end
				-- check required items:
				for i = 1, #v.requirements do
					local item = xPlayer.Functions.GetItemByName(v.requirements[i].item)
					if item == nil then return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item3']:format(v.requirements[i].amount[num], QBCore.Shared.Items[v.requirements[i].item].label)) end
					if item.amount < v.requirements[i].amount[num] then
						local missing_qty = (v.requirements[i].amount[num] - item.amount)
						return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item3']:format(missing_qty, item.label))
					end
					Wait(10)
				end
				-- remove Useable item:
				xPlayer.Functions.RemoveItem(k, 1)
				-- remove requirements:
				for i = 1, #v.requirements do
					local item = xPlayer.Functions.GetItemByName(v.requirements[i].item)
					if item == nil then return TriggerClientEvent('t1ger_drugs:notify', xPlayer.PlayerData.source, Lang['missing_item3']:format(v.requirements[i].amount[num], QBCore.Shared.Items[v.requirements[i].item].label)) end
					if item.amount >= v.requirements[i].amount[num] then
						xPlayer.Functions.RemoveItem(item.name, v.requirements[i].amount[num])
					end
					Wait(10)
				end
				-- update using state:
				table.insert(using_item, {identifier = xPlayer.PlayerData.citizenid})
				-- anim & progressBars:
				TriggerClientEvent('t1ger_drugs:drugConverting', xPlayer.PlayerData.source, v)
				Wait(v.time)
				-- add Output:
				xPlayer.Functions.AddItem(v.output.item, v.output.amount[num])
			end
		end)
	end
end)

function usingItem(identifier)
    local match = false
    for k,v in pairs(using_item) do
        if v.identifier == identifier then
            match = true
            break
        end
    end
    return match
end