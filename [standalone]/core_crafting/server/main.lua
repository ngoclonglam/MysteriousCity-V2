local QBCore = exports['qb-core']:GetCoreObject()

function setCraftingLevel(citizenid, level)
    exports.oxmysql:execute('UPDATE players SET crafting_level = @xp WHERE citizenid = @citizenid',{["@xp"] = level, ["@citizenid"] = identifier}, function() end)
end

function giveCraftingLevel(citizenid, level)
   exports.oxmysql:execute('UPDATE players SET crafting_level = crafting_level + "'..level..'" WHERE citizenid = "'..citizenid..'"', function() end)
end

RegisterServerEvent("core_crafting:setExperiance")
AddEventHandler("core_crafting:setExperiance", function(citizenid, xp)
        setCraftingLevel(citizenid, xp)
end)

RegisterServerEvent("core_crafting:giveExperiance")
AddEventHandler("core_crafting:giveExperiance", function(citizenid, xp)
        giveCraftingLevel(citizenid, xp)
end)

function craft(src, item, retrying)
    local Player = QBCore.Functions.GetPlayer(src)
    local cancraft = true

    local count = Config.Recipes[item].amount

    if not retrying then
        for k, v in pairs(Config.Recipes[item].Ingredients) do
		
            if Player.Functions.GetItemByName(k) == nil or Player.Functions.GetItemByName(k).amount < v then
				cancraft = false
			end
			
        end
    end

    if cancraft then
		for k, v in pairs(Config.Recipes[item].Ingredients) do
			Player.Functions.RemoveItem(k, v)
		end

		TriggerClientEvent("core_crafting:craftStart", src, item, count)
	else
		TriggerClientEvent("core_crafting:sendMessage", src, Config.Text["not_enough_ingredients"])
	end
end

RegisterServerEvent("core_crafting:itemCrafted")
AddEventHandler("core_crafting:itemCrafted", function(item, count)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
		local citizenid = Player.PlayerData.citizenid

        if Config.Recipes[item].SuccessRate > math.random(0, Config.Recipes[item].SuccessRate) then
					Player.Functions.AddItem(item, count)
					Citizen.Wait(500)
                    TriggerClientEvent("core_crafting:sendMessage", src, Config.Text["item_crafted"])
                    giveCraftingLevel(citizenid, Config.ExperiancePerCraft)
        else
            TriggerClientEvent("core_crafting:sendMessage", src, Config.Text["crafting_failed"])
        end
end)

RegisterServerEvent("core_crafting:craft")
AddEventHandler("core_crafting:craft", function(item, retrying)
        local src = source
        craft(src, item, retrying)
end)

QBCore.Functions.CreateCallback("core_crafting:getXP",function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)
		local identifier = Player.PlayerData.citizenid
		
		exports.oxmysql:fetch('SELECT crafting_level FROM players WHERE citizenid = @citizenid', {['@citizenid'] = identifier}, function(result)
			json.decode(result[1].charinfo)
			
			if result[1] ~= nil then
				cb(json.decode(result[1].crafting_level))
			else
				cb(nil)
		end
	end)
end)

--[[QBCore.Functions.CreateCallback("core_crafting:getItemNames", function(source, cb)
        local names = {}

        exports.oxmysql:fetch(
            "SELECT * FROM items WHERE 1",
            {},
            function(info)
                for _, v in ipairs(info) do
                    --names[v.name] = v.label
					names[v.name] = QBCore.Shared.Items[v.name:lower()]
                end

                cb(names)
            end
        )
end)]]