
Config = {}
Config.Framework = 'newqb' -- esx - oldqb - newqb
Config.Mysql = 'oxmysql' -- mysql-async, ghmattimysql, oxmysql
Config.DefaultImage = 'https://cdn.discordapp.com/attachments/983471660684423240/1018885207358705674/defaultimage.png'
Config.DrawText = '[E] - Start Fish'
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
        {itemname = 'finewood',        minigameDiff = 'veryEasy',  name = 'Cần Phượng Hoàng',    sell = false, category = "rods", price = 100000, stars = 5, minlevel = 50, use = true},
}


Config.RequiredXP = {
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25500,
}


Config.FishingRestaurant = {
    ["name"] = "Bán Cá",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3
    },
    ["ped"] = {
        ["model"] = 0xED0CE4C6,
        ["position"] = vector3(-1038.4545898438, -1397.0551757813, 4.5),
        ["heading"] = 75.0
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
            statement = "Del Perro Pier, như tên gọi của nó, nằm ở Del Perro, Los Santos.Nó chủ yếu được truy cập thông qua Đại lộ Sa mạc Đỏ. Del Perro Pier nổi tiếng với những màu sắc tươi sáng, sống động, tỏa sáng vào ban đêm, mang đến cho các bãi biển xung quanh một sự rung cảm.",
            spotQuality = "Tiêu Chuẩn",
            afkCatchInMinute = 1,
            fishQualityScale = "Phổ thông",
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
            statement = "Cầu tàu gia đình lịch sử Chumash nằm ở trung tâm của Chumash, có thể truy cập từ đường Barbareno. Một biểu tượng chủ yếu của khu vực, Boardwalk được lót bằng hàng rào trắng.",
            spotQuality = "Phổ Biến",
            afkCatchInMinute = 3,
            fishQualityScale = "Phổ thông - không phổ biến",
            fishQualityScaleTable = {'common', 'uncommon'},

        },

        {
            id = "procopio",
            blipName = "Procopio Beach Pier",
            spotLvlStars = 3,
            bgimage = 'procopio.png',
            requiredLvl = 20,
            coords = vector3(-278.00, 6638.32, 8.61577),

            location = "Alamo Sea",
            statement = "Procopio Beach là một bãi biển ở Grand Theft Auto V và Grand Theft Auto Online, nằm ở phía bắc Hạt Blaine, phía đông của Vịnh Paleto. Nó nằm ngoài đường cao tốc đại dương và nằm ở phía đông của Promenade Procopio.",
            spotQuality = "Tốt",
            afkCatchInMinute = 4,
            fishQualityScale = "Phổ thông - Hiếm",
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
            statement = "Một nhóm các doanh nghiệp nằm ở một bến tàu trên bờ phía bắc của Alamo-Sea ở rìa phía tây của khu định cư của Galilee, bao gồm Boatshop và một nghề đánh bắt cá/nghề cá thương mại liên quan.",
            spotQuality = "Rất Tốt",
            afkCatchInMinute = 4,
            fishQualityScale = "Không phổ biến - Quý hiếm",
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
            spotQuality = "Huyền thoại",
            afkCatchInMinute = 5,
            fishQualityScale = "Không phổ biến - Huyền thoại",
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
            spotQuality = "Sử thi",
            afkCatchInMinute = 5,
            fishQualityScale = "Hiếm - Sử thi",
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
    ["WIKI"] = 'TỪ ĐIỂN',
    ["BOARD"] = 'BẢNG',
    ["MARKET"] = 'CHỢ',
    ["SPOTS"] = 'ĐIỂM CÂU',
    ["FISHIN"] = 'CÂU CÁ',
    ["FISHING"] = 'G',
    ["LOCATION"] = 'Địa Điểm',
    ["SPOTQUALITY"] = 'Chất Lượng',
    ["AFKCATCHMIN"] = 'AFK Catch in',
    ["AFKCATCHMINUTE"] = 'Phút',
    ["FISHQUALITYSCALE"] = 'Chất Lượng Cá',
    ["ENABLEAFKMODE"] = 'Bật Chế Độ AFK',
    ["CATCHFISH"] = 'CÂU CÁ',
    ["LOWLEVEL"] = 'Level Thấp',
    ["AFKCATCHMIN1MIN"] = 'AFK Catch in 1 min',
    ["ALL"] = 'TẤT CẢ',
    ["COMMON"] = 'Phổ thông',
    ["UNCOMMON"] = 'Không phổ biến',
    ["RARE"] = 'Quý hiếm',
    ["LEGANDARY"] = 'Huyền thoại',
    ["EPIC"] = 'Sử thi',
    ["RODS"] = 'Cần Câu',
    ["BAITS"] = 'Mồi',

    ["CARD"] = 'Thẻ',
    ["TOTAL"] = 'Tổng cộng',
    ["PAYVIACASH"] = 'Thanh toán tiền mặt',
    ["PAYVIACARD"] = 'Thanh toán qua thẻ',
    ["SELL"] = 'Bán',
    ["BUY"] = 'Mua',

    ["DELETETOCARD"] = 'Xóa giỏ hàng',
    ["ADDTOCARD"] = 'Thâm vào giỏ hàng',
    ["BUYSTUFFS"] = 'Mua Đồ',
    ["FROMMARKET"] = 'Từ Chợ',
    ["SELLYOURSTUFF"] = 'Bán đồ',
    ["TOMARKETPLACE"] = 'Cho Chợ',

    ["MARKLOCATION"] = 'Đánh Dấu',
    ["CHANGEPROFILE"] = 'Đổi Avatar',
    ["DISCORDPHOTO"] = 'Sử Dụng Avatar Discord',

    ["DELETEPROFILE"] = 'Xóa Ảnh',

    ["ACHIEVEMENTS"] = 'Thành Tích',
    ["CLAIM"] = 'Nhận',
    ["AWARD"] = 'Đã Nhận',
    ["ACHIEVEMENTSLOCKED"] = 'THÀNH TÍCH CHƯA MỞ',

    -- Javascript Notify

    ["ADDBASKET"] = 'Thêm vào giỏ',
    ["REMOVEDBASKET"] = 'Bỏ khỏi giỏ',
    ["PURCHASED"] = 'Đã mua',
    ["ENOUGHMONEY"] = 'Không đủ tiền',
    ["AWARDS"] = 'Giải thưởng đã được nhận.',
    ["PHOTO"] = 'Đã cập nhật ảnh',
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
        message = 'Sử dụng cần câu để câu cá',
        type = "success",
    },
    ["usedbait"] = {
        message = 'Hãy sử dụng mồi',
        type = "success",
    },
    ["thisspot"] = {
        message = 'Không thể dùng mồi này ở tại điểm này',
        type = "error",
    },
    ["notwater"] = {
        message = 'Bạn không ở gần mặt nước',
        type = "error",
    },

    ["waitingbait"] = {
        message = 'Đang gắn mồi câu...',
        type = "success",
    },
    ["waitinginput"] = {
        message = 'Đang chờ bấm nút...',
        type = "success",
    },
    ["waitingfish"] = {
        message = 'Đang chờ con cá...',
        type = "success",
    },
    ["youcaught"] = {
        message = 'Bạn đã câu cá thành công',
        type = "success",
    },
    ["escaped"] = {
        message = 'Cá đã chạy mất tiêu',
        type = "error",
    },
    ["fishingrod"] = {
        message = 'Bạn không có cần câu',
        type = "errro",
    },
    ["inventory"] = {
        message = 'Đang kiểm tra túi đồ',
        type = "success",
    },
    ["bait"] = {
        message = 'Đã hết mồi câu',
        type = "success",
    },
    ["checkspot"] = {
        message = 'Kiểm tra điểm câu cá ...',
        type = "success",
    },
    ["notonline"] = {
        message = 'Người chơi không trực tuyến...',
        type = "error",
    },

    ["rods"] = {
        message = 'Có cần câu...',
        type = "success",
    },
    ["BAITSOFF"] = {
        message = 'Có mồi câu cá.',
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
