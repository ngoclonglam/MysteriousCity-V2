local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('5m_farming:buyItem')
AddEventHandler('5m_farming:buyItem', function(item, count, price)
	local x = QBCore.Functions.GetPlayer(source)
	if x.Functions.RemoveMoney('cash', count * price) then
		x.Functions.AddItem(item, count)
	elseif x.Functions.RemoveMoney('bank', count * price) then
		x.Functions.AddItem(item, count)
	end
end)

RegisterNetEvent('5m_farming:removeItem')
AddEventHandler('5m_farming:removeItem', function(item)
	local x = QBCore.Functions.GetPlayer(source)
	x.Functions.RemoveItem(item, 1)
end)

RegisterNetEvent('5m_farming:giveItem')
AddEventHandler('5m_farming:giveItem', function (item, count)
	local x = QBCore.Functions.GetPlayer(source)

	if item == 'wheat_seed' then
		x.Functions.AddItem('wheat', count)
	elseif item == 'orange_seed' then
		x.Functions.AddItem('orange', count)
	elseif item == 'coffee_seed' then
		x.Functions.AddItem('coffeee', count)
	elseif item == 'bean_seed' then
		x.Functions.AddItem('bean', count)
	end
end)

QBCore.Functions.CreateUseableItem('wheat_seed', function(source)
	TriggerClientEvent('5m_farming:useItem', source, 'wheat_seed', 'Lúa')
	
end)

QBCore.Functions.CreateUseableItem('orange_seed', function(source)
	TriggerClientEvent('5m_farming:useItem', source, 'orange_seed', 'Cam')
	
end)

QBCore.Functions.CreateUseableItem('coffee_seed', function(source)
	TriggerClientEvent('5m_farming:useItem', source, 'coffee_seed', 'Coffee')
	
end)

QBCore.Functions.CreateUseableItem('bean_seed', function(source)
	TriggerClientEvent('5m_farming:useItem', source, 'bean_seed', 'Đậu')
end)

QBCore.Functions.CreateUseableItem('giesskanne_voll', function(source)
	TriggerClientEvent('5m_farming:useKanne', source)
	TriggerClientEvent('t1ger_drugs:useKanne', source)
end)

QBCore.Functions.CreateUseableItem('giesskanne_leer', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('wheat_seed') then
		TriggerClientEvent('5m_farming:fillKanne', source)
	else
		TriggerClientEvent('QBCore:Notify', 'Bạn không có vật phẩm này', 'error')
	end
end)

RegisterNetEvent('5m_farming:fillKanne')
AddEventHandler('5m_farming:fillKanne', function()
	local x = QBCore.Functions.GetPlayer(source)

	x.Functions.AddItem('giesskanne_voll', 1)
	x.Functions.RemoveItem('giesskanne_leer', 1)
end)

local items = {
    ['bean'] = math.random(6, 8),
    ['coffeee'] = math.random(6, 8),
    ['orange'] = math.random(6, 8),
    ['wheat'] = math.random(6, 8)
}

RegisterNetEvent('5m_farming:sellItems')
AddEventHandler('5m_farming:sellItems', function()
	local x = QBCore.Functions.GetPlayer(source)

	for key, value in pairs(items) do
		local xitem = x.Functions.GetItemByName(key)
		if xitem then
			if xitem.amount > 0 then
				x.Functions.RemoveItem(key, xitem.amount)
				x.Functions.AddMoney('cash', xitem.amount * value)
			end
		end
	end
end)