Config = {}

Config.ShopLocation = {
    [1] = {
            coords = vector4(390.19, -356.13, 48.03, 269.9),
            length = 1.5, -- Use for box zone config
            width = 1.8, -- Use for box zone config
            heading = 72.99,
            debugPoly = false,
            distance = 3.0,
            showBlip = true,
            ped = {
                model = `a_m_m_hasjew_01`, -- Model name as a hash.
                coords = vector4(390.19, -356.13, 48.03, 269.9), -- Hawick Ave (X, Y, Z, Heading)
                gender = 'male', -- The gender of the ped, used for the CreatePed native.
                animDict = "anim@amb@nightclub@peds@",
                animName = "rcmme_amanda1_stand_loop_cop",
            }
        },
    }

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time

-- Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.UseTarget = true
Config.UsePed = true -- Set to true if you want to use ped for target

CreateThread(function ()
    -- Update price every 1 hour
    while true do
        Config.Shops = {
            scrap = {
                name = "scrap",
                label = "Phế Liệu",
                icon = "fa-solid fa-recycle",
                items = {
                    ["metalscrap"] = {
                        name = 'metalscrap',
                        price = math.random(25, 30),
                    },
                    ["plastic"] = {
                        name = 'plastic',
                        price = math.random(25, 30)
                    },
                    ["glass"] = {
                        name = 'glass',
                        price = math.random(25, 30)
                    },
                    ["rubber"] = {
                        name = 'rubber',
                        price = math.random(25, 30)
                    },
                    ["iron"] = {
                        name = 'iron',
                        price = math.random(25, 30)
                    },
                    ["copper"] = {
                        name = 'copper',
                        price = math.random(25, 30)
                    },
                    ["steel"] = {
                        name = 'steel',
                        price = math.random(25, 30)
                    },
                    ["aluminum"] = {
                        name = 'aluminum',
                        price = math.random(25, 30)
                    },
                }
            }
        }
        Wait(1 * 60 * 60 * 1000)
    end
end)
