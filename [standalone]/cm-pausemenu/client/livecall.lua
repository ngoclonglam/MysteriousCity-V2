RegisterNUICallback('closeLiveCall', function(data, cb)

    TriggerServerEvent('codem-livecall:CloseCall')
    cb('ok')
end)

RegisterNUICallback('sendlivechatmessage', function(data, cb)
    local message = data.message
    TriggerServerEvent('codem-pausemenu:sendLiveChatMessage',message)
    cb('ok')
end)
RegisterNUICallback('sendlivechatmessageadmin', function(data, cb)
    local message = data.message
    local identifier = data.identifier
    TriggerServerEvent('codem-pausemenu:sendLiveChatMessageadmin',message,identifier)
    cb('ok')
end)

RegisterNUICallback('firstLiveCallSave', function(data, cb)

    TriggerServerEvent('codem-pausemenu:firstLiveCallSave')
    cb('ok')
end)
RegisterNUICallback('callLiveData', function(data, cb)

    TriggerServerEvent('codem-pausemenu:callLiveData')
    cb('ok')
end)


RegisterNetEvent('codem-pausemenu:getCallLiveData')
AddEventHandler('codem-pausemenu:getCallLiveData', function(value)
    SendNUIMessage({
        action = "getCallData",
        val = value
    })

end)

RegisterNUICallback('getMessageData', function(data, cb)

    TriggerServerEvent('codem-pausemenu:getSelectMessage', data.identifier)
    cb('ok')
end)

RegisterNUICallback('closeLiveCallAdmin', function(data, cb)

    TriggerServerEvent('codem-pausemenu:adminCloseLiveCall', data.identifier)
    cb('ok')
end)




RegisterNetEvent('codem-pausemenu:selectMessage')
AddEventHandler('codem-pausemenu:selectMessage', function(data)

    SendNUIMessage({
        action = "GET_CALL_MESSAGE",
        callmessagedata = data
    })

end)



RegisterNetEvent('codem-pausemenu:timeupdate')
AddEventHandler('codem-pausemenu:timeupdate', function(data)
   
    SendNUIMessage({
        action = "UPDATE_LIVECALL_TIME",
        time = data
    })

end)

RegisterNetEvent('codem-pausemenu:updateChat')
AddEventHandler('codem-pausemenu:updateChat', function(data)
   
    SendNUIMessage({
        action = "UPDATE_LIVECALL_MESSAGE",
        messagedata = data
    })

end)
