local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('tc-pmeter-payout', function()
    if Config.Cash then
        local amount = math.random(Config.MinCash,Config.MaxCash)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got $ '..amount..'!', 'success') 
    end
  
    if Config.BlackMoney then
        local amount = math.random(Config.MinMarkedBills,Config.MaxMarkedBills)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local info = {
            worth = 500
        }
        Player.Functions.AddItem('markedbills', amount, false, info)
        TriggerClientEvent('QBCore:Notify', src, 'Bạn đã lấy được '..amount..' cọc tiền bẩn!', 'success')
    end
end)
