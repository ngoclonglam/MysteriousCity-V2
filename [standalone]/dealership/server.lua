QBCore = exports['qb-core']:GetCoreObject()

local cooldown = {}
local vrp_ready = true
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

CreateThread(function()
	Wait(5000)
	local sql = "UPDATE `dealership_requests` SET status = 0 WHERE status = 1";
	MySQL.Sync.execute(sql, {});
end)

-- Check low stocks
-- CreateThread(function()
-- 	Wait(10000)
-- 	while Config.clear_dealerships.active do
-- 		local sql = "SELECT dealership_id, user_id, stock, timer FROM dealership_owner";
-- 		local data = MySQL.Sync.fetchAll(sql, {});
-- 		for k,v in pairs(data) do
-- 			local arr_stock = json.decode(v.stock)
-- 			local count_stock = tablelength(arr_stock)
-- 			local count_items = tablelength(Config.dealership_types[Config.dealership_locations[v.dealership_id].type].vehicles)
-- 			if count_stock < count_items*(Config.clear_dealerships.min_stock_variety/100) or getStockAmount(v.stock) < (Config.dealership_types[Config.dealership_locations[v.dealership_id].type].stock_capacity)*(Config.clear_dealerships.min_stock_amount/100) then
-- 				if v.timer + (Config.clear_dealerships.cooldown*60*60) < os.time() then
-- 					local sql = "DELETE FROM `dealership_owner` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_requests` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_hired_players` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_balance` WHERE dealership_id = @dealership_id;";
-- 					MySQL.Sync.execute(sql, {['@dealership_id'] = v.dealership_id});
-- 					SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_lost_low_stock']:format(v.dealership_id,v.stock,os.date("%d/%m/%Y %H:%M:%S", v.timer),v.user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
-- 				end
-- 			else
-- 				local sql = "UPDATE `dealership_owner` SET timer = @timer WHERE dealership_id = @dealership_id";
-- 				MySQL.Sync.execute(sql, {['timer'] = os.time(), ['@dealership_id'] = v.dealership_id});
-- 			end
-- 			Wait(100)	
-- 		end
-- 		Wait(1000*60*60) -- 60 minute
-- 	end
-- end)

-- Event to open the interface or open the buy request if no one own this dealership
RegisterServerEvent("lc_dealership:getData")
AddEventHandler("lc_dealership:getData",function(key)
	if vrp_ready then
		local source = source
        local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			local owner_id = getDealershipOwner(key)
			if owner_id then
				-- Check if he is a owner
				if owner_id == user_id then
					openUI(source,key,false) -- Open UI as owner
				else
					local sql = "SELECT user_id FROM `dealership_hired_players` WHERE dealership_id = @dealership_id AND user_id = @user_id";
					local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});
					-- Check if he is a employee
					if query and query[1] then
						openUI(source,key,false) -- Open UI as employee
					else
						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['already_has_owner'])
						TriggerClientEvent("QBCore:Notify", source, "Cửa hàng xe này đã có chủ.", "error", 5000)

					end
				end
			else
				local sql = "SELECT dealership_id FROM `dealership_owner` WHERE user_id = @user_id";
				local query = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id});
				-- Check if he can buy this dealership
				if query and query[1] and #query >= Config.max_dealerships_per_player then
					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['already_has_business'])
					TriggerClientEvent("QBCore:Notify", source, "Bạn đã có một cửa hàng khác rồi !", "error", 5000)

				else
					TriggerClientEvent("lc_dealership:openRequest",source, Config.dealership_locations[key].buy_price) -- Open the interface buy request
				end
			end
		end
	end
end)

-- Return from interface buy request when player accept to buy the dealership
RegisterServerEvent("lc_dealership:buyDealership")
AddEventHandler("lc_dealership:buyDealership",function(key)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		local price = Config.dealership_locations[key].buy_price
		if tryPayment(source, price, Config.Framework.account_dealership) then
			local sql = "INSERT INTO `dealership_owner` (user_id,dealership_id,name,stock,stock_sold,stock_prices,timer) VALUES (@user_id,@dealership_id,@name,@stock,@stock_sold,@stock_prices,@timer);";
			MySQL.insert(sql, {['@dealership_id'] = key, ['@user_id'] = user_id, ['@name'] = getPlayerName(user_id), ['@stock'] = json.encode({}), ['@stock_sold'] = json.encode({}), ['@stock_prices'] = json.encode({}), ['@timer'] = os.time()});
			--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['businnes_bougth'])
			TriggerClientEvent("QBCore:Notify", source, "Đã mua thành công", "success", 5000)

			SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_bought']:format(key,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
		else
			--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
			TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

		end
	end
end)

RegisterServerEvent("lc_dealership:sellDealership")
AddEventHandler("lc_dealership:sellDealership",function(key)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if isOwner(key,user_id) then
			TriggerClientEvent("lc_dealership:closeUI",source)
			giveMoney(source,Config.dealership_locations[key].sell_price,Config.Framework.account_dealership)
			local sql = "DELETE FROM `dealership_owner` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_requests` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_hired_players` WHERE dealership_id = @dealership_id;DELETE FROM `dealership_balance` WHERE dealership_id = @dealership_id;";
			MySQL.Sync.execute(sql, {['@dealership_id'] = key});
			--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['dealer_sold'])
			TriggerClientEvent("QBCore:Notify", source, "Đã bán cửa hàng thành công", "success", 5000)

			SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_close']:format(key,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
		else
			--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['no_own_dealer'])
			TriggerClientEvent("QBCore:Notify", source, "Bạn không phải chủ cửa hàng", "error", 5000)

		end
	end
end)

-- Open dealership as a customer
RegisterServerEvent("lc_dealership:openDealership")
AddEventHandler("lc_dealership:openDealership",function(key)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			openUI(source,key,false,true)
		end
	end
end)

-- Owner clicked to start a vehicle import
local started_import = {}
RegisterServerEvent("lc_dealership:importVehicle")
AddEventHandler("lc_dealership:importVehicle",function(key,vehicle,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			local price = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_owner
			local max_amount = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].amount_to_owner
			local max_stock_vehicle = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].max_stock
			local sql = "SELECT stock FROM `dealership_owner` WHERE dealership_id = @dealership_id";
			local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});
			amount = tonumber(amount) or 0
			if hasStockSlots(query,key,amount) then
				if amount <= max_amount then
					local arr_stock = json.decode(query[1].stock)
					if not arr_stock[vehicle] then arr_stock[vehicle] = 0 end
					if arr_stock[vehicle] < max_stock_vehicle then
						if tryGetDealershipMoney(key,price*amount) then
							local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].name
							insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_vehicle_import']:format(veh_name),price*amount,1,0)
							started_import[source] = true
							TriggerClientEvent("lc_dealership:startContract",source,vehicle,amount,false)
						else
							--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
							TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

						end
					else
						---TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['max_stock_vehicle'])
						TriggerClientEvent("QBCore:Notify", source, "Bạn đã đạt đến số lượng tối đa của chiếc xe này trong kho của mình", "error", 5000)

					end
				else
					TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['max_amount']:format(max_amount), 'error')
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Hàng của đại lý đã đầy", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['stock_full'])
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:finishImportVehicle")
AddEventHandler("lc_dealership:finishImportVehicle",function(key,vehicle,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			if started_import[source] then
				started_import[source] = nil
				local sql = "SELECT stock FROM `dealership_owner` WHERE dealership_id = @dealership_id";
				local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});

				local arr_stock = json.decode(query[1].stock)
				if not arr_stock[vehicle] then arr_stock[vehicle] = 0 end
				arr_stock[vehicle] = arr_stock[vehicle] + amount

				local sql = "UPDATE `dealership_owner` SET stock = @stock WHERE dealership_id = @dealership_id";
				MySQL.Sync.execute(sql, {['@stock'] = json.encode(arr_stock), ['@dealership_id'] = key});

				local sql = "UPDATE `dealership_hired_players` SET jobs_done = jobs_done + 1 WHERE dealership_id = @dealership_id AND user_id = @user_id";
				MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});

				local price = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_owner
				SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_finish_import']:format(key,vehicle,amount,price*amount,json.encode(arr_stock),user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
			end
		end
	end
end)

-- Owner clicked to start a vehicle export
local started_export = {}
RegisterServerEvent("lc_dealership:exportVehicle")
AddEventHandler("lc_dealership:exportVehicle",function(key,vehicle,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			local max_amount = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].amount_to_owner
			local sql = "SELECT stock FROM `dealership_owner` WHERE dealership_id = @dealership_id";
			local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});
			amount = tonumber(amount) or 0
			if amount <= max_amount then
				local arr_stock = json.decode(query[1].stock)
				if not arr_stock[vehicle] then arr_stock[vehicle] = 0 end
				if arr_stock[vehicle] >= amount then
					started_export[source] = true
					TriggerClientEvent("lc_dealership:startContract",source,vehicle,amount,true)
				else
					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_stock'])
					TriggerClientEvent("QBCore:Notify", source, "Không đủ hàng cho chiếc xe này", "error", 5000)

				end
			else
				TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['max_amount']:format(max_amount), "error")
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:finishExportVehicle")
AddEventHandler("lc_dealership:finishExportVehicle",function(key,vehicle,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			if started_export[source] then
				started_export[source] = nil
				local sql = "SELECT stock FROM `dealership_owner` WHERE dealership_id = @dealership_id";
				local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});

				local arr_stock = json.decode(query[1].stock)
				if not arr_stock[vehicle] then arr_stock[vehicle] = 0 end
				arr_stock[vehicle] = arr_stock[vehicle] - amount
				if arr_stock[vehicle] == 0 then arr_stock[vehicle] = nil end -- Clear empty stock
				
				local sql = "UPDATE `dealership_owner` SET stock = @stock WHERE dealership_id = @dealership_id";
				MySQL.Sync.execute(sql, {['@stock'] = json.encode(arr_stock), ['@dealership_id'] = key});
				
				local price = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_export
				local total_price = price*amount
				giveDealershipMoney(key,total_price)

				local sql = "UPDATE `dealership_hired_players` SET jobs_done = jobs_done + 1 WHERE dealership_id = @dealership_id AND user_id = @user_id";
				MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});

				local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].name
				insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_vehicle_export']:format(veh_name),total_price,0,0)
				SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_finish_export']:format(key,vehicle,amount,total_price,json.encode(arr_stock),user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
			end
		end
	end
end)

-- Set a custom price for a vehicle
RegisterServerEvent("lc_dealership:setPrice")
AddEventHandler("lc_dealership:setPrice",function(key,vehicle,price)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			price = tonumber(price) or 0
			price = math.floor(price)
			if price > 0 and price < 10000000 then
				local sql = "SELECT stock_prices FROM `dealership_owner` WHERE dealership_id = @dealership_id AND user_id = @user_id";
				local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});
				if query and query[1] then
					local arr_stock = json.decode(query[1].stock_prices)
					arr_stock[vehicle] = price
					local sql = "UPDATE `dealership_owner` SET stock_prices = @stock_prices WHERE dealership_id = @dealership_id";
					MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@stock_prices'] = json.encode(arr_stock)});
					--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['stock_price_changed'])
					TriggerClientEvent("QBCore:Notify", source, "Đã thay đổi giá bán", "success", 5000)

				else
					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['must_be_owner'])
					TriggerClientEvent("QBCore:Notify", source, "Bạn phải là chủ sở hữu để làm điều đó", "error", 5000)
	
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Giá trị không hợp lệ", "error", 5000)
				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
			end
		end
	end
end)

function hasStockSlots(query,dealership_id,amount)
	local stock_capacity = Config.dealership_types[Config.dealership_locations[dealership_id].type].stock_capacity
	if query and query[1] and getStockAmount(query[1].stock) + amount <= stock_capacity then
		return true
	else
		return false
	end
end

function getStockAmount(stock)
	local arr_stock = json.decode(stock)
	local count = 0
	for k,v in pairs(arr_stock) do
		count = count + v
	end
	return count
end

local paid_vehicle = {}
-- Event called when customer click to buy a vehicle
RegisterServerEvent("lc_dealership:buyVehicle")
AddEventHandler("lc_dealership:buyVehicle",function(key,vehicle)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			local sql = "SELECT stock, stock_sold, stock_prices FROM `dealership_owner` WHERE dealership_id = @dealership_id";
			local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});
			
			local arr_stock = {}
			local arr_stock_prices = {}
			local arr_stock_sold = {}
			local query_dealership_stock  = {}
			if not query or not query[1] then 
				-- If does not have a owner, get the stock from dealership_stock
				if Config.default_stock == false then
					local sql = "SELECT amount FROM `dealership_stock` WHERE vehicle = @vehicle";
					query_dealership_stock = MySQL.Sync.fetchAll(sql, {['@vehicle'] = vehicle});
					if query_dealership_stock and query_dealership_stock[1] then
						arr_stock[vehicle] = query_dealership_stock[1].amount
					else
						arr_stock[vehicle] = 0
					end
				else
					arr_stock[vehicle] = Config.default_stock
				end
				arr_stock_prices[vehicle] = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_customer
			else
				-- Else, get the stock from database dealership_owner.stock
				arr_stock = json.decode(query[1].stock)
				arr_stock_sold = json.decode(query[1].stock_sold)
				arr_stock_prices = json.decode(query[1].stock_prices)
				if arr_stock and not arr_stock[vehicle] then arr_stock[vehicle] = 0 end
				if arr_stock_sold and not arr_stock_sold[vehicle] then arr_stock_sold[vehicle] = 0 end
				if arr_stock_prices and not arr_stock_prices[vehicle] then arr_stock_prices[vehicle] = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_customer end
			end
			if arr_stock and arr_stock[vehicle] > 0 then
				local price = arr_stock_prices[vehicle]
				local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].name
				if tryPayment(source,price,Config.Framework.account_customers) then
					if query and query[1] then 
						-- Remove the vehicle from stock and update de table if has owner
						arr_stock[vehicle] = arr_stock[vehicle] - 1
						arr_stock_sold[vehicle] = arr_stock_sold[vehicle] + 1
						if arr_stock[vehicle] == 0 then arr_stock[vehicle] = nil end -- Clear empty stock
						local sql = "UPDATE `dealership_owner` SET stock = @stock, stock_sold = @stock_sold WHERE dealership_id = @dealership_id";
						MySQL.Sync.execute(sql, {['@stock'] = json.encode(arr_stock), ['@stock_sold'] = json.encode(arr_stock_sold), ['@dealership_id'] = key});
						giveDealershipMoney(key,price)
					end
					
					if query_dealership_stock and query_dealership_stock[1] then
						-- Remove from default stock when doesnt have owner
						arr_stock[vehicle] = arr_stock[vehicle] - 1
						local sql = "UPDATE `dealership_stock` SET amount = @amount WHERE vehicle = @vehicle";
						MySQL.Sync.execute(sql, {['@amount'] = arr_stock[vehicle], ['@vehicle'] = vehicle});
					end

					paid_vehicle[source] = true
					TriggerClientEvent("lc_dealership:spawnVehicle",source,vehicle,GeneratePlate())
					TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['bought_vehicle']:format(veh_name))
					insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_vehicle_bought']:format(veh_name),price,0,1)
					SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_vehicle_bought']:format(key,vehicle,price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
				else
					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
					TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Cửa hàng không có đủ hàng chiếc xe này", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_stock'])
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:setVehicleOwned")
AddEventHandler("lc_dealership:setVehicleOwned",function(vehicleProps, vehicle_model)
	local source = source
	if paid_vehicle[source] then
		paid_vehicle[source] = nil
		insertVehicleOnGarage(source,vehicleProps,vehicle_model)
	end
end)

-- Customer click to sell a vehicle. Insert the vehicle on the request table and the dealer owner must accept the buy
RegisterServerEvent("lc_dealership:sellVehicle")
AddEventHandler("lc_dealership:sellVehicle",function(key,vehicle,plate,price)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	price = math.floor(tonumber(price) or 0)
	
	local owner_id = getDealershipOwner(key)
	if owner_id then
		if price > 0 then
			local sql = "INSERT INTO `dealership_requests` (`dealership_id`, `user_id`, `vehicle`, `request_type`, `plate`, `name`, `price`) VALUES (@dealership_id, @user_id, @vehicle, @request_type, @plate, @name, @price);";
			MySQL.insert(sql, {['@dealership_id'] = key, ['@user_id'] = user_id, ['@vehicle'] = vehicle, ['@request_type'] = 0, ['@plate'] = plate, ['@name'] = getPlayerName(user_id), ['@price'] = price});
			TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['sell_request_created']:format(price), "success")
			local tPlayer = QBCore.Functions.GetPlayerByCitizenId(owner_id)
			if tPlayer then
				TriggerClientEvent("QBCore:Notify", source, "Yêu cầu bán đã được tạo", "success", 5000)

				--TriggerClientEvent("lc_dealership:Notify",tPlayer.PlayerData.source,"sucesso",Lang[Config.lang]['sell_request_created_owner'])
			end
			openUI(source,key,true,true)
			SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_sell_used_vehicle_request']:format(key,vehicle,plate,price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
		else
			TriggerClientEvent("QBCore:Notify", source, "Giá trị không hợp lệ", "error", 5000)

			--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
		end
	else
		if Config.sell_vehicles.sell_without_owner then
			local sell_price = Config.dealership_types[Config.dealership_locations[key].type].vehicles[vehicle].price_to_customer * Config.sell_vehicles.percentage
			if hasVehicle(user_id,vehicle) then
				deleteSoldVehicle(user_id,plate)
				giveMoney(source,sell_price,Config.Framework.account_customers)
				TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['sold_vehicle']:format(sell_price), "success")
				openUI(source,key,true,true)
				SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_sell_used_vehicle_without_owner']:format(key,vehicle,plate,sell_price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
			else
				TriggerClientEvent("lc_dealership:closeUI",source)
				TriggerClientEvent("QBCore:Notify", source, "Bạn không sở hữu chiếc xe này", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['not_own_this_vehicle_2'])
			end
		else
			TriggerClientEvent("QBCore:Notify", source, "Cửa hàng này không có chủ sỡ hữu", "error", 5000)

			--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['no_owner'])
		end
	end
end)

-- Customer cancel the pending request to sell vehicle
RegisterServerEvent("lc_dealership:cancelSellVehicle")
AddEventHandler("lc_dealership:cancelSellVehicle",function(key,id)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid

	local sql = "SELECT request_type, status FROM `dealership_requests` WHERE id = @id";
	local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});

	if query and query[1] and query[1].request_type == 0 and (query[1].status == 0 or query[1].status == 3) then
		local sql = "DELETE FROM `dealership_requests` WHERE id = @id";
		MySQL.Sync.execute(sql, {['@id'] = id});
		TriggerClientEvent("QBCore:Notify", source, "Yêu cầu của bạn đã bị hủy", "success", 5000)

		--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['buy_request_cancelled'])
		openUI(source,key,true,true)
	else
		TriggerClientEvent("QBCore:Notify", source, "Bạn không thể hủy yêu cầu này", "error", 5000)

		--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_cancel_request'])
	end
end)

-- Customer get the money from a sold used vehicle if the owner accepted
RegisterServerEvent("lc_dealership:finishSellVehicle")
AddEventHandler("lc_dealership:finishSellVehicle",function(key,id)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid

	local sql = "SELECT request_type, status, price, vehicle, plate FROM `dealership_requests` WHERE id = @id";
	local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});

	if query and query[1] and query[1].request_type == 0 and query[1].status == 2 then
		local sql = "DELETE FROM `dealership_requests` WHERE id = @id";
		MySQL.Sync.execute(sql, {['@id'] = id});

		giveMoney(source,query[1].price,Config.Framework.account_customers)
		TriggerClientEvent("QBCore:Notify", source, "Đã bán xe", "success", 5000)
		--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['sold_vehicle'])
		openUI(source,key,true,true)
		SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_sell_used_vehicle_finish']:format(key,query[1].vehicle,query[1].plate,query[1].price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
	else
		TriggerClientEvent("QBCore:Notify", source, "Bạn không thể hủy yêu cầu này", "error", 5000)

		--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_cancel_request'])
	end
end)

-- Event called when owner click to hire a player
RegisterServerEvent("lc_dealership:hirePlayer")
AddEventHandler("lc_dealership:hirePlayer",function(key,user)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			if isOwner(key,user_id) then
				-- Check if reached the max employee amount
				local sql = "SELECT COUNT(user_id) as qtd FROM `dealership_hired_players` WHERE dealership_id = @dealership_id";
				local query = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key});
				local max_employees = Config.dealership_types[Config.dealership_locations[key].type].max_employees
				if query[1].qtd < max_employees then
					local name = getPlayerName(user)
					if name then
						-- Check if player is not already a employee
						local sql = "SELECT user_id FROM `dealership_hired_players` WHERE user_id = @user_id";
						local query = MySQL.Sync.fetchAll(sql,{['@user_id'] = user});
						if not query or not query[1] then
							-- Insert new employee
							local sql = "INSERT INTO `dealership_hired_players` (`user_id`, `dealership_id`, `name`, `timer`) VALUES (@user_id, @dealership_id, @name, @timer);";
							MySQL.insert(sql, {['@user_id'] = user, ['@dealership_id'] = key, ['@name'] = name, ['@timer'] = os.time()});
							openUI(source,key,true)
							
							TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['hired_user']:format(name), "success")
						else
							TriggerClientEvent("QBCore:Notify", source, "Đã tuyển dụng nhân viên", "success", 5000)

							--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['user_employed'])
						end
					else
						TriggerClientEvent("QBCore:Notify", source, "Không tìm thấy người chơi", "error", 5000)

						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['user_not_found'])
					end
				else
					TriggerClientEvent("QBCore:Notify", source, "Đã đạt số lượng nhân viên tối đa", "error", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['max_employees'])
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Bạn không phải là chủ của cửa hàng này", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['must_be_owner'])
			end
		end
	end
end)

-- Event called when owner click to fire a player
RegisterServerEvent("lc_dealership:firePlayer")
AddEventHandler("lc_dealership:firePlayer",function(key,user)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			if isOwner(key,user_id) then
				local sql = "DELETE FROM `dealership_hired_players` WHERE user_id = @user_id AND dealership_id = @dealership_id";
				MySQL.Sync.execute(sql, {['@user_id'] = user, ['@dealership_id'] = key});
				TriggerClientEvent("QBCore:Notify", source, "Đã đuổi việc nhân viên", "success", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['fired_user'])
				openUI(source,key,true)
			else
				TriggerClientEvent("QBCore:Notify", source, "Bạn không phải là chủ của cửa hàng này", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['must_be_owner'])
			end
		end
	end
end)

-- Owner give commision amount to hired employee
RegisterServerEvent("lc_dealership:giveComission")
AddEventHandler("lc_dealership:giveComission",function(key,user,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		amount = tonumber(amount) or 0
		amount = math.floor(amount)
		if user_id then
			if amount > 0 then
				if isOwner(key,user_id) then
					local tPlayer = QBCore.Functions.GetPlayerByCitizenId(user)
					if tPlayer and tPlayer.PlayerData.source then
						if tryGetDealershipMoney(key,amount) then
							giveMoney(tPlayer.PlayerData.source,amount,Config.Framework.account_dealership)
							openUI(source,key,true)
							TriggerClientEvent("QBCore:Notify", tPlayer.PlayerData.source, "Bạn đã nhận được hoa hồng, hãy kiểm tra tài khoản của bạn", "success", 5000)

							--TriggerClientEvent("lc_dealership:Notify",tPlayer.PlayerData.source,"sucesso",Lang[Config.lang]['comission_received'])
							TriggerClientEvent("QBCore:Notify", source, "Đã gửi tiền cho nhân viên", "success", 5000)

							--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['comission_sent'])
						else
							TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

							--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
						end
					else
						TriggerClientEvent("QBCore:Notify", source, "Không tìm thấy người chơi", "error", 5000)

						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_find_user'])
					end
				else
					TriggerClientEvent("QBCore:Notify", source, "Bạn không phải là chủ của cửa hàng này", "error", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['must_be_owner'])
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Giá trị không hợp lệ", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
			end
		end
	end
end)

-- Change profile employee img
RegisterServerEvent("lc_dealership:changeProfile")
AddEventHandler("lc_dealership:changeProfile",function(key,nuser_id,banner_img,profile_img)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id  == nuser_id then
			local sql = "UPDATE `dealership_hired_players` SET banner_img = @banner_img, profile_img = @profile_img WHERE dealership_id = @dealership_id AND user_id = @user_id";
			MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@user_id'] = nuser_id, ['@profile_img'] = profile_img, ['@banner_img'] = banner_img});
		end
	end
end)

-- Change profile owner img
RegisterServerEvent("lc_dealership:changeProfileOwner")
AddEventHandler("lc_dealership:changeProfileOwner",function(key,nuser_id,banner_img,profile_img)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id  == nuser_id then
			local sql = "UPDATE `dealership_owner` SET banner_img = @banner_img, profile_img = @profile_img WHERE dealership_id = @dealership_id";
			MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@profile_img'] = profile_img, ['@banner_img'] = banner_img});
		end
	end
end)

-- Customer start a request, he pays and have to wait the owner does any action
RegisterServerEvent("lc_dealership:requestVehicle")
AddEventHandler("lc_dealership:requestVehicle",function(key,vehicle,price)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid

		local sql = "SELECT user_id, vehicle FROM `dealership_requests` WHERE user_id = @user_id AND vehicle = @vehicle AND request_type = 1";
		local query = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id, ['vehicle'] = vehicle});
		if getDealershipOwner(key) then
			if not query or not query[1] then
				price = tonumber(price)
				if price and price > 0 then
					price = math.floor(price)
					if tryPayment(source,price,Config.Framework.account_customers) then
						local sql = "INSERT INTO `dealership_requests` (`user_id`, `dealership_id`, `vehicle`, `plate`, `request_type`, `name`, `price`, `status`) VALUES (@user_id, @dealership_id, @vehicle, @plate, @request_type, @name, @price, @status);";
						MySQL.insert(sql, {['@dealership_id'] = key, ['@user_id'] = user_id, ['@vehicle'] = vehicle, ['@plate'] = '', ['@request_type'] = 1, ['@name'] = getPlayerName(user_id), ['@price'] = price, ['@status'] = 0});

						--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['request_created'])
						TriggerClientEvent("QBCore:Notify", source, "Đã tạo yêu cầu thành công", "success", 5000)


						openUI(source,key,true,true)
						SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_buy_vehicle_request']:format(key,vehicle,price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
					else
						TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
					end
				else
					TriggerClientEvent("QBCore:Notify", source, "Giá trị không hợp lệ", "error", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Bạn đã tạo yêu cầu rồi!", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['already_requested'])
			end
		else
			TriggerClientEvent("QBCore:Notify", source, "Cửa hàng này không có chủ!", "error", 5000)

			--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['no_owner'])
		end
	end
end)

-- Customer cancel his request and receive his money back
RegisterServerEvent("lc_dealership:cancelRequest")
AddEventHandler("lc_dealership:cancelRequest",function(key,id)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid

		local sql = "SELECT price, status, request_type FROM `dealership_requests` WHERE id = @id";
		local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});
		
		if query and query[1] then
			if (query[1].status == 0 or query[1].status == 3) and query[1].request_type == 1 then
				local sql = "DELETE FROM `dealership_requests` WHERE id = @id";
				MySQL.Sync.execute(sql, {['@id'] = id});

				giveMoney(source,query[1].price,Config.Framework.account_customers)
				TriggerClientEvent("QBCore:Notify", source, "Đã hủy yêu cầu!", "success", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['request_cancelled'])

				openUI(source,key,true,true)
			else
				TriggerClientEvent("QBCore:Notify", source, "Không thể hủy yêu cầu này!", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_cancel_request'])
			end
		end
	end
end)

-- When a request is complete and customer is getting his car
RegisterServerEvent("lc_dealership:finishRequest")
AddEventHandler("lc_dealership:finishRequest",function(key,id)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid

		local sql = "SELECT vehicle, status, request_type, price, user_id FROM `dealership_requests` WHERE id = @id";
		local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});
		if query and query[1] then
			if query[1].status == 2 and query[1].request_type == 1 and user_id == query[1].user_id then
				local sql = "DELETE FROM `dealership_requests` WHERE id = @id";
				MySQL.Sync.execute(sql, {['@id'] = id});
				paid_vehicle[source] = true
				TriggerClientEvent("lc_dealership:spawnVehicle",source,query[1].vehicle,GeneratePlate())
				local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[query[1].vehicle].name
				TriggerClientEvent("QBCore:Notify", source, Lang[Config.lang]['bought_vehicle']:format(veh_name), "success")
				SendWebhookMessage(Config.webhook,Lang[Config.lang]['logs_buy_vehicle_finish']:format(key,query[1].vehicle,query[1].price,user_id..os.date("\n["..Lang[Config.lang]['logs_date'].."]: %d/%m/%Y ["..Lang[Config.lang]['logs_hour'].."]: %H:%M:%S")))
			else
				TriggerClientEvent("QBCore:Notify", source, "Không thể chấp nhận yêu cầu này!", "error", 5000)
				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_accept_request'])
			end
		end
	end
end)

-- Owner accept the request, if it is a buy request, he pay and the stock increase, if it is a sell request, he goes to import the vehicle
local started_import_request = {}
RegisterServerEvent("lc_dealership:acceptRequest")
AddEventHandler("lc_dealership:acceptRequest",function(key,id)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid

		local sql = "SELECT * FROM `dealership_requests` WHERE id = @id";
		local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});
		if query and query[1] then
			if query[1].status == 0 then
				if query[1].request_type == 1 then -- Owner import vehicle
					local price = Config.dealership_types[Config.dealership_locations[key].type].vehicles[query[1].vehicle].price_to_owner
					if tryGetDealershipMoney(key,price) then
						local sql = "UPDATE `dealership_requests` SET status = 1 WHERE id = @id";
						MySQL.Sync.execute(sql, {['@id'] = id});
						local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[query[1].vehicle].name
						insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_request_started']:format(veh_name),price,1,0)
						started_import_request[source] = true
						TriggerClientEvent("lc_dealership:startContract",source,query[1].vehicle,1,false,id)
					else
						TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền!", "error", 5000)

						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
					end
				else -- Owner buy the vehicle
					-- Check if vehicle is owned by the same person
					if hasVehicle(query[1].user_id,query[1].plate) then
						if tryGetDealershipMoney(key,query[1].price) then
							-- Increase the stock by 1
							local sql = "SELECT stock FROM `dealership_owner` WHERE dealership_id = @dealership_id";
							local stock = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key})[1].stock;
							local arr_stock = json.decode(stock)
							if not arr_stock[query[1].vehicle] then arr_stock[query[1].vehicle] = 0 end
							arr_stock[query[1].vehicle] = arr_stock[query[1].vehicle] + 1
							local sql = "UPDATE `dealership_owner` SET stock = @stock WHERE dealership_id = @dealership_id";
							MySQL.Sync.execute(sql, {['@stock'] = json.encode(arr_stock), ['@dealership_id'] = key});

							-- Change the status to finished
							local sql = "UPDATE `dealership_requests` SET status = 2 WHERE id = @id";
							MySQL.Sync.execute(sql, {['@id'] = id});
							
							-- Remove the vehicle from owner
							deleteSoldVehicle(query[1].user_id,query[1].plate)

							-- Insert in balance
							local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[query[1].vehicle].name
							insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_used_vehicle_bought']:format(veh_name),query[1].price,1,0)
							TriggerClientEvent("QBCore:Notify", source, "Bạn đã mua chiếc xe này!", "success", 5000)

							--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['o_bought_vehicle'])
						else
							TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền!", "error", 5000)

							--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
						end
					else
						-- Change the status to cancelled
						local sql = "UPDATE `dealership_requests` SET status = 3 WHERE id = @id";
						MySQL.Sync.execute(sql, {['@id'] = id});
						TriggerClientEvent("QBCore:Notify", source, "Bạn không sở hữu chiếc xe này!", "error", 5000)

						--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['not_own_this_vehicle'])
					end
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Không thể chấp nhận yêu cầu này!", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_accept_request'])
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:finishImportRequestVehicle")
AddEventHandler("lc_dealership:finishImportRequestVehicle",function(key,vehicle,id)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if started_import_request[source] then
		started_import_request[source] = nil
		local sql = "SELECT * FROM `dealership_requests` WHERE id = @id";
		local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});

		local sql = "UPDATE `dealership_requests` SET status = 2 WHERE id = @id";
		MySQL.Sync.execute(sql, {['@id'] = id});
		giveDealershipMoney(key,query[1].price)

		local sql = "UPDATE `dealership_hired_players` SET jobs_done = jobs_done + 1 WHERE dealership_id = @dealership_id AND user_id = @user_id";
		MySQL.Sync.execute(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});

		local veh_name = Config.dealership_types[Config.dealership_locations[key].type].vehicles[query[1].vehicle].name
		insertBalanceHistory(key,user_id,Lang[Config.lang]['balance_request_finished']:format(veh_name),query[1].price,0,1)
		TriggerClientEvent("QBCore:Notify", source, "Bạn đã hoàn thành yêu cầu này!", "success", 5000)

		--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['request_finished'])
	end
end)

RegisterServerEvent("lc_dealership:cancelImportRequestVehicle")
AddEventHandler("lc_dealership:cancelImportRequestVehicle",function(id)
	local source = source
	if started_import_request[source] then
		started_import_request[source] = nil
		local sql = "UPDATE `dealership_requests` SET status = 0 WHERE id = @id";
		MySQL.Sync.execute(sql, {['@id'] = id});
	end
end)

-- Owner declines the request
RegisterServerEvent("lc_dealership:declineRequest")
AddEventHandler("lc_dealership:declineRequest",function(key,id)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid

		local sql = "SELECT price, status FROM `dealership_requests` WHERE id = @id";
		local query = MySQL.Sync.fetchAll(sql, {['@id'] = id});
		if query and query[1] then
			if query[1].status == 0 then
				local sql = "UPDATE `dealership_requests` SET status = 3 WHERE id = @id";
				MySQL.Sync.execute(sql, {['@id'] = id});
				TriggerClientEvent("QBCore:Notify", source, "Bạn đã từ chối yêu cầu", "success", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['request_declined'])
			else
				TriggerClientEvent("QBCore:Notify", source, "Bạn không thể từ chối yêu cầu này", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['cant_decline_request'])
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:depositMoney")
AddEventHandler("lc_dealership:depositMoney",function(key,amount)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			local amount = tonumber(amount)
			if amount and amount > 0 then
				amount = math.floor(amount)
				if tryPayment(source,amount,Config.Framework.account_dealership) then
					giveDealershipMoney(key,amount)
					TriggerClientEvent("QBCore:Notify", source, "Đã rút tiền thành công", "success", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['money_deposited'])
					-- insertBalanceHistory(key,user_id,Lang[Config.lang]['money_deposited'],amount,0,0)
					openUI(source,key,true)
				else
					TriggerClientEvent("QBCore:Notify", source, "Không đủ tiền", "error", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Không đúng giá trị", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
			end
		end
	end
end)

RegisterServerEvent("lc_dealership:withdrawMoney")
AddEventHandler("lc_dealership:withdrawMoney",function(key)
	if vrp_ready then
		local source = source
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local user_id = xPlayer.PlayerData.citizenid
		if user_id then
			if isOwner(key,user_id) then
				local sql = "SELECT money FROM `dealership_owner` WHERE dealership_id = @dealership_id";
				local query = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key})[1];
				local amount = tonumber(query.money)
				if amount and amount > 0 then
					local sql = "UPDATE `dealership_owner` SET money = 0 WHERE dealership_id = @dealership_id";
					MySQL.Sync.execute(sql, {['@dealership_id'] = key});
					giveMoney(source,amount,Config.Framework.account_dealership)
					TriggerClientEvent("QBCore:Notify", source, "Đã gửi tiền thành công", "success", 5000)

					--TriggerClientEvent("lc_dealership:Notify",source,"sucesso",Lang[Config.lang]['money_withdrawn'])
					-- insertBalanceHistory(key,user_id,Lang[Config.lang]['money_withdrawn'],amount,1,0)
					openUI(source,key,true)
				end
			else
				TriggerClientEvent("QBCore:Notify", source, "Bạn không phải là chủ", "error", 5000)

				--TriggerClientEvent("lc_dealership:Notify",source,"negado",Lang[Config.lang]['must_be_owner'])
			end
		end
	end
end)

-- Saves all vehicles spawned over dealership
local spawned_vehicles = {}
RegisterServerEvent("lc_dealership:setSpawnedVehicles")
AddEventHandler("lc_dealership:setSpawnedVehicles",function(key,loc,vehicle)
	if not spawned_vehicles[key] then spawned_vehicles[key] = {} end
	spawned_vehicles[key][loc] = vehicle
end)
RegisterServerEvent("lc_dealership:getSpawnedVehicles")
AddEventHandler("lc_dealership:getSpawnedVehicles",function(key,loc,vehicle)
	if not spawned_vehicles[key] then spawned_vehicles[key] = {} end
	TriggerClientEvent("lc_dealership:getSpawnedVehicles",source,key,loc,spawned_vehicles[key][loc],vehicle)
end)

-- RegisterServerEvent("lc_dealership:vehicleLock")
-- AddEventHandler("lc_dealership:vehicleLock",function()
-- 	local source = source
-- 	TriggerClientEvent("lc_dealership:vehicleClientLock",source)
-- end)

function getDealershipOwner(key)
	local sql = "SELECT user_id FROM `dealership_owner` WHERE dealership_id = @dealership_id";
	local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key});
	if query and query[1] then
		return query[1].user_id
	else
		return false
	end
end

function isOwner(key,user_id)
	local sql = "SELECT 1 FROM `dealership_owner` WHERE dealership_id = @dealership_id AND user_id = @user_id";
	local query = MySQL.Sync.fetchAll(sql, {['@dealership_id'] = key, ['@user_id'] = user_id});
	if query and query[1] then
		return true
	else
		return false
	end
end

function giveDealershipMoney(dealership_id,amount)
	local sql = "UPDATE `dealership_owner` SET money = money + @amount, total_money_earned = total_money_earned + @amount WHERE dealership_id = @dealership_id";
	MySQL.Sync.execute(sql, {['@amount'] = amount, ['@dealership_id'] = dealership_id});
end

function tryGetDealershipMoney(dealership_id,amount)
	local sql = "SELECT money FROM `dealership_owner` WHERE dealership_id = @dealership_id";
	local query = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = dealership_id})[1];
	if query and tonumber(query.money) >= amount then
		sql = "UPDATE `dealership_owner` SET money = @money, total_money_spent = total_money_spent + @amount WHERE dealership_id = @dealership_id";
		MySQL.Sync.execute(sql, {['@money'] = (tonumber(query.money) - amount), ['@amount'] = amount, ['@dealership_id'] = dealership_id});
		return true
	else
		return false
	end
end

function insertBalanceHistory(dealership_id,user_id,description,amount,type,isbuy)
	local name = getPlayerName(user_id)
	local sql = "INSERT INTO `dealership_balance` (dealership_id,user_id,description,name,amount,type,isbuy,date) VALUES (@dealership_id,@user_id,@description,@name,@amount,@type,@isbuy,@date)";
	MySQL.insert(sql, {['@dealership_id'] = dealership_id, ['@user_id'] = user_id, ['@description'] = description, ['@name'] = name, ['@amount'] = amount, ['@type'] = type, ['@isbuy'] = isbuy, ['@date'] = os.time()});
end

-- Main function: this function get the data from the tables and config and send it to the JS. 
-- @param {number} source - Player server id
-- @param {string} key - Dealership id
-- @param {bool} reset - If true the interface will just be updated, use only when the interface is already opened. If false, it will open the interface
-- @param {bool} isCustomer - If true will open the interface for customer
function openUI(source, key, reset, isCustomer)
	local query = {}
	local isEmployee = false
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
		-- Get the dealership data
		local sql = "SELECT * FROM `dealership_owner` WHERE dealership_id = @dealership_id";
		query.dealership_owner = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key})[1];
		
		if isCustomer and query.dealership_owner == nil then
			-- If there is no owner and is a customer
			query.dealership_owner = {}
			query.dealership_owner.stock = false
			local sql = "SELECT * FROM `dealership_stock`";
			local dealership_stock = MySQL.Sync.fetchAll(sql,{});
			query.dealership_owner.dealership_stock = {}
			for k,v in pairs(dealership_stock) do
				query.dealership_owner.dealership_stock[v.vehicle] = v.amount
			end
		else
			-- Else, get the others data
			query.dealership_owner.stock_amount = getStockAmount(query.dealership_owner.stock)
			
			local sql = "SELECT * FROM `dealership_hired_players` WHERE dealership_id = @dealership_id ORDER BY timer DESC";
			query.dealership_hired_players = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key});
			
			if not isCustomer then
				-- Get owners data
				sql = "SELECT * FROM `dealership_balance` WHERE dealership_id = @dealership_id AND date > @date_now - 28944000 ORDER BY date DESC";
				query.dealership_balance = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key, ['@date_now'] = os.time()});
				
				sql = "SELECT * FROM `dealership_requests` WHERE dealership_id = @dealership_id AND (status = 0 OR status = 1)";
				query.dealership_requests = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key});

				-- Get the online players
				local xPlayers = QBCore.Functions.GetPlayers()
				query.players  = {}
				for i=1, #xPlayers, 1 do
					local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
					table.insert(query.players, {
						source     = xPlayers[i],
						identifier = xPlayer.PlayerData.citizenid,
						name       = xPlayer.PlayerData.name
					})
				end

				-- Check if the player is a employee
				local sql = "SELECT 1 FROM `dealership_hired_players` WHERE dealership_id = @dealership_id AND user_id = @user_id";
				local query_isemployee = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key, ['@user_id'] = user_id});
				if query_isemployee and query_isemployee[1] then
					isEmployee = true
				end
			end
		end

		if isCustomer then
			-- Get the customer owned vehicles to display on store list to sell
			local vehicles = dontAskMeWhatIsThis(user_id)

			query.owned_vehicles  = {}
			for k,v in pairs(vehicles) do
				if not v.id then -- Not in requests table
					local vehicleProps = json.decode(v.mods)	
					local model = vehicleProps.model
					table.insert(query.owned_vehicles, {model = model, plate = v.plate, price = v.price, id = v.id, status = v.status})
				else
					table.insert(query.owned_vehicles, {vehicle = v.mods, plate = v.plate, price = v.price, id = v.id, status = v.status})
				end
			end
			
			local sql = "SELECT * FROM `dealership_requests` WHERE dealership_id = @dealership_id AND request_type = 1";
			query.dealership_requests = MySQL.Sync.fetchAll(sql,{['@dealership_id'] = key});
		end

		-- Get the configs
		query.config = {}
		query.config.lang = deepcopy(Config.lang)
		query.config.format = deepcopy(Config.format)
		query.config.dealership_locations = deepcopy(Config.dealership_locations[key])
		query.config.dealership_types = deepcopy(Config.dealership_types[Config.dealership_locations[key].type])
		query.config.default_stock = deepcopy(Config.default_stock)
		query.config.warning = 0

		-- Generate the warning for owner if he does not enought stock
		if not isCustomer and Config.clear_dealerships.active then
			local arr_stock = json.decode(query.dealership_owner.stock)
			local count_stock = tablelength(arr_stock)
			local count_items = tablelength(Config.dealership_types[Config.dealership_locations[key].type].vehicles)
			if query.dealership_owner.stock_amount < (Config.dealership_types[Config.dealership_locations[key].type].stock_capacity)*(Config.clear_dealerships.min_stock_amount/100) then
				query.config.warning = 1
			elseif count_stock < count_items*(Config.clear_dealerships.min_stock_variety/100) then
				query.config.warning = 2
			else 
				local sql = "UPDATE `dealership_owner` SET timer = @timer WHERE dealership_id = @dealership_id";
				MySQL.Sync.execute(sql, {['timer'] = os.time(), ['@dealership_id'] = key});
			end
		end

		query.user_id = user_id

		-- Send to front-end
		TriggerClientEvent("lc_dealership:open",source, query, reset, isCustomer or false, isEmployee or false)
	end
end

function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function print_table(node)
	if type(node) == "table" then
		-- to make output beautiful
		local function tab(amt)
			local str = ""
			for i=1,amt do
				str = str .. "\t"
			end
			return str
		end
	
		local cache, stack, output = {},{},{}
		local depth = 1
		local output_str = "{\n"
	
		while true do
			local size = 0
			for k,v in pairs(node) do
				size = size + 1
			end
	
			local cur_index = 1
			for k,v in pairs(node) do
				if (cache[node] == nil) or (cur_index >= cache[node]) then
				
					if (string.find(output_str,"}",output_str:len())) then
						output_str = output_str .. ",\n"
					elseif not (string.find(output_str,"\n",output_str:len())) then
						output_str = output_str .. "\n"
					end
	
					-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
					table.insert(output,output_str)
					output_str = ""
				
					local key
					if (type(k) == "number" or type(k) == "boolean") then
						key = "["..tostring(k).."]"
					else
						key = "['"..tostring(k).."']"
					end
	
					if (type(v) == "number" or type(v) == "boolean") then
						output_str = output_str .. tab(depth) .. key .. " = "..tostring(v)
					elseif (type(v) == "table") then
						output_str = output_str .. tab(depth) .. key .. " = {\n"
						table.insert(stack,node)
						table.insert(stack,v)
						cache[node] = cur_index+1
						break
					else
						output_str = output_str .. tab(depth) .. key .. " = '"..tostring(v).."'"
					end
	
					if (cur_index == size) then
						output_str = output_str .. "\n" .. tab(depth-1) .. "}"
					else
						output_str = output_str .. ","
					end
				else
					-- close the table
					if (cur_index == size) then
						output_str = output_str .. "\n" .. tab(depth-1) .. "}"
					end
				end
	
				cur_index = cur_index + 1
			end
	
			if (#stack > 0) then
				node = stack[#stack]
				stack[#stack] = nil
				depth = cache[node] == nil and depth + 1 or depth - 1
			else
				break
			end
		end
	
		-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
		table.insert(output,output_str)
		output_str = table.concat(output)
	
		print(output_str)
	else
		print(node)
	end
end