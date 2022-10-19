local QBCore = exports['qb-core']:GetCoreObject()

objects = {}

if Config.ObjectDropLoot then
	CreateThread(function()
	    while true do
	        Wait(0)
	        for k,v in pairs(Config.ObjectsLoot) do
		        	local player = PlayerPedId()
		        	local distanceobject = 2.2
		            local obj = GetClosestObjectOfType(GetEntityCoords(player).x, GetEntityCoords(player).y, GetEntityCoords(player).z, distanceobject, v, false, true ,true)
		            local distance = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(obj), true)
		    


			    if distance <= distanceobject then

		            local ObjectCoords = GetEntityCoords(obj)

		            if not objects[obj] then
		            ESX.Game.Utils.DrawText3D(ObjectCoords + vector3(0.0, 0.0, 0.5), '~c~PRESS ~b~[E]~c~ TO SEARCH', 1, 4)
		        	end

		            if IsControlJustReleased(0, 38) then
		                if not objects[obj] then

		                    SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
		                    RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
							while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
								Wait(10)
							end
							TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 2.0, 2.0, 4000, 30, 0, 0, 0, 0)
							Wait(4000)
							randomChance = math.random(1, 100)
							randomWeapon = Config.WeaponLootObject[math.random(1, #Config.WeaponLootObject)]
							randomItem = Config.ItemLootObject[math.random(1, #Config.ItemLootObject)]

							if randomChance > 0 and randomChance < Config.ProbabilityWeaponLootObject then
								local randomAmmo = math.random(1, 30)
								GiveWeaponToPed(PlayerPedId(), randomWeapon, randomAmmo, true, false)
								ESX.ShowNotification('You found ' .. randomWeapon)
							elseif randomChance >= Config.ProbabilityWeaponLootObject and randomChance < Config.ProbabilityMoneyLootObject then
								TriggerServerEvent('qb-zombie:moneyloot')
							elseif randomChance >= Config.ProbabilityMoneyLootObject and randomChance < Config.ProbabilityItemLootObject then
								TriggerServerEvent('qb-zombie:itemloot', randomItem)
							elseif randomChance >= Config.ProbabilityItemLootObject and randomChance < 100 then
								ESX.ShowNotification('You not found nothing')
							end
							objects[obj] = true
		               	end
		            end
		        end
		    end
		end
	end)
end
