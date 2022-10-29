if Config.DisplayPage["BATTLEPASSPAGE"] then
    local battlepassData = {}
    local battlepassMissions = {}
    local battlepassDayCounter = 30
    function GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)
        for _,v in pairs(battlepassData) do
            if v.identifier == identifier then
                return v
            end
        end
        return false
    end
    Citizen.CreateThread(function()
        while not Core do
            Citizen.Wait(0)
        end
        RegisterCallback('codem-pausemenu:GetBattlepassDayCounter', function(source, cb)
            cb(battlepassDayCounter)
        end)
        RegisterCallback('codem-pausemenu:GetBattlepassData', function(source, cb)
            local myData = GetPlayerBattlepassData(source)
            if not myData then
                CreateBattlepassData(source)
                myData = GetPlayerBattlepassData(source)
            end
            cb(myData)
        end)

    end)
    AddEventHandler('playerDropped', function()
        local myData = GetPlayerBattlepassData(source)
        if myData then
            ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d, level = %d WHERE identifier='%s'", myData.xp, myData.level, myData.identifier))
        end
    end)

    RegisterServerEvent('codem-pausemenu:VerifyTbxId')
    AddEventHandler('codem-pausemenu:VerifyTbxId', function(tbxId)
        local src = source
        local identifier = GetIdentifier(src)
        local result =  ExecuteSql(string.format("SELECT * FROM codem_battlepass_transactions WHERE tbx_id = '%s'", tbxId))
        if result[1] then
            local myData = GetPlayerBattlepassData(src)
            if not myData then
                CreateBattlepassData(src)
                myData = GetPlayerBattlepassData(src)
            end
            if not ToBoolean(myData.purchased) and not Config.FreeBattlepass then
                ExecuteSql(string.format("DELETE FROM codem_battlepass_transactions WHERE tbx_id = '%s'", tbxId))
                myData.purchased = 1
                ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET purchased = %d WHERE identifier='%s'", myData.purchased, identifier))
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', src, myData)
                TriggerClientEvent('codem-pausemenu:SendNotification', src, Config.NotificationText["PURCHASED_BATTLEPASS"].text, Config.NotificationText["PURCHASED_BATTLEPASS"].timeout)
            else
                TriggerClientEvent('codem-pausemenu:SendNotification', src, Config.NotificationText["ALREADY_PURCHASED"].text, Config.NotificationText["ALREADY_PURCHASED"].timeout )

            end
        end
    end)


    RegisterServerEvent('codem-pausemenu:AddBattlepassMissionProgress')
    AddEventHandler('codem-pausemenu:AddBattlepassMissionProgress', function(id, progress)
        local src = source
        local identifier = GetIdentifier(src)
        local myData = GetPlayerBattlepassData(src)
        if myData then
            for _,v in pairs(myData.missions) do
                if tonumber(v.id) == tonumber(id) and not v.completed then
                    local amount = progress or 1
                    v.progress = tonumber(v.progress) + tonumber(amount)
                    for _, j in pairs(Config.BattlepassMissions) do
                        if tonumber(v.id) == tonumber(j.id) then
                            if v.progress >= j.repeatAmount then
                                v.completed = true
                                v.progress = j.repeatAmount
                                AddXP(src, tonumber(j.xpAmount))
                                Config.ServerNotification(src, Config.NotificationText["MISSON_COMPLETED"].text, Config.NotificationText["MISSON_COMPLETED"].type, Config.NotificationText["MISSON_COMPLETED"].timeout)
                            end
                        end
                    end
                end
            end
            --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET missions = %q WHERE identifier='%s'", json.encode(myData.missions), identifier))
            local isPauseMenuOpen = Player(tonumber(src)).state.isPauseMenuOpen
            if isPauseMenuOpen then
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', src, myData)
            end
        end
    end)

    for _,v in pairs(Config.BattlepassMissions) do
        if  v.serverEvent then
            RegisterServerEvent(v.event)
            AddEventHandler(v.event, function()
                TriggerClientEvent('codem-pausemenu:AddBattlepassMissionProgress', v.id)
            end)
        end
    end

    function CheckIdContains(data, id)
        for _,v in pairs(data) do
            if tonumber(v.id) == tonumber(id) then
                return true
            end
        end
    end

    function CreateBattlepassDailyMissionsData()
        local data = {}
        local amount = Config.BattlepassMissionsPerDay
        if amount > #Config.BattlepassMissions then
            amount = math.random(1, #Config.BattlepassMissions)
        end
        for i = 1, amount do
            local rndMission =  Config.BattlepassMissions[math.random(1, #Config.BattlepassMissions)]
            local contains = CheckIdContains(data, rndMission.id)
            while contains do
                rndMission = Config.BattlepassMissions[math.random(1, #Config.BattlepassMissions)]
                contains = CheckIdContains(data, rndMission.id)
            end
            rndMission.func = {}
            table.insert(data, rndMission)
        end
        local playerMissionsData = {}
        for _,v in pairs(data) do
            table.insert(playerMissionsData, {
                id = v.id,
                progress = 0,
                completed = false,
            })
        end
        ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET missions = %q", json.encode(playerMissionsData)))
        for _,v in pairs(battlepassData) do
            v.missions = playerMissionsData
        end
        return data
    end


    function ToBoolean(num)
        local bool = true
        if num == 0 then
            bool = false
        end
        return bool
    end

    RegisterServerEvent('codem-pausemenu:ClaimBattlepassItem')
    AddEventHandler('codem-pausemenu:ClaimBattlepassItem', function(item, itemLevel)
        local src = source
        local identifier = GetIdentifier(src)
        local myData = GetPlayerBattlepassData(src)
        if myData then
            local level = myData.level
            local levels = myData.claimedLevels
            if tonumber(level) < tonumber(itemLevel) then
                return
            end
            for _,v in pairs(levels) do
                if tonumber(v) == tonumber(itemLevel) then
                    return
                end
            end
            if item.premium then
                if not ToBoolean(myData.purchased) and not Config.FreeBattlepass then
                    TriggerClientEvent('codem-pausemenu:SendNotification', src, Config.NotificationText["PREMIUM_ITEM"].text, Config.NotificationText["PREMIUM_ITEM"].timeout)
                    return
                end
            end
            table.insert(myData.claimedLevels, itemLevel)
            ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET claimedLevels = %q WHERE identifier='%s'", json.encode(myData.claimedLevels), identifier))
            TriggerClientEvent('codem-pausemenu:SetBattlepassData', src, myData)
            if item.type == 'money' then
                GiveMoney(src, tonumber(item.amount))
                TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_CASH"].text, tostring(item.amount)), Config.NotificationText["CLAIMED_ITEM"].timeout)
            elseif item.type == 'item' then
                GiveItem(src, item.name, tonumber(item.amount))
                TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_ITEM"].text, tostring(item.amount), item.label), Config.NotificationText["CLAIMED_ITEM"].timeout)
            elseif item.type == 'vehicle' then
                GiveVehicle(src, item.name, item.garage)
                TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_VEHICLE"].text, item.label), Config.NotificationText["CLAIMED_VEHICLE"].timeout)
            elseif item.type == 'weapon' then
                GiveWeapon(src, item.name, tonumber(item.amount))
                TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_ITEM"].text, tostring(item.amount), item.label), Config.NotificationText["CLAIMED_ITEM"].timeout)

            elseif item.type == 'box' then
                for _,v in pairs(item.items) do
                    if v.type == 'weapon' then
                        GiveWeapon(src, v.name, tonumber(v.amount))
                        TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_ITEM"].text, tostring(v.amount), v.label), Config.NotificationText["CLAIMED_ITEM"].timeout)

                    elseif v.type == 'vehicle' then
                        GiveVehicle(src, v.name, v.garage)
                        TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_VEHICLE"].text, v.label), Config.NotificationText["CLAIMED_VEHICLE"].timeout)

                    elseif v.type == 'item' then
                        GiveItem(src, v.name, tonumber(v.amount))
                        TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_ITEM"].text, tostring(v.amount), v.label), Config.NotificationText["CLAIMED_ITEM"].timeout)

                    elseif v.type == 'money' then
                        GiveMoney(src, tonumber(v.amount))
                        TriggerClientEvent('codem-pausemenu:SendNotification', src, string.format(Config.NotificationText["CLAIMED_CASH"].text, tostring(v.amount)), Config.NotificationText["CLAIMED_ITEM"].timeout)
                    end
                end
            end


        end
    end)

    Citizen.CreateThread(function ()
        while not Core do
            Citizen.Wait(0)
        end

        local result = ExecuteSql("SELECT * FROM codem_battlepass_data")
        for _,v in pairs(result) do
            v.claimedLevels = json.decode(v.claimedLevels)
            v.missions = json.decode(v.missions)
        end
        battlepassData = result
        local result =  ExecuteSql("SELECT * FROM codem_battlepass_day_counter")
        if result[1] then
            battlepassDayCounter = tonumber(result[1].counter)
        else
            ExecuteSql(string.format("INSERT INTO `codem_battlepass_day_counter` (counter) VALUES ('%s')", Config.BattlepassDayCountDown))
            battlepassDayCounter = Config.BattlepassDayCountDown
        end

        local result = ExecuteSql("SELECT * FROM codem_battlepass_dailymissions")
        if result[1] then
            result[1].missions = json.decode(result[1].missions)
            battlepassMissions = result[1]
            local difftime = os.difftime(os.time(), battlepassMissions.updatedAt)
            if difftime >= 86400 or difftime <= 0 then
                local data = CreateBattlepassDailyMissionsData()
                local time = os.time()
                battlepassMissions.missions = data
                battlepassMissions.updatedAt = time
                ExecuteSql(string.format("UPDATE `codem_battlepass_dailymissions` SET missions = %q, updatedAt = '%s'", json.encode(battlepassMissions.missions), time))
            end
        else
            local data = CreateBattlepassDailyMissionsData()
            local time = os.time()
            battlepassMissions.missions = data
            battlepassMissions.updatedAt = time
            ExecuteSql(string.format("INSERT INTO `codem_battlepass_dailymissions` (missions, updatedAt) VALUES (%q, '%s')", json.encode(battlepassMissions.missions), time))
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(30000)
            local difftime = os.difftime(os.time(), battlepassMissions.updatedAt)
            if difftime >= 86400 or difftime <= 0 then
                local data = CreateBattlepassDailyMissionsData()
                local time = os.time()
                battlepassMissions.missions = data
                battlepassMissions.updatedAt = time
                battlepassDayCounter = battlepassDayCounter - 1
                if battlepassDayCounter == 0 then
                    battlepassDayCounter = Config.BattlepassDayCountDown
                    ExecuteSql(string.format("UPDATE `codem_battlepass_day_counter` SET counter = '%s'", Config.BattlepassDayCountDown))
                    ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET level = %d, xp = %d, purchased = %d, claimedLevels= %q", 1, 0, 0, json.encode({})))
                    for _,v in pairs(battlepassData) do
                        v.level = 1
                        v.xp = 0
                        v.purchased = 0
                        v.claimedLevels = {}
                    end
                else
                    ExecuteSql(string.format("UPDATE `codem_battlepass_day_counter` SET counter = '%s'", battlepassDayCounter))
                end

                ExecuteSql(string.format("UPDATE `codem_battlepass_dailymissions` SET missions = %q, updatedAt = '%s'", json.encode(battlepassMissions.missions), time))
                for _,v in pairs(GetPlayers()) do
                    local myData = GetPlayerBattlepassData(tonumber(v))
                    if myData then
                        TriggerClientEvent('codem-pausemenu:SetBattlepassData', v, myData)
                    end
                    TriggerClientEvent('codem-pausemenu:SetBattlepassMissionsData', v, battlepassMissions)
                    TriggerClientEvent('codem-pausemenu:SetBattlepassRemainDay', v, battlepassDayCounter)
                end

            end
        end
    end)

    RegisterServerEvent('codem-pausemenu:AddBattlepassXP')
    AddEventHandler('codem-pausemenu:AddBattlepassXP', function()
        local src = source
        AddXP(src, 1000)
    end)

    RegisterServerEvent('codem-pausemenu:CheckBattlepassData')
    AddEventHandler('codem-pausemenu:CheckBattlepassData', function ()
        local src = source
        CreateBattlepassData(src)
        local myData = GetPlayerBattlepassData(src)
        TriggerClientEvent('codem-pausemenu:SetBattlepassData', src, myData)
    end)

    RegisterServerEvent('codem-pausemenu:CheckPlayerBattlepassMissionsData')
    AddEventHandler('codem-pausemenu:CheckPlayerBattlepassMissionsData', function()
        local src = source
        TriggerClientEvent('codem-pausemenu:SetBattlepassMissionsData', src, battlepassMissions)
    end)

    function CreateBattlepassData(source)
        local identifier = GetIdentifier(source)
        if GetPlayerBattlepassData(source) or not identifier then
            return
        end
        local missions = {}

        for _,v in pairs(battlepassMissions.missions) do
            table.insert(missions, {
                id = v.id,
                progress = 0,
                completed = false,
            })
        end

        local data = {
            identifier = identifier,
            level = 1,
            xp = 0,
            purchased = 0,
            claimedLevels = {},
            missions = missions,
        }
        table.insert(battlepassData, data)
        ExecuteSql(string.format("INSERT INTO codem_battlepass_data (identifier, level, xp, purchased, claimedLevels, missions) VALUES ('%s', '%s', '%s', '"..data.purchased.."', %q, %q)", data.identifier, data.level, data.xp, json.encode(data.claimedLevels), json.encode(data.missions) ))
        return data
    end

    AddEventHandler('onResourceStop', function(resourceName)
        if (GetCurrentResourceName() ~= resourceName) then
          return
        end
    end)

    RegisterCommand('addbattlepassxp', function (source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if tonumber(args[1]) and tonumber(args[2]) and isAdmin then
            AddXP(tonumber(args[1]), tonumber(args[2]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/addbattlepassxp playerId xpAmount'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    RegisterCommand('removebattlepassxp', function (source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if tonumber(args[1]) and tonumber(args[2]) and isAdmin then
            RemoveXP(tonumber(args[1]), tonumber(args[2]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/removebattlepassxp playerId xpAmount'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    RegisterCommand('setbattlepassxp', function (source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if tonumber(args[1]) and tonumber(args[2]) and isAdmin then
            SetXP(tonumber(args[1]), tonumber(args[2]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/setbattlepassxp playerId xpAmount'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    RegisterCommand('addbattlepasslevel', function(source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if isAdmin and tonumber(args[1]) then
            AddLevel(tonumber(args[1]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/addbattlepasslevel playerId'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    RegisterCommand('removebattlepasslevel', function(source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if isAdmin and tonumber(args[1]) then
            RemoveLevel(tonumber(args[1]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/removebattlepasslevel playerId'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)

        end
    end)

    RegisterCommand('setbattlepasslevel', function(source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if isAdmin and tonumber(args[1]) and tonumber(args[2]) then
            SetLevel(tonumber(args[1]), tonumber(args[2]))
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/setbattlepasslevel playerId level'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)

        end
    end)

    RegisterCommand('givebattlepass', function(source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if tonumber(args[1]) and isAdmin then
            local myData = GetPlayerBattlepassData(tonumber(args[1]))
            local identifier = GetIdentifier(tonumber(args[1]))
            if identifier then
                myData.purchased = 1
                ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET purchased = %d WHERE identifier='%s'", 1, identifier))
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', tonumber(args[1]), myData)
            end
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/givebattlepass playerId'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    RegisterCommand('removebattlepass', function(source, args)
        local isAdmin = CheckIsAdmin(source, Config.AdminPermissions)
        if tonumber(args[1]) and isAdmin then
            local myData = GetPlayerBattlepassData(tonumber(args[1]))
            local identifier = GetIdentifier(tonumber(args[1]))
            if identifier then
                myData.purchased = 0
                ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET purchased = %d WHERE identifier='%s'", 0, identifier))
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', tonumber(args[1]), myData)
            end
        else
            Config.ServerNotification(source, string.format(Config.NotificationText["ADMIN_ERROR"].text, '/removebattlepass playerId'), Config.NotificationText["ADMIN_ERROR"].type, Config.NotificationText["ADMIN_ERROR"].timeout)
        end
    end)

    function AddXP(source, xp)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)
        if not xp and xp <= 0 then
            return
        end
        if myData then
            local level = myData.level
            if level == #Config.BattlepassItem then
                myData.xp = 0
                local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
                if isPauseMenuOpen then
                    TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
                end
                return
            end
            myData.xp = tonumber(myData.xp) + tonumber(xp)
            if Config.BattlepassItem[level] and myData.xp >= Config.BattlepassItem[level].requiredXP then
                local remainXp = Config.BattlepassItem[level].requiredXP-myData.xp
                AddLevel(source)
                if remainXp < 0 then
                    AddXP(source, -(remainXp))
                end
            else
                --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d WHERE identifier='%s'", myData.xp, identifier))
                local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
                if isPauseMenuOpen then
                    TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
                end
            end

        end
    end

    function RemoveXP(source, xp)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)

        if not xp and xp <= 0 then
            return
        end
        if myData then

            myData.xp = tonumber(myData.xp) - tonumber(xp)
            if myData.xp < 0 then
                RemoveLevel(source)
            else
                --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d WHERE identifier='%s'", myData.xp, identifier))
                local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
                if isPauseMenuOpen then
                    TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
                end
            end
        end
    end

    function SetXP(source, xp)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)

        if not xp and xp <= 0 then
            return
        end
        if myData then

            local level = myData.level
            myData.xp = tonumber(xp)
            if Config.BattlepassItem[level] and myData.xp >= Config.BattlepassItem[level].requiredXP then
                AddLevel(source)
            else
                --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d WHERE identifier='%s'", myData.xp, identifier))
                local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
                if isPauseMenuOpen then
                    TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
                end
            end
        end
    end

    function AddLevel(source)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)

        if myData then

            myData.level = myData.level + 1
            if not Config.BattlepassItem[myData.level] then
                myData.level = #Config.BattlepassItem
                myData.xp = Config.BattlepassItem[myData.level].requiredXP
            else
                myData.xp = 0
            end

           -- ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d, level = %d WHERE identifier='%s'", myData.xp, myData.level, identifier))
            local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
            if isPauseMenuOpen then
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
            end
            return myData.level
        end
    end

    function RemoveLevel(source)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)

        if myData then

            myData.level = myData.level - 1
            if myData.level <= 0 then
                myData.level = 1
            end
            myData.xp = 0
            --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d, level = %d WHERE identifier='%s'", myData.xp, myData.level, identifier))
            local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
            if isPauseMenuOpen then
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
            end
            return myData.level
        end
    end

    function SetLevel(source, level)
        local myData = GetPlayerBattlepassData(source)
        local identifier = GetIdentifier(source)

        if not level and level <= 0 then
            return
        end
        if myData and tonumber(myData.level) ~= tonumber(level) then

            myData.level = level
            if myData.level <= 0 then
                myData.level = 1
            elseif not Config.BattlepassItem[myData.level] then
                myData.level = #Config.BattlepassItem
                myData.xp = Config.BattlepassItem[myData.level].requiredXP
            end
            myData.xp = 0
            --ExecuteSql(string.format("UPDATE `codem_battlepass_data` SET xp = %d, level = %d WHERE identifier='%s'", myData.xp, myData.level, identifier))
            local isPauseMenuOpen = Player(tonumber(source)).state.isPauseMenuOpen
            if isPauseMenuOpen then
                TriggerClientEvent('codem-pausemenu:SetBattlepassData', source, myData)
            end
            return myData.level
        end
    end

    RegisterCommand('battlepass', function (source, args)
        if source > 0 then
            return
        end
        ExecuteSql(string.format("INSERT INTO codem_battlepass_transactions (tbx_id) VALUES ('%s')", args[1]))
    end)
end

Citizen.CreateThread(function()
    while not Core do
        Citizen.Wait(0)
    end

    if Config.Framework == 'esx' then
        RegisterCallback('codem-pausemenu:GetPlayerCash', function(source, cb)
            local player = GetPlayer(source)
            if player then
                cb(player.getMoney())
            else
                cb(0)
            end
        end)
    end
end)