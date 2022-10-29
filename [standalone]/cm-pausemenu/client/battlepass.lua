RegisterNetEvent('codem-pausemenu:SetBattlepassData')
AddEventHandler('codem-pausemenu:SetBattlepassData', function (data)
    SendNUIMessage({
        action = "SET_BATTLEPASS_DATA",
        payload = data
    })
end)

RegisterNUICallback('ClaimBattlepassItem', function(data, cb)
    local item = data.item
    local itemLevel = data.itemLevel
    TriggerServerEvent('codem-pausemenu:ClaimBattlepassItem', item, itemLevel)
    cb('ok')
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(600000)
        TriggerServerEvent('codem-pausemenu:AddBattlepassXP')

    end
end)

RegisterNetEvent('codem-pausemenu:AddBattlepassMissionProgress')
AddEventHandler('codem-pausemenu:AddBattlepassMissionProgress', function(id)
    TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', id)
end)

RegisterNetEvent('codem-pausemenu:SetBattlepassRemainDay')
AddEventHandler('codem-pausemenu:SetBattlepassRemainDay', function(day)
    SendNUIMessage({
        action = "SET_BATTLEPASS_REMAIN_DAY",
        payload = day
    })
end)


local missionsCache = {}
RegisterNetEvent('codem-pausemenu:SetBattlepassMissionsData')
AddEventHandler('codem-pausemenu:SetBattlepassMissionsData', function(missions)
    SendNUIMessage({
        action = 'SET_BATTLEPASS_MISSIONS',
        payload = missions,
    })
    for _,v in pairs(Config.BattlepassMissions) do
        for _, j in pairs(missions.missions) do
            if tonumber(j.id) == tonumber(v.id) and not missionsCache[v.id] then
                v.func(v)
                missionsCache[v.id] = true
            end
        end
    end
end)
