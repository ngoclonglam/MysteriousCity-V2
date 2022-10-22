RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(src)
  
    local identifier = GetIdentifier(src)
    local players = GetPlayers()
    CheckPreferencesExist(identifier)
     if Config.UseStress then


         if stressData[identifier] == nil then
             stressData[identifier] = 0
         end

         TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
     end
     TriggerClientEvent('codem-venicehud:client:UpdateSettings', src,  preferences[identifier])
     TriggerClientEvent('codem-venicehud:SetForceHide', src, false)
     TriggerClientEvent('codem-venicehud:UpdateNitroData', src, nitro)
     TriggerClientEvent('codem-venicehud:Loaded', src)
     TriggerClientEvent('codem-totalplayers',-1,#players)
 
end)


RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
     local src = source
     local identifier = GetIdentifier(src)
     local players = GetPlayers()
     CheckPreferencesExist(identifier)
      if Config.UseStress then
          if stressData[identifier] == nil then
              stressData[identifier] = 0
          end
          TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
      end
      TriggerClientEvent('codem-venicehud:client:UpdateSettings', src,  preferences[identifier])
      TriggerClientEvent('codem-venicehud:SetForceHide', src, false)
      TriggerClientEvent('codem-venicehud:UpdateNitroData', src, nitro)
      TriggerClientEvent('codem-venicehud:Loaded', src)
      TriggerClientEvent('codem-totalplayers',-1,#players)
 

 end)



AddEventHandler('playerDropped', function()
	local players = GetPlayers()
    TriggerClientEvent('codem-totalplayers',-1,#players)
end)





if Config.EnableCashAndBankCommands then
    RegisterCommand(Config.CashCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
            local cashamount = xPlayer.getMoney()
        
            TriggerClientEvent('codem-venicehud:ShowAccounts2', source, 'cash', cashamount)
        else
          
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local cashamount = Player.PlayerData.money.cash
            TriggerClientEvent('codem-venicehud:ShowAccounts2', source, 'cash', cashamount)
        end
    end)
    RegisterCommand(Config.BankCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
           
            local bankamount = xPlayer.getAccount('bank')
            if bankamount then
                TriggerClientEvent('codem-venicehud:ShowAccounts2', source, 'bank', bankamount.money)
            end
        else
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local bankamount = Player.PlayerData.money.bank
            TriggerClientEvent('codem-venicehud:ShowAccounts2', source, 'bank', bankamount)
        end
    end)
end