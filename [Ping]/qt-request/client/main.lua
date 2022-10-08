local QBCore = exports['qb-core']:GetCoreObject()
isUIOpen = false

RegisterNUICallback("closeNUI", function(_, cb)
    SetNuiFocus(false, false)
    isUIOpen = false
    cb("ok")
end)

RegisterNUICallback("Notification", function(data, cb)
    QBCore.Functions.Notify(data.msg)
    cb("ok")
end)

-- RegisterNUICallback("ready", function(data, cb)
--     isReady = true
-- end)
