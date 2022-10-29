if Config.DisplayPage["LIVECALLPAGE"] then
    calllivedata = {}
    calllivemessagedata = {}

    Citizen.CreateThread(function()

        local data = ExecuteSql(string.format("SELECT * FROM `codem_livecall`"))
        local newMessageData = {}
        local newallData = {}
        for k,v in pairs(data) do
           newMessageData[v.identifier] = json.decode(v.message)
           table.insert(newallData, {
            callid = v.id,
            callidentifier = v.identifier,
            callmessage = json.decode(v.message),
            calldate = v.date,
            calltime = v.time,
            callname = v.playername
         })
        end
        calllivedata = newallData
        calllivemessagedata = newMessageData
    end)


    RegisterServerEvent("codem-livecall:CloseCall")
    AddEventHandler('codem-livecall:CloseCall', function()
        local src = source
        local identifier = GetIdentifier(src)
        ExecuteSql("DELETE FROM codem_livecall WHERE identifier = '"..identifier.."'")
        for k ,v in pairs(calllivedata) do
            if v.callidentifier == identifier then

                table.remove(calllivedata, k)
                refreshTable()
            end
        end
        Citizen.Wait(100)
        TriggerClientEvent('codem-pausemenu:updateChat',src,{})
        deleteTable()
        TriggerClientEvent('codem-pausemenu:SendNotification', src, Config.NotificationText["LIVE_CALL_TERMINATED"].text, Config.NotificationText["LIVE_CALL_TERMINATED"].timeout)

    end)
    RegisterServerEvent("codem-pausemenu:adminCloseLiveCall")
    AddEventHandler('codem-pausemenu:adminCloseLiveCall', function(identifier)
        local src = source

        ExecuteSql("DELETE FROM codem_livecall WHERE identifier = '"..identifier.."'")
        for k ,v in pairs(calllivedata) do
            if v.callidentifier == identifier then

                table.remove(calllivedata, k)
                refreshTable()
            end
        end
        Citizen.Wait(100)
        TriggerClientEvent('codem-pausemenu:updateChat',src,{})
        TriggerClientEvent('codem-pausemenu:getCallLiveData',src,calllivedata)
        TriggerClientEvent('codem-pausemenu:SendNotification', src, Config.NotificationText["LIVE_CALL_TERMINATED"].text, Config.NotificationText["LIVE_CALL_TERMINATED"].timeout)

    end)






    RegisterServerEvent('codem-pausemenu:firstLiveCallSave')
    AddEventHandler('codem-pausemenu:firstLiveCallSave', function()

        local src = source
        local name = GetPlayerRoleplayName(src)
        local identifier = GetIdentifier(src)
        local emptyTable = {}
        local date = os.date("%y.%m.%d %X") --> 17/12/02 23:02:49
        local time = os.date('%X')
        local check = saveCheck(identifier)


        if check then
            local newsql = ExecuteSql(string.format("INSERT INTO `codem_livecall` (`identifier`,`playername`,`message`,`date`,`time`) VALUES ('"..identifier.."', '"..name.."','"..json.encode(emptyTable).."','"..date.."','"..time.."')"))
            refreshTable()
            Citizen.Wait(250)
            adminNotify()
            Citizen.Wait(100)
            for k,v in pairs(calllivedata) do
                if v.callidentifier == identifier then
                    TriggerClientEvent('codem-pausemenu:timeupdate',src,v.calldate)

                end

            end

        else
            for k,v in pairs(calllivedata) do
                if v.callidentifier == identifier then
                    TriggerClientEvent('codem-pausemenu:timeupdate',src,v.calldate)
                    TriggerClientEvent('codem-pausemenu:updateChat',src,calllivemessagedata[identifier])
                end

            end



        end

    end)

    function refreshTable()
        local data = ExecuteSql(string.format("SELECT * FROM `codem_livecall`"))
        local newMessageData = {}
        local newallData = {}
        for k,v in pairs(data) do
           newMessageData[v.identifier] = json.decode(v.message)
           table.insert(newallData, {
            callid = v.id,
            callidentifier = v.identifier,
            callmessage = json.decode(v.message),
            calldate = v.date,
            calltime = v.time,
            callname = v.playername
         })
        end
        calllivedata = newallData
        calllivemessagedata = newMessageData

    end



    function adminNotify()
        for k , v in pairs(GetPlayers()) do
            local admin = CheckIsAdmin(v, Config.AdminPermissions)
            if admin then
                Config.ServerNotification(v, Config.NotificationText["NEW_CALL"].text, Config.NotificationText["NEW_CALL"].type, Config.NotificationText["NEW_CALL"].timeout)
                TriggerClientEvent('codem-pausemenu:getCallLiveData',v,calllivedata)
            end
        end
    end





    function adminMessage(identifier)
        for k , v in pairs(GetPlayers()) do
            local admin = CheckIsAdmin(v, Config.AdminPermissions)
            if admin then
                Config.ServerNotification(v, Config.NotificationText["NEW_MESSAGE"].text, Config.NotificationText["NEW_MESSAGE"].type, Config.NotificationText["NEW_CALL"].timeout)
                TriggerClientEvent('codem-pausemenu:updateChat',v,calllivemessagedata[identifier])
            end
        end
    end


    function deleteTable()
        for k , v in pairs(GetPlayers()) do
            local admin = CheckIsAdmin(v, Config.AdminPermissions)
            if admin then
                TriggerClientEvent('codem-pausemenu:getCallLiveData',v,calllivedata)
            end
        end
    end


    RegisterServerEvent('codem-pausemenu:callLiveData')
    AddEventHandler('codem-pausemenu:callLiveData', function()
        local src = source
        print(json.encode(calllivedata))
        if next(calllivedata) then
            TriggerClientEvent('codem-pausemenu:getCallLiveData',src,calllivedata)
        else
           return
        end

    end)
    RegisterServerEvent('codem-pausemenu:getSelectMessage')
    AddEventHandler('codem-pausemenu:getSelectMessage', function(identifier)
        local src = source

            TriggerClientEvent('codem-pausemenu:updateChat',src,calllivemessagedata[identifier])

        --TriggerClientEvent('codem-pausemenu:getCallLiveData',src,calllivedata)
    end)



    RegisterServerEvent('codem-pausemenu:sendLiveChatMessage')
    AddEventHandler('codem-pausemenu:sendLiveChatMessage', function(message)
        local src = source
        local name = GetPlayerRoleplayName(src)
        local identifier = GetIdentifier(src)
        if calllivemessagedata[identifier] then

            table.insert(calllivemessagedata[identifier], {
                identifier = identifier,
                message = message
             })

             adminMessage(identifier)
             TriggerClientEvent('codem-pausemenu:updateChat',src,calllivemessagedata[identifier])

        end
    end)

    RegisterServerEvent('codem-pausemenu:sendLiveChatMessageadmin')
    AddEventHandler('codem-pausemenu:sendLiveChatMessageadmin', function(message,identifier)
        local src = source
        local name = GetPlayerRoleplayName(src)
        local adminidentifier = GetIdentifier(src)
        if calllivemessagedata[identifier] then
            table.insert(calllivemessagedata[identifier], {
                identifier = adminidentifier,
                message = message
             })

            TriggerClientEvent('codem-pausemenu:updateChat',src,calllivemessagedata[identifier])
                if GetFromIdentifier(identifier) then
                    TriggerClientEvent('codem-pausemenu:updateChat',GetFromIdentifier(identifier),calllivemessagedata[identifier])
                   -- TriggerClientEvent('codem-pausemenu:updateChat',xTarget.source,calllivemessagedata[identifier])
                else


                    if calllivemessagedata[identifier] then
                        local livecalldata = json.encode(calllivemessagedata[identifier])

                        ExecuteSql(string.format("UPDATE  `codem_livecall` SET `message` = %q WHERE identifier = '".. identifier.."'",livecalldata))
                    end
                end


            --  adminMessage(identifier)
        end
    end)

    function GetFromIdentifier(identifier)
        while not Core do
            Citizen.Wait(0)
        end
        if Config.Framework == 'esx' then
           local xTarget =  Core.GetPlayerFromIdentifier(identifier)
           if xTarget then
                return xTarget.source
           else
            return false
           end
        else
            local xTarget = Core.Functions.GetPlayerByCitizenId(identifier)
            if xTarget then
                return xTarget.PlayerData.source
            else
                return false
            end

        end

    end
    AddEventHandler('playerDropped', function (reason)
        local src = source
        local identifier = GetIdentifier(src)
        if calllivemessagedata[identifier] then
        local livecalldata = json.encode(calllivemessagedata[identifier])

        ExecuteSql(string.format("UPDATE  `codem_livecall` SET `message` = %q WHERE identifier = '".. identifier.."'",livecalldata))
        end

    end)


    function saveCheck(identifier)
        local data = ExecuteSql("SELECT * FROM `codem_livecall` WHERE `identifier` = '"..identifier.."' ")
        if next(data) then
            return false
        else
           return true
        end
    end


end


