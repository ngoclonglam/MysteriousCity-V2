QBCore = exports['qb-core']:GetCoreObject()
-------------------------
--Written by Tościk#9715-
-------------------------

local maxchicken = 10   -- max ammount of live chickens you can hold
local maxDead = 20   -- how many dead chickens you can hold
local maxPackage = 20    --how many packed chickens you can hold
local GotowkaSprzedaz = math.random(80, 100)   --ammount of money you get for 1 packaged chickens

-----------------------------
---nizej lepiej nie ruszaj---
-----------------------------


RegisterServerEvent('tost:wkladajKurczki')
AddEventHandler('tost:wkladajKurczki', function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local item = xPlayer.Functions.GetItemByName('alive_chicken')

	if item == nil then
		xPlayer.Functions.AddItem('alive_chicken', 3)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['alive_chicken'], 'add')
	else
		if item.amount < maxchicken then
			xPlayer.Functions.AddItem('alive_chicken', 3)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['alive_chicken'], 'add')
		else
			TriggerClientEvent('QBCore:Notify', source, 'Bạn chỉ có thể chứa tối đa '..maxchicken..' con gà', "error")
		end

	end
end)

RegisterServerEvent('tostKurczaki:przerob')
AddEventHandler('tostKurczaki:przerob', function(opcja)
	-- local id = PlayerId()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	-- local playerName = xPlayer.PlayerData.name
	
		
	local a_chicken = xPlayer.Functions.GetItemByName('alive_chicken')
	local s_chicken = xPlayer.Functions.GetItemByName('slaughtered_chicken')
	local p_chicken = xPlayer.Functions.GetItemByName('packaged_chicken')
	local lucky = math.random(1, 100)
	local info = {
		url = 'https://cdn.discordapp.com/attachments/1002855360572436550/1024008849339994243/dieman7.png'
	}
	if opcja == 1 then
		if a_chicken.amount > 0 and s_chicken == nil then
			xPlayer.Functions.RemoveItem('alive_chicken', 1)
			xPlayer.Functions.AddItem('slaughtered_chicken', 2)
			TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['slaughtered_chicken'], 'add')
			
		else
			
			if s_chicken.amount >= maxDead then
				--TriggerClientEvent('esx:showNotification', source, '~y~Y ~g~'..maxDead.. '~y~ martwych kurczaków.')
				TriggerClientEvent('QBCore:Notify', _source, 'Bạn chỉ có thể giữ ' ..maxDead.. ' gà chết cùng một lúc', 'error')
				Wait(1000)
			else
				if lucky == 1 then xPlayer.Functions.AddItem('printerdocument', 1, false, info) end
				xPlayer.Functions.AddItem('slaughtered_chicken', 2)
				xPlayer.Functions.RemoveItem('alive_chicken', 1)
				TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['slaughtered_chicken'], 'add')
			end
		end
	end

	if opcja == 2 then
		-- local invent = xPlayer.Functions.getInventoryItem("packaged_chicken")
		-- print(invent.count)
		-- if s_chicken.amount > 0 and s_chicken == nil then 
		-- 	xPlayer.Functions.RemoveItem('slaughtered_chicken', 2)
		-- 	xPlayer.Functions.AddItem('packaged_chicken', 2)
		-- 	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['packaged_chicken'], 'add')
		-- else
		if s_chicken then
			if s_chicken.amount >= maxPackage  then
				TriggerClientEvent('QBCore:Notify', 'Bạn chỉ có thể giữ ' ..maxPackage.. ' gói gà cùng một lúc!', 'error')
				Wait(1000)
			-- else
			-- 	xPlayer.Functions.AddItem('packaged_chicken', 2)
			-- 	xPlayer.Functions.RemoveItem('slaughtered_chicken', 2)
			-- 	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['packaged_chicken'], 'add')
			-- end
			end
		end
	end

	if opcja == 3 then
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		if p_chicken.amount > 0 then
			print(p_chicken.amount)
			--TriggerServerEvent('QBCore:Server:RemoveItem', 'packaged_chicken', 1)
			--xPlayer.Functions.RemoveItem('packaged_chicken', 1)
			Player.Functions.RemoveItem("packaged_chicken", p_chicken.amount)
			local cash = GotowkaSprzedaz * p_chicken.amount
			xPlayer.Functions.AddMoney('cash', cash, 'Bán gà')
			TriggerClientEvent('QBCore:Notify', source, 'Bạn đã bán gói gà và được $' ..cash, 'success')
			Wait(1000)
		end
	end

end)
