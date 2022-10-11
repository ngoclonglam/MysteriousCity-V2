nitro = {}

if Config.EnableNitro then

    Citizen.CreateThread(function()
        while frameworkObject == nil do
            Citizen.Wait(0)
        end
    
        if Config.Framework == "esx" then
            frameworkObject.RegisterUsableItem(Config.NitroItem, function(source)
                TriggerClientEvent('codem-venicehud:SetupNitro', source)
            end)
        else
            frameworkObject.Functions.CreateUseableItem(Config.NitroItem, function(source)
                TriggerClientEvent('codem-venicehud:SetupNitro', source)
            end)
        end
    end)
    
    RegisterServerEvent('codem-venicehud:InstallNitro')
    AddEventHandler('codem-venicehud:InstallNitro', function(plate)
        local src = source
        if plate then
            nitro[plate] = 100
            TriggerClientEvent('codem-venicehud:UpdateNitroData', -1, nitro)
        end
    end)
    
    RegisterServerEvent('codem-venicehud:UpdateNitro')
    AddEventHandler('codem-venicehud:UpdateNitro', function(plate, val)
        local src = source
        if plate then
            if nitro[plate] then
                nitro[plate] = val
                TriggerClientEvent('codem-venicehud:UpdateNitroData', -1, nitro)
            end
        end
    end)
end
