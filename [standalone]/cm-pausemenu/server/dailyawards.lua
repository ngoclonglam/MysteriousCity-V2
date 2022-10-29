if Config.DisplayPage["AWARDSPAGE"] then

    local dailyAwardsData = {}
    local dailyAwardsDayCounter = 1
    local dailyAwardsUpdatedAt = 0

    function GetDailyAwardsData()
        local result = ExecuteSql("SELECT * FROM codem_daily_awards_day_counter")
        if result[1] then
            dailyAwardsDayCounter = result[1].counter
            dailyAwardsUpdatedAt = result[1].updatedAt
            if #Config.DailyAwardsItem < dailyAwardsDayCounter then
                dailyAwardsDayCounter = 1
                dailyAwardsUpdatedAt = os.time()
                ExecuteSql(string.format("UPDATE `codem_daily_awards_day_counter` SET counter = '%s',  updatedAt = '%s'", json.encode(dailyAwardsDayCounter), dailyAwardsUpdatedAt))
                ExecuteSql(string.format("UPDATE `codem_daily_awards` SET claimedDays = %q", json.encode({})))
            end
        else
            ExecuteSql("INSERT INTO `codem_daily_awards_day_counter` (`counter`, `updatedAt`) VALUES ('1', '"..os.time().."')")
            dailyAwardsUpdatedAt = os.time()
        end

        local awardsResult = ExecuteSql("SELECT * FROM codem_daily_awards")
        for _,v in pairs(awardsResult) do
            local data = {
                identifier = v.identifier,
                claimedDays = json.decode(v.claimedDays),
            }
            table.insert(dailyAwardsData, data)
        end
    end


    Citizen.CreateThread(function()
        while not Core do
            Citizen.Wait(0)
        end
        RegisterCallback('codem-pausemenu:GetDailyAwardsDayCounter', function(source, cb)
            cb(dailyAwardsDayCounter)
        end)
        RegisterCallback('codem-pausemenu:GetDailyAwardData', function(source, cb)
            local identifier = GetIdentifier(source)
            cb(GetDailyAwardDataByIdentifier(identifier))
        end)

    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(30000)
            local difftime = os.difftime(os.time(), dailyAwardsUpdatedAt)
            if difftime >= 86400 or difftime <= 0 then
                dailyAwardsDayCounter = tonumber(dailyAwardsDayCounter) + 1
                local reset = false
                if #Config.DailyAwardsItem < dailyAwardsDayCounter then
                    dailyAwardsDayCounter = 1
                    reset = true
                end
                for _,v in pairs(GetPlayers()) do
                    local isPauseMenuOpen = Player(tonumber(v)).state.isPauseMenuOpen
                    if isPauseMenuOpen then
                        local identifier = GetIdentifier(v)
                        if identifier then
                            local data = GetDailyAwardDataByIdentifier(identifier)
                            TriggerClientEvent('codem-pausemenu:GetDailyAwardsDayCounter', v, dailyAwardsDayCounter)
                            if reset then
                                data.claimedDays = {}
                                TriggerClientEvent('codem-pausemenu:GetDailyAwardData', v, data)
                            end
                        end
                    end
                end

                dailyAwardsUpdatedAt = os.time()
                ExecuteSql(string.format("UPDATE `codem_daily_awards_day_counter` SET counter = '%s',  updatedAt = '%s'", json.encode(dailyAwardsDayCounter), dailyAwardsUpdatedAt))
                ExecuteSql(string.format("UPDATE `codem_daily_awards` SET claimedDays = %q", json.encode({})))

            end
        end
    end)


    Citizen.CreateThread(function()
        while not Core do
            Citizen.Wait(0)
        end
        GetDailyAwardsData()
    end)



    function CanClaimDailyAward(identifier)
        local data = GetDailyAwardDataByIdentifier(identifier)
        if data then
            for _,v in pairs(data.claimedDays) do
                if v == tonumber(dailyAwardsDayCounter) then
                    return false
                end
            end
            return true
        end
        return false
    end

    function GetDailyAwardDataByIdentifier(identifier)
        for _,v in pairs(dailyAwardsData) do
            if v.identifier == identifier then
                return v
            end
        end
        return false
    end



    RegisterServerEvent('codem-dailyawards:ClaimItem')
    AddEventHandler('codem-dailyawards:ClaimItem', function(item, itemDay)
        local src = source
        local identifier = GetIdentifier(src)
        local data = GetDailyAwardDataByIdentifier(identifier)
        if data then
            if CanClaimDailyAward(identifier) and tonumber(itemDay) == tonumber(dailyAwardsDayCounter) then
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
                table.insert(data.claimedDays, dailyAwardsDayCounter)
                ExecuteSql(string.format("UPDATE `codem_daily_awards` SET claimedDays = %q WHERE identifier = '%s'", json.encode(data.claimedDays), identifier))
                TriggerClientEvent('codem-pausemenu:GetDailyAwardData', src, data)
            end
        end
    end)

    function CreateDailyAwardsData(source)
        local identifier = GetIdentifier(source)
        local awardsData = ExecuteSql(string.format("SELECT * FROM codem_daily_awards WHERE identifier = '%s'", identifier))

        if GetDailyAwardDataByIdentifier(identifier) or awardsData[1] then
            return false
        end
        local data = {
            identifier = identifier,
            claimedDays = {},
        }
        table.insert(dailyAwardsData, data)
        ExecuteSql( string.format("INSERT INTO `codem_daily_awards` (`identifier`,  `claimedDays`) VALUES ('%s',  %q)", data.identifier, json.encode(data.claimedDays) ) )
        return true
    end

    RegisterServerEvent('codem-pausemenu:CheckPlayerDailyAwardsData')
    AddEventHandler('codem-pausemenu:CheckPlayerDailyAwardsData', function()
        local src = source
        while not Core do
            Citizen.Wait(0)
        end
        CreateDailyAwardsData(src)
    end)
end
