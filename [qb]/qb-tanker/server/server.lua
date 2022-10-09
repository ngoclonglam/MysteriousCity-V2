QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('dream-tanker:payout', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = math.random(Config.PayOutMin, Config.PayOutMax)
	xPlayer.Functions.AddMoney('cash', money)
    cb(money)
end)

QBCore.Functions.CreateCallback('dream-tanker:buytruck', function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer.PlayerData.money.cash >= Config.TruckPrice then
        xPlayer.Functions.RemoveMoney('cash', Config.TruckPrice)

            local result = MySQL.Sync.fetchAll('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'tanker',
            })
            if result[1] then
                MySQL.Async.fetchAll('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time'] = 'true',
                    ['@job'] = 'tanker',
                })
            end

		cb(true)
    elseif xPlayer.PlayerData.money.bank >= Config.TruckPrice then
        xPlayer.Functions.RemoveMoney('bank', Config.TruckPrice)

            local result = MySQL.Sync.fetchAll('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'tanker',
            })
            if result[1] then
                MySQL.Async.fetchAll('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time']   = 'true',
                    ['@job'] = 'tanker',
                })
            end

        cb(true)
	else
		cb(false)
	end
end)

QBCore.Functions.CreateCallback('dream-tanker:gettruck', function(source, cb, mode)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if mode == 'gettruck' then
        if xPlayer.PlayerData.money.cash >= Config.TruckOutPrice then
            xPlayer.Functions.RemoveMoney('cash', Config.TruckOutPrice)         
            cb(true)
        elseif xPlayer.PlayerData.money.bank >= Config.TruckOutPrice then
            xPlayer.Functions.RemoveMoney('bank', Config.TruckOutPrice)         
            cb(true)
        else
            cb(false)
        end
    elseif mode == 'backtruck' then
        xPlayer.Functions.AddMoney('cash', Config.TruckOutPrice)
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('dream-tanker:getdatabase', function(source, cb, _)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local result = MySQL.Sync.fetchAll('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
        ['@identifier'] = xPlayer.PlayerData.citizenid,
        ['@job'] = 'tanker',
    })

    if result[1] then
        cb(result[1].first_time)
    else
        MySQL.Async.fetchAll('INSERT INTO dream_jobs (identifier,experience,pickaxe,job,first_time) VALUES (@identifier,@experience,@pickaxe,@job,@first_time)', {
            ['@identifier'] = xPlayer.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@pickaxe'] = 0,
            ['@job'] = 'tanker',
            ['@first_time'] = 'false',
        })
        cb('false') 
    end

end)


