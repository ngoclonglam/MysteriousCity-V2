local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1028278776532054086/wGAkT6nytUjSPEyaKi-edla7y0WwReENzVDiizWBLt1KSqWJ5VsbnPP5BAqfKKUl4L3Q',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1028278924901359646/6M_dI6Gdb5772m_zkIvhnhvYAFlw3E72_vOb2WkatZ4bfYc8UPdf0GjstmnFXvmJOkfd',
    ['robbing'] = '',
    ['cuffing'] = '',
    ['drop'] = '',
    ['trunk'] = '',
    ['stash'] = '',
    ['glovebox'] = '',
    ['banking'] = '',
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = '',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = '',
    ['joinleave'] = 'https://discord.com/api/webhooks/1028278830558875678/PzKf-Ne5uuKzmpMI5Q31kuUhsqD1Hz4fF0OKo74B2E_D_fBKdJ05h4yEHKCc1d1pR036',
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = 'https://discord.com/api/webhooks/1028279775502024744/ayBxNf_BVa6nEC30gIVt8K8ggMjPmazAu9O-89Lg-7xnTvqsLJZd3Q8_Ak2aAWmNdV0W',
    ['weather'] = '',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
    ['black_money'] = 'https://discord.com/api/webhooks/1028279745101697074/bnvW0mSafPvC8k0YYVirnEb4mYWgdEfmqpzTBeWzVY29pVGlsOlaCSGSgBeSrVMAyAcm',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
