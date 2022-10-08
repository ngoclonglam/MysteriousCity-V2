local QBCore = exports['qb-core']:GetCoreObject()

local Webhook = 'https://discord.com/api/webhooks/1012038233183494254/BNHGiYw81tqsGQtKMg3X_20YH3kAMHKA9fFo1_9ZfuWpQaJ1HJ28cuV_fRAV9mUe3C0L'

RegisterServerEvent('okokContract:changeVehicleOwner')
AddEventHandler('okokContract:changeVehicleOwner', function(data)
	local _source = data.sourceIDSeller
	local target = data.targetIDSeller
	local plate = data.plateNumberSeller
	local model = data.modelSeller
	local source_name = data.sourceNameSeller
	local target_name = data.targetNameSeller
	local vehicle_price = tonumber(data.vehicle_price)

	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local tPlayer = QBCore.Functions.GetPlayer(target)
	local webhookData = {
		model = model,
		plate = plate,
		target_name = target_name,
		source_name = source_name,
		vehicle_price = vehicle_price
	}
	
	MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @identifier AND plate = @plate', {
		['@identifier'] = xPlayer.PlayerData.citizenid,
		['@plate'] = plate
	}, function(result)
		if Config.RemoveMoneyOnSign then
			local bankMoney = tPlayer.PlayerData.money.bank

			if result[1] ~= nil  then
				if bankMoney >= vehicle_price then
					MySQL.Async.fetchAll('UPDATE player_vehicles SET citizenid = @target WHERE citizenid = @owner AND plate = @plate', {
						['@owner'] = xPlayer.PlayerData.citizenid,
						['@target'] = tPlayer.PlayerData.citizenid,
						['@plate'] = plate
					}, function (result2)
						if result2 ~= 0 then	
							tPlayer.Functions.RemoveMoney('bank', vehicle_price)
							xPlayer.Functions.AddMoney('bank', vehicle_price)

							TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Bạn đã bán thành công chiếc xe<b> "..model.."</b> với biển số xe<b>"..plate.."</b>", 10000, 'success')
							TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Bạn đã mua thành công chiếc xe <b> "..model.."</b> với biển số xe<b>"..plate.."</b>", 10000, 'success')
							TriggerClientEvent('vehiclekeys:client:SetOwner', target, plate)
							if Webhook ~= '' then
								sellVehicleWebhook(webhookData)
							end
						end
					end)
				else
					TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", target_name.." không có đủ tiền để mua xe của bạn", 10000, 'error')
					TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Bạn không có đủ tiền để mua xe của "..source_name, 10000, 'error')
				end
			else
				TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Chiếc xe có biển số <b> "..plate.."</b> không phải của bạn", 10000, 'error')
				TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", source_name.." đã cố gắng bán cho bạn một chiếc xe mà anh ấy không sở hữu", 10000, 'error')
			end
		else
			if result[1] ~= nil then
				MySQL.Async.fetchAll('UPDATE player_vehicles SET citizenid = @target WHERE citizenid = @owner AND plate = @plate', {
					['@owner'] = xPlayer.PlayerData.citizenid,
					['@target'] = tPlayer.PlayerData.citizenid,
					['@plate'] = plate
				}, function (result2)
					if result2 ~= 0 then
						TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Bạn đã bán thành công chiếc xe <b> "..model.."</b> với biển số <b>"..plate.."</b>", 10000, 'success')
						TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Bạn đã mua thành công chiếc xe <b> "..model.."</b> với biển số <b>"..plate.."</b>", 10000, 'success')
						TriggerClientEvent('vehiclekeys:client:SetOwner', target, plate)

						if Webhook ~= '' then
							sellVehicleWebhook(webhookData)
						end
					end
				end)
			else
				TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Chiếc xe với biển số <b> "..plate.."</b> không phải của bạn", 10000, 'error')
				TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", source_name.." đã cố gắng bán cho bạn một chiếc xe mà anh ấy không sở hữu", 10000, 'error')
			end
		end
	end)
end)

QBCore.Functions.CreateCallback('okokContract:GetTargetName', function(source, cb, targetid)
	local target = QBCore.Functions.GetPlayer(targetid)
	local targetname = target.PlayerData.name

	cb(targetname)
end)

RegisterServerEvent('okokContract:SendVehicleInfo')
AddEventHandler('okokContract:SendVehicleInfo', function(description, price)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)

	TriggerClientEvent('okokContract:GetVehicleInfo', _source, xPlayer.PlayerData.name, os.date(Config.DateFormat), description, price, _source)
end)

RegisterServerEvent('okokContract:SendContractToBuyer')
AddEventHandler('okokContract:SendContractToBuyer', function(data)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)

	TriggerClientEvent("okokContract:OpenContractOnBuyer", data.targetID, data)
	TriggerClientEvent('okokContract:startContractAnimation', data.targetID)

	if Config.RemoveContractAfterUse then
		xPlayer.Functions.RemoveItem('contract', 1)
	end
end)

QBCore.Functions.CreateUseableItem('contract', function(source)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)

	TriggerClientEvent('okokContract:OpenContractInfo', _source)
	TriggerClientEvent('okokContract:startContractAnimation', _source)
end)

-------------------------- SELL VEHICLE WEBHOOK

function sellVehicleWebhook(data)
	local information = {
		{
			["color"] = Config.sellVehicleWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'VEHICLE SALE',
			["description"] = '**Vehicle: **'..data.model..'**\nPlate: **'..data.plate..'**\nBuyer name: **'..data.target_name..'**\nSeller name: **'..data.source_name..'**\nPrice: **'..data.vehicle_price..'€',

			["footer"] = {
				["text"] = os.date(Config.WebhookDateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end