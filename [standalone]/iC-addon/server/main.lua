local QBCore = exports['qb-core']:GetCoreObject()
-- local continue = false

-- function getPriceByName(name)
--     for k, v in pairs(Config.concessionaria) do
--         if k == name then 
--             return v.price
-- 		end
--     end
--     return 0
-- end

-- function giveMoneyOffline(citizenid, amount)
--     MySQL.Async.fetchAll('SELECT money FROM players WHERE citizenid = ?', {
--         citizenid
--     },function(account)
--         if account[1] then
--             local playerAccount = json.decode(account[1].money)
--             playerAccount.bank = playerAccount.bank + amount
--             playerAccount = json.encode(playerAccount)
--             MySQL.update('UPDATE players SET money = ? WHERE citizenid = ?', { playerAccount, citizenid })
--             continue = true
--         end
--     end)
-- end

-- QBCore.Commands.Add('refundtruck', 'aaa', {}, false, function(source, args)
--     local allPlayerTrucker = MySQL.Sync.fetchAll('SELECT * FROM trucker_trucks')
--     for i=1, #allPlayerTrucker, 1 do
--         local Player = QBCore.Functions.GetPlayerByCitizenId(allPlayerTrucker[i].user_id)
--         if Player then 
--             Player.Functions.AddMoney('bank', getPriceByName(allPlayerTrucker[i].truck_name), 'refund trucker')
--         else 
--             giveMoneyOffline(allPlayerTrucker[i].user_id, getPriceByName(allPlayerTrucker[i].truck_name))
--             while not continue do
--                 Wait(10)
--             end
--             continue = false
--         end
--     end
--     TriggerClientEvent('QBCore:Notify', source, "Đã refund tổng cộng "..#allPlayerTrucker.." chiếc xe", "success")
-- end, 'god')

-- QBCore.Commands.Add('removetruck', 'aaa', {}, false, function(source, args)
--     MySQL.Sync.execute('DELETE FROM trucker_trucks;')
-- end, 'god')

QBCore.Functions.CreateUseableItem("rename-card", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("iC-addon:client:reNameCharacter", src)
end)

function giveIDCard(src)
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('id_card', 1)
    Player.Functions.RemoveItem('driver_license', 1)
    local info = {}
    info.citizenid = Player.PlayerData.citizenid
    info.firstname = Player.PlayerData.charinfo.firstname
    info.lastname = Player.PlayerData.charinfo.lastname
    info.birthdate = Player.PlayerData.charinfo.birthdate
    info.gender = Player.PlayerData.charinfo.gender
    info.nationality = Player.PlayerData.charinfo.nationality
    Player.Functions.AddItem('id_card', 1, false, info)
    ----
    local info1 = {}
    info1.firstname = Player.PlayerData.charinfo.firstname
    info1.lastname = Player.PlayerData.charinfo.lastname
    info1.birthdate = Player.PlayerData.charinfo.birthdate
    info1.type = "Class C Driver License"
    Player.Functions.AddItem('driver_license', 1, false, info1)
end

RegisterNetEvent('iC-addon:server:reNameCharacter', function(firstname, lastname)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    Player.Functions.RemoveItem('rename-card', 1)
    MySQL.Async.fetchAll('SELECT charinfo FROM players WHERE citizenid = ?', {
        citizenid
    },function(charinfo)
        if charinfo[1] then
            local playerChar = json.decode(charinfo[1].charinfo)
            Player.PlayerData.charinfo.firstname = firstname
            Player.PlayerData.charinfo.lastname = lastname
            playerChar.firstname = firstname
            playerChar.lastname = lastname
            playerChar = json.encode(playerChar)
            MySQL.update('UPDATE players SET charinfo = ? WHERE citizenid = ?', { playerChar, citizenid })
            Player.Functions.SetCharName(lastname, firstname)
            giveIDCard(src)
        end
    end)
end)