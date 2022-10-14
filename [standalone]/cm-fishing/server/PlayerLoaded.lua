RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(src)

    local identifier = GetIdentifier(src)

    local name = GetName(src)
    local data = ExecuteSql("SELECT `identifier` FROM `codem-fishing` WHERE `identifier` = '"..identifier.."'")

    if next(data) then
        return
    else
        ExecuteSql("INSERT INTO `codem-fishing` (`identifier`,`playername`) VALUES ('"..identifier.."','"..name.."')")
        ExecuteSql("INSERT INTO `codem-fishing-rewards` (`identifier`) VALUES ('"..identifier.."')")
        Citizen.Wait(300)
        local data = ExecuteSql("SELECT * FROM `codem-fishing`")
        for _,v in pairs(data) do
           fishingData[v.identifier] = v
        end
    end
end)



RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    local identifier = GetIdentifier(src)

    local name = GetName(src)
    local data = ExecuteSql("SELECT `identifier` FROM `codem-fishing` WHERE `identifier` = '"..identifier.."'")

    if next(data) then
        return
    else
        ExecuteSql("INSERT INTO `codem-fishing` (`identifier`,`playername`) VALUES ('"..identifier.."','"..name.."')")
        ExecuteSql("INSERT INTO `codem-fishing-rewards` (`identifier`) VALUES ('"..identifier.."')")
        Citizen.Wait(300)
        local data = ExecuteSql("SELECT * FROM `codem-fishing`")
        for _,v in pairs(data) do
           fishingData[v.identifier] = v
        end
    end

end)


RegisterServerEvent('codem-fishing:sellitem')
AddEventHandler('codem-fishing:sellitem', function(playeritems,totalprice)
   if Config.Framework == 'esx' then
      local xPlayer = frameworkObject.GetPlayerFromId(source)
      if xPlayer then
         xPlayer.addMoney(tonumber(totalprice))
         for k ,v in pairs(playeritems) do
            xPlayer.removeInventoryItem(v.itemname, v.itemcount)
         end
      end
   else
      local xPlayer = frameworkObject.Functions.GetPlayer(source)
      if xPlayer then
         xPlayer.Functions.AddMoney('cash',tonumber(totalprice))
         for k ,v in pairs(playeritems) do
            xPlayer.Functions.RemoveItem (v.itemname, v.itemcount)
         end
      end

   end
end)




RegisterServerEvent('codem-fishing:AddItem')
AddEventHandler('codem-fishing:AddItem', function(item, amount)
local src = source
if Config.Framework == 'esx' then

   local Player = frameworkObject.GetPlayerFromId(src)
   if Player then
   Player.addInventoryItem(item, amount)
   end
else

   local Player = frameworkObject.Functions.GetPlayer(source)
   if Player then

      Player.Functions.AddItem(item,amount)
   end
end

end)

RegisterServerEvent('codem-fishing:RemoveItem')
AddEventHandler('codem-fishing:RemoveItem', function(item, amount)
local src = source
if Config.Framework == 'esx' then
   if Player then
   local Player = frameworkObject.GetPlayerFromId(src)
   Player.removeInventoryItem(item, amount)
   end
else
   local Player = frameworkObject.Functions.GetPlayer(src)
   if Player then
   Player.Functions.RemoveItem (item, amount)
   end

end
end)




Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    if Config.Framework == 'esx' then

        frameworkObject.RegisterCommand('addxp', 'admin', function(source, args, showError)
            local src = source
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(args[1]))
            local xp = args[2]
            if xPlayer then
                AddXP(xPlayer.source, xp)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)
            end
        end, true, {help = "Add xp fishing.", validate = true, arguments = {
            {name = 'id', help = "xp count", type = 'player'}
        }})

        frameworkObject.RegisterCommand('removexp', 'admin', function(source, args, showError)
            local src = source
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(args[1]))
            local xp = args[2]
            if xPlayer then
                RemoveXP(xPlayer.source, xp)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)
            end
        end, true, {help = "Remove xp fishing.", validate = true, arguments = {
            {name = 'id', help = "xp count", type = 'player'}
        }})

        frameworkObject.RegisterCommand('setlevel', 'admin', function(source, args, showError)
            local src = source
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(args[1]))
            local level = args[2]
            if xPlayer then
                SetLevel(xPlayer.source, level)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)
            end
        end, true, {help = "Remove xp fishing.", validate = true, arguments = {
            {name = 'id', help = "xp count", type = 'player'}
        }})


    else
        frameworkObject.Commands.Add('addxp', "Add xp fishing", {}, false, function(source,args)
            local src = source
            local Player = frameworkObject.Functions.GetPlayer(tonumber(args[1]))
            local xp = tonumber(args[2])
            if Player then
                AddXP(Player.PlayerData.source, xp)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)
            end
        end, 'admin')

        frameworkObject.Commands.Add('removexp', "Remove xp fishing", {}, false, function(source,args)
            local src = source
            local Player = frameworkObject.Functions.GetPlayer(tonumber(args[1]))
            local xp = tonumber(args[2])
            if Player then
                RemoveXP(Player.PlayerData.source, xp)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)
            end
        end, 'admin')

        frameworkObject.Commands.Add('setlevel', "Add xp fishing", {}, false, function(source,args)
            local src = source
            local Player = frameworkObject.Functions.GetPlayer(tonumber(args[1]))
            local level = tonumber(args[2])
            if Player then
                SetLevel(Player.PlayerData.source, level)
            else
                Config.Notification(Config.Notifications["notonline"].message, Config.Notifications["notonline"].type, true, src)

            end
        end, 'admin')


    end


end)




