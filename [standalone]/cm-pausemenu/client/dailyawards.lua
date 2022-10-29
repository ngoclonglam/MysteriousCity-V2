
RegisterNUICallback('claimDailyItem', function(data, cb)
    local item = data.item
    local itemDay = data.itemDay
    TriggerServerEvent('codem-dailyawards:ClaimItem', item, itemDay)
    cb('ok')
end)

RegisterNetEvent('codem-pausemenu:GetDailyAwardData')
AddEventHandler('codem-pausemenu:GetDailyAwardData', function(data)
    SendNUIMessage({
        action = "SET_DAILY_AWARD_DATA",
        payload = data
    })
end)

RegisterNetEvent('codem-pausemenu:GetDailyAwardsDayCounter')
AddEventHandler('codem-pausemenu:GetDailyAwardsDayCounter', function(day)
    SendNUIMessage({
        action = "SET_DAILY_AWARDS_DAY_COUNTER",
        payload = day
    })
end)