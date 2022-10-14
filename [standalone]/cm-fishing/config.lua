
Config = {}
Config.Framework = 'newqb' -- esx - oldqb - newqb
Config.Mysql = 'oxmysql' -- mysql-async, ghmattimysql, oxmysql
Config.DefaultImage = 'https://cdn.discordapp.com/attachments/983471660684423240/1018885207358705674/defaultimage.png'




Config.MenuOpenKey = 38  -- [E] Keys Reference : https://docs.fivem.net/docs/game-references/controls/
Config.CancelKey = 120 -- [X] Keys Reference : https://docs.fivem.net/docs/game-references/controls/
Config.UseBotToken = true
Config.BotToken = "OTk5NzIwODQ5OTI4MDkzNzk3.GFSiUx.7qpzx9ZBZRggyMTr3qXKWwFXn4tHCqOwy225JQ"
Config.EnableAFKMode = true

Config.Fish = {
        -- COMMON CATEGORY
        {itemname = 'bluegill',              xp = 5, name = 'Cá Mang Xanh',              sell = true, category = 'common',   price = 120},
        {itemname = 'goldentrout',           xp = 5, name = 'Cá Hồi Vàng',               sell = true, category = 'common',   price = 120},
        {itemname = 'silverymonnow',         xp = 5, name = 'Cá Chim Khoang',            sell = true, category = 'common',   price = 120},
        {itemname = 'strippedbass',          xp = 5, name = 'Cá Vược',                   sell = true, category = 'common',   price = 120},
        {itemname = 'tench',                 xp = 5, name = 'Cá Chép Nhớt',              sell = true, category = 'common',   price = 120},
        {itemname = 'whitefish',             xp = 5, name = 'Cá Trắng',                  sell = true, category = 'common',   price = 120},
        {itemname = 'crappie',               xp = 5, name = 'Cá Crappie',                sell = true, category = 'common',   price = 120},
        {itemname = 'cruciancarp',           xp = 5, name = 'Cá Chép Diếc',              sell = true, category = 'common',   price = 120},
        -- UNCOMMON CATEGORY--------------   ------------------------------        ---------------------
        {itemname = 'bluebackherring',       xp = 10, name = 'Blueback Herring',         sell = true, category = "uncommon", price = 4},
        {itemname = 'bulltrout',             xp = 10, name = 'Bull Trout',               sell = true, category = "uncommon", price = 4},
        {itemname = 'laketrout',             xp = 10, name = 'Lake Trout',               sell = true, category = "uncommon", price = 4},
        {itemname = 'perch',                 xp = 10, name = 'Perch',                    sell = true, category = "uncommon", price = 4},
        {itemname = 'chub',                  xp = 10, name = 'Chub',                     sell = true, category = "uncommon", price = 4},
        {itemname = 'colorodopikeminnow',    xp = 10, name = 'Colorodo Pike Minnow',     sell = true, category = "uncommon", price = 4},
        {itemname = 'drumfish',              xp = 10, name = 'Drum Fish',                sell = true, category = "uncommon", price = 4},
        {itemname = 'wallaye',               xp = 10, name = 'Walleye',                  sell = true, category = "uncommon", price = 4},
        -- RARE CATEGORY------------------   ------------------------------        ----------------------
        {itemname = 'americanshad',          xp = 20, name = 'American Shad',            sell = true, category = "rare",     price = 5},
        {itemname = 'palidsturgeon',         xp = 20, name = 'Palid Sturgeon',           sell = true, category = "rare",     price = 5},
        {itemname = 'pike',                  xp = 20, name = 'Pike',                     sell = true, category = "rare",     price = 5},
        {itemname = 'blackcrappie',          xp = 20, name = 'Black Crappie',            sell = true, category = "rare",     price = 5},
        {itemname = 'bream',                 xp = 20, name = 'Bream',                    sell = true, category = "rare",     price = 5},
        {itemname = 'brooktrout',            xp = 20, name = 'Brook Trout',              sell = true, category = "rare",     price = 5},
        {itemname = 'shortnosesucker',       xp = 20, name = 'Shortnose Sucker',         sell = true, category = "rare",     price = 5},
        {itemname = 'smallmouthbass',        xp = 20, name = 'Smallmouth Bass',          sell = true, category = "rare",     price = 5},
        --LEGENDARY CATEGORY --
        {itemname = 'arowana',               xp = 25, name = 'Arowana',                  sell = true, category = "legendary",price = 6},
        {itemname = 'sweetfish',             xp = 25, name = 'Sweetfish',                sell = true, category = "legendary",price = 6},
        {itemname = 'whitebass',             xp = 25, name = 'White Bass',               sell = true, category = "legendary",price = 6},
        {itemname = 'alabamasturgeon',       xp = 25, name = 'Alabama Sturgeon',         sell = true, category = "legendary",price = 6},
        --EPIC CATEGORY --
        {itemname = 'lakesturgeon',          xp = 35, name = 'Lake Sturgeon',            sell = true, category = "epic",     price = 8},
        {itemname = 'koicarpblack',          xp = 35, name = 'Koi Carp Black',           sell = true, category = "epic",     price = 8},
        {itemname = 'lahontancutthroattrout',xp = 35, name = 'Lahontan Cutthroat Trout', sell = true, category = "epic",     price = 8},


         --------------------------- BAITS ------------------------                       sell = false  -- do not change
         {itemname = 'spoonlurebait',    baitLevel = 1,  fishQualityScale = {'common'},    sell = false, name = 'Mồi thìa lượn',  category = "baits", price = 10, stars = 1, baitsuse = true},
         {itemname = 'threesidedbait',   baitLevel = 2,  fishQualityScale = {'uncommon'},  sell = false, name = 'Mồi ba mặt', category = "baits", price = 10, stars = 2, baitsuse = true},
         {itemname = 'tailfishbait',     baitLevel = 3,  fishQualityScale = {'rare'},      sell = false, name = 'Mồi đuôi cá',   category = "baits", price = 10, stars = 3, baitsuse = true},
         {itemname = 'doublehookbait',   baitLevel = 4,  fishQualityScale = {'legendary'}, sell = false, name = 'Móc móc đôi', category = "baits", price = 10, stars = 4, baitsuse = true},
         {itemname = 'triplehooksbait',  baitLevel = 5,  fishQualityScale = {'epic'},      sell = false, name = 'Mồi ba móc', category = "baits", price = 10, stars = 5, baitsuse = true},
 
 
         --------------------------- RODS ------------------------                          sell = false  -- do not change
         {itemname = 'woodenrod',       minigameDiff = 'veryHard',  name = 'Cần Gỗ Mun',         sell = false, category = "rods", price = 1000,   stars = 1, minlevel = 10, use = true},
         {itemname = 'slimmaterialrod', minigameDiff = 'hard',      name = 'Cần Lông Bạc',       sell = false, category = "rods", price = 5000,   stars = 2, minlevel = 20, use = true},
         {itemname = 'danishrod',       minigameDiff = 'medium',    name = 'Cần Cá Đuối',        sell = false, category = "rods", price = 10000,  stars = 3, minlevel = 30, use = true},
         {itemname = 'koidrod',         minigameDiff = 'easy',      name = 'Cần Thần Koi',       sell = false, category = "rods", price = 50000,  stars = 4, minlevel = 40, use = true},
         {itemname = 'finewood',        minigameDiff = 'veryEasy',  name = 'Cần Phượng Hoàng',   sell = false, category = "rods", price = 100000, stars = 5, minlevel = 50, use = true},
}


Config.RequiredXP = {
    [1] = 1000,
    [2] = 2000,
    [3] = 3000,
    [4] = 4000,
    [5] = 5000,
    [6] = 6500,
    [7] = 8000,
    [8] = 9500,
    [9] = 11000,
    [10] = 13000,
    [11] = 15000,
    [12] = 17000,
    [13] = 19000,
    [14] = 21000,
    [15] = 23000,
    [16] = 26000,
    [17] = 29900,
    [18] = 32000,
    [19] = 35000,
    [20] = 38000,
    [21] = 42000,
    [22] = 46000,
    [23] = 50000,
    [24] = 54000,
    [25] = 58000,
    [26] = 63000,
    [27] = 68000,
    [28] = 73000,
    [29] = 78000,
    [30] = 83000,
    [31] = 89000,
    [32] = 95000,
    [33] = 110000,
    [34] = 170000,
    [35] = 230000,
    [36] = 300000,
    [37] = 370000,
    [38] = 440000,
    [39] = 510000,
    [40] = 580000,
    [41] = 650000,
    [42] = 720000,
    [43] = 790000,
    [44] = 860000,
    [45] = 930000,
    [46] = 1100000,
    [47] = 1180000,
    [48] = 1260000,
    [49] = 1340000,
    [50] = 1500000,
}

Config.Draw = {
    ["enabled"]  =  true ,
    ["textmarket"] = '[E] Để Bán Cá',
}

Config.FishingRestaurant = {
    ["name"] = "Bán Cá",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3
    },
    ["ped"] = {
        ["model"] = 0xED0CE4C6,
        ["position"] = vector3(2044.9, 3987.35, 32.24),
        ["heading"] = 356.81
    }
}
Config.Spots = {

        {
            id = "del_perro",
            blipName = "Del Perro Pier",
            spotLvlStars = 1,
            bgimage = 'delperro.png',
            requiredLvl = 0,
            coords = vector3(-1847.1, -1250.8, 8.61577),
            location = "Pasific Ocean",
            statement = "Del Perro Pier is, as its name suggests, located in Del Perro, Los Santos. It is mainly accessed through Red Desert Avenue. Del Perro Pier is renowned for its bright, vivid colors that shine at night, giving the surrounding beaches a sort of vibe.",
            spotQuality = "Standart",
            afkCatchInMinute = 1, --min
            fishQualityScale = "Common",
            fishQualityScaleTable = {'common'},

        },

        {
            id = "chumash",
            blipName = "Chumash Family Pier",
            spotLvlStars = 2,
            bgimage = 'chumash.png',
            requiredLvl = 10,
            coords = vector3(-3427.9, 966.576, 8.34668),

            location = "Alamo Sea",
            statement = "The Chumash Historic Family Pier is located in the heart of Chumash, which is accessible from Barbareno Road. A staple icon of the area, the boardwalk is lined with white fencing.",
            spotQuality = "Normal",
            afkCatchInMinute = 3, --min
            fishQualityScale = "Common - Uncommon",
            fishQualityScaleTable = {'common', 'uncommon'},

        },

        {
            id = "procopio",
            blipName = "Procopio Beach Pier",
            spotLvlStars = 3,
            bgimage = 'procopio.png',
            requiredLvl = 20,--min
            coords = vector3(-278.01, 6638.32, 8.61577),

            location = "Alamo Sea",
            statement = "Procopio Beach is a beach in Grand Theft Auto V and Grand Theft Auto Online, located in northern Blaine County, east of Paleto Bay. It is located off the Great Ocean Highway and is located east of the Procopio Promenade.",
            spotQuality = "Good",
            afkCatchInMinute = 4,
            fishQualityScale = "Common - Rare",
            fishQualityScaleTable = {'common', 'rare'},

        },
        {
            id = "millars",
            blipName = "Millars Fishery",
            spotLvlStars = 4,
            bgimage = 'millars.png',
            requiredLvl = 30,
            coords = vector3(-1612.5, 5262.59, 3.97410),

            location = "Alamo Sea",
            statement = "A group of businesses located at a pier on the north shore of the Alamo -Sea at the western edge of the settlement of Galilee, including the boatshop and a related fishing charter/commercial fishery Millars Fishery.",
            spotQuality = "Very Good",
            afkCatchInMinute = 4,--min
            fishQualityScale = "Uncommon - Rare",
            fishQualityScaleTable = {'uncommon', 'rare'},
        },

        {
            id = "califida",
            blipName = "Califida Rd",
            spotLvlStars = 4.5,
            bgimage = 'califida.png',
            requiredLvl = 40,
            coords = vector3(1298.87, 4216.70, 33.9086),

            location = "Alamo Sea",
            statement = "The Alamo Sea is the largest body of water located on the San Andreas mainland. It is fed by agricultural runoff from nearby Grapeseed and drains into the Pacific Ocean via Cassidy Creek and the Zancudo River..",
            spotQuality = "Legendary",
            afkCatchInMinute = 5,--min
            fishQualityScale = "Uncommon - Legendary",
            fishQualityScaleTable = {'common', 'legendary'},

        },
        {
            id = "whitesea",
            blipName = "White Sea Fishing Spot",
            spotLvlStars = 5,
            bgimage = 'whitesea.png',
            requiredLvl = 50,
            coords = vector3(-1518.7, 1509.42, 111.624),

            location = "Zancudo River",
            statement = "The center is located on Tongva Drive in Tongva Valley, Los Santos County right next to a stream which eventually feeds into the Zancudo River.",
            spotQuality = "Epic",
            afkCatchInMinute = 5,--min
            fishQualityScale = "Rare - Epic",
            fishQualityScaleTable = {'rare', 'epic'},
        },


}

Config.Achievenments = {
    {
        Achievenmentlvl = 5,
        Achievenmentsname = "Level 5",
        Achievenmentsimage = "xp",
        Achievenmentmoney = 250,


    },
    {
        Achievenmentlvl = 10,
        Achievenmentsname = "Level 10",
        Achievenmentsimage = "money",
        Achievenmentmoney = 500,


    },
    {
        Achievenmentlvl = 15,
        Achievenmentsname = "Level 15",
        Achievenmentsimage = "xp",
        Achievenmentmoney = 500,



    },
    {
        Achievenmentlvl = 20,
        Achievenmentsname = "Level 20",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },

    {
        Achievenmentlvl = 25,
        Achievenmentsname = "Level 25",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
    {
        Achievenmentlvl = 30,
        Achievenmentsname = "Level 30",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
    {
        Achievenmentlvl = 35,
        Achievenmentsname = "Level 35",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
    {
        Achievenmentlvl = 40,
        Achievenmentsname = "Level 40",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
    {
        Achievenmentlvl = 45,
        Achievenmentsname = "Level 45",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
    {
        Achievenmentlvl = 50,
        Achievenmentsname = "Level 50",
        Achievenmentsimage = "money",
        Achievenmentmoney = 1500,

    },
}



Config.Locale = {
    ["WIKI"] = 'WIKI',
    ["BOARD"] = 'BOARD',
    ["MARKET"] = 'MARKET',
    ["SPOTS"] = 'SPOTS',
    ["FISHIN"] = 'FISHIN',
    ["FISHING"] = 'G',
    ["LOCATION"] = 'Location',
    ["SPOTQUALITY"] = 'Spot Quality',
    ["AFKCATCHMIN"] = 'AFK Catch in',
    ["AFKCATCHMINUTE"] = 'Minute',
    ["FISHQUALITYSCALE"] = 'Fish Quality Scale',
    ["ENABLEAFKMODE"] = 'Enable AFK Mode',
    ["CATCHFISH"] = 'CATCH FISH',
    ["LOWLEVEL"] = 'Low level',
    ["AFKCATCHMIN1MIN"] = 'AFK Catch in 1 min',
    ["ALL"] = 'All',
    ["COMMON"] = 'Common',
    ["UNCOMMON"] = 'Uncommon',
    ["RARE"] = 'Rare',
    ["LEGANDARY"] = 'Legandary',
    ["EPIC"] = 'Epic',
    ["RODS"] = 'Rods',
    ["BAITS"] = 'Baits',

    ["CARD"] = 'Card',
    ["TOTAL"] = 'Total',
    ["PAYVIACASH"] = 'Pay via cash',
    ["PAYVIACARD"] = 'Pay via card',
    ["SELL"] = 'Sell',
    ["BUY"] = 'Buy',

    ["DELETETOCARD"] = 'Delete to Card',
    ["ADDTOCARD"] = 'Add to Card',
    ["BUYSTUFFS"] = 'Buy Stufss',
    ["FROMMARKET"] = 'from marketplace',
    ["SELLYOURSTUFF"] = 'Sell your stuff',
    ["TOMARKETPLACE"] = 'to marketplace',

    ["MARKLOCATION"] = 'Mark Location on map',
    ["CHANGEPROFILE"] = 'Change Profile Photo',
    ["DISCORDPHOTO"] = 'Use Discord Profile Photo',

    ["DELETEPROFILE"] = 'Delete Photo',

    ["ACHIEVEMENTS"] = 'Achievements',
    ["CLAIM"] = 'Claim',
    ["AWARD"] = 'Award Received',
    ["ACHIEVEMENTSLOCKED"] = 'Achievement Locked',

    -- Javascript Notify

    ["ADDBASKET"] = 'Added to cart.',
    ["REMOVEDBASKET"] = 'Removed from cart.',
    ["PURCHASED"] = 'Purchased.',
    ["ENOUGHMONEY"] = 'Not enough money.',
    ["AWARDS"] = 'Award has been received.',
    ["PHOTO"] = 'Photo updated',
}



-- spot blip
function spotBlip()
    for k, v in pairs(Config.Spots) do
        local storeBlip = AddBlipForCoord(v.coords)
        SetBlipSprite(storeBlip, 88)
        SetBlipScale(storeBlip, 0.7)
        SetBlipColour(storeBlip, 3)
        SetBlipAsShortRange(storeBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blipName)
        EndTextCommandSetBlipName(storeBlip)
    end
end



Config.Notification = function(message, type, isServer, src)-- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end

Config.Notifications = { -- Notifications
    ["rodtostart"] = {
        message = 'Use a rod to start fishing',
        type = "success",
    },
    ["usedbait"] = {
        message = 'You used a bait',
        type = "success",
    },
    ["thisspot"] = {
        message = 'You can t use this bait on this spot',
        type = "success",
    },
    ["notwater"] = {
        message = 'You are not near water',
        type = "success",
    },

    ["waitingbait"] = {
        message = 'Waiting to bait the rod...',
        type = "success",
    },
    ["waitinginput"] = {
        message = 'Waiting for input...',
        type = "success",
    },
    ["waitingfish"] = {
        message = 'Waiting for fish...',
        type = "success",
    },
    ["youcaught"] = {
        message = 'You Caught',
        type = "success",
    },
    ["escaped"] = {
        message = 'Fish Escaped',
        type = "success",
    },
    ["fishingrod"] = {
        message = 'No fishing rod.',
        type = "success",
    },
    ["inventory"] = {
        message = 'Inventory is checked.',
        type = "success",
    },
    ["bait"] = {
        message = 'Fish food is gone.',
        type = "success",
    },
    ["checkspot"] = {
        message = 'Checking fishing spot...',
        type = "success",
    },
    ["notonline"] = {
        message = 'Player not online...',
        type = "success",
    },

    ["rods"] = {
        message = 'Has a fishing rod...',
        type = "success",
    },
    ["BAITSOFF"] = {
        message = 'Has a fishing baits.',
        type = "success",
    },




}

function GetIdentifier(source)
    if Config.Framework == "esx" then
        local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))

        if xPlayer then
            return xPlayer.getIdentifier()
        else
            return "0"
        end
    else
        local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.citizenid
        else
            return "0"
        end
    end
end

function GetName(source)
    if Config.Framework == "esx" then
        local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getName()
        else
            return "0"
        end
    else
        local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
        end
    end
end


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 90)
end
