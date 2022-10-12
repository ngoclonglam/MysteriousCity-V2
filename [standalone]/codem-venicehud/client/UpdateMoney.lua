

local lastCash = nil
local lastBlackMoney = nil
local lastBank = nil
function loadESXMoneyAndJob()
    local breakLoop = false
    while true do
        if frameworkObject then
            if frameworkObject.GetPlayerData() then
                while frameworkObject.GetPlayerData().job == nil do
                    Wait(0)
                end
                SendNUIMessage({
                    type = "update_job",
                    joblabel = frameworkObject.GetPlayerData().job.label,
                    grade_label = frameworkObject.GetPlayerData().job.grade_label
                })
                frameworkObject.TriggerServerCallback("codem-venicehud:GetMoney", function(cash)
                    SendNUIMessage({
                        type = "update_money",
                        money = cash
                    })
                    lastCash = cash
                end, "cash")
                frameworkObject.TriggerServerCallback("codem-venicehud:GetMoney", function(bank)
                    SendNUIMessage({
                        type = "update_bank",
                        money = bank
                    })
                    lastBank = bank
                    breakLoop = true
                end, "bank")
                if breakLoop then
                    return
                end
            end
        end
        Wait(0)
    end
end


CreateThread(function()
    while not response do
        Wait(0)
    end
    if Config.Framework == "esx" then
        Wait(1000)
        loadESXMoneyAndJob()
    else
        Wait(1000)
        local breakLoop = false
        while true do
            Wait(0)
            if frameworkObject then
                local Player = frameworkObject.Functions.GetPlayerData()
                if Player then
                    if Player.job then
                        print(Player.job.gradelabel)
                        SendNUIMessage({
                            type = "update_job",
                            joblabel = Player.job.label,
                            grade_label = Player.job.gradelabel
                        })
                    end
                    if Player.money then
                        SendNUIMessage({
                            type = "update_money",
                            money = Player.money.cash
                        })
                        lastCash = Player.money.cash
                        SendNUIMessage({
                            type = "update_bank",
                            money = Player.money.bank
                        })
                        lastBank = Player.money.bank

                        breakLoop = true
                    end

                    if breakLoop then
                        break
                    end
                end
            end
        end
    end
end)



RegisterNetEvent("es:addedMoney")
AddEventHandler("es:addedMoney", function(a, b, m)
    SendNUIMessage({
        type = "update_money",
        money = m
    })

end)

RegisterNetEvent("es:removedMoney")
AddEventHandler("es:removedMoney", function(a, b, m)
        SendNUIMessage({
            type = "update_money",
            money = m
        })
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    SendNUIMessage({
        type = "update_job",
        joblabel =job.label,
        grade_label = job.grade_label
    })
end)


RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(data)
    SendNUIMessage({
        type = "update_money",
        money = data.money.cash

    })
    SendNUIMessage({
        type = "update_bank",
        money = data.money.bank
    })

    SendNUIMessage({
        type = "update_job",
        joblabel = data.job.label,
        grade_label = data.job.gradelabel
    })
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == "bank" then
        local money = account.money
        SendNUIMessage({
            type = "update_bank",
            money = money
        })
    end

    if account.name == 'money' then
        local money = account.money
        SendNUIMessage({
            type = "update_money",
            money = money
        })
    end
end)