local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-zombie:server:takePumpkin', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local lucky = math.random(1, 100)
    local randomItem = Config.ItemDrop[math.random(1, #Config.ItemDrop)]

    if not xPlayer then return end

    if lucky >= 50 then
        if xPlayer.Functions.AddItem(randomItem, 1) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], "add", 1)
            QBCore.Functions.Notify(source, 'Bạn thật may mắn đã tìm thêm được một vật phẩm trong bí ngô', 'success')
        else
            QBCore.Functions.Notify(source, 'Bạn không thể chứa thêm được vật phẩm trong người', 'error')
        end
    end

    if xPlayer.Functions.AddItem('pumpkin', 1) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], "add", 1)
    else
        QBCore.Functions.Notify(source, 'Bạn không thể chứa thêm được vật phẩm trong người', 'error')
    end
end)

RegisterNetEvent('qb-zombie:server:startWeather', function()
    exports['qb-weathersync']:setWeather(Config.Weather)
end)