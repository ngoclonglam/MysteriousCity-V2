
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
        {itemname = 'bluegill',              xp = 5, name = 'Cá Mang Xanh',              sell = true, category = 'common',   price = 95},
        {itemname = 'goldentrout',           xp = 5, name = 'Cá Hồi Vàng',               sell = true, category = 'common',   price = 95},
        {itemname = 'silverymonnow',         xp = 5, name = 'Cá Chim Khoang',            sell = true, category = 'common',   price = 60},
        {itemname = 'strippedbass',          xp = 5, name = 'Cá Vược',                   sell = true, category = 'common',   price = 120},
        {itemname = 'tench',                 xp = 5, name = 'Cá Chép Nhớt',              sell = true, category = 'common',   price = 95},
        {itemname = 'whitefish',             xp = 5, name = 'Cá Trắng',                  sell = true, category = 'common',   price = 185},
        {itemname = 'crappie',               xp = 5, name = 'Cá Crappie',                sell = true, category = 'common',   price = 95},
        {itemname = 'cruciancarp',           xp = 5, name = 'Cá Chép Diếc',              sell = true, category = 'common',   price = 60},
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
    ["textmarket"] = '[E] Để bán cá',
}

Config.FishingRestaurant = {
    ["name"] = "Bán Cá",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3,
        ["size"] = 0.8,
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
        location = "Thái Bình Dương",
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

        location = "Biển Chumash",
        statement = "Cầu tàu gia đình lịch sử Chumash nằm ở trung tâm của Chumash, có thể truy cập từ đường Barbareno. Một biểu tượng chủ yếu của khu vực, Boardwalk được lót bằng hàng rào trắng.",
        spotQuality = "Phổ Biến",
        afkCatchInMinute = 1,
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

        location = "Biển Procopio",
        statement = "Biển Procopio là một bãi biển ở Grand Theft Auto V và Grand Theft Auto Online, nằm ở phía bắc Hạt Blaine, phía đông của Vịnh Paleto. Nó nằm ngoài đường cao tốc đại dương và nằm ở phía đông của Promenade Procopio.",
        spotQuality = "Tốt",
        afkCatchInMinute = 1,
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

        location = "Biển Alamo",
        statement = "Một nhóm các doanh nghiệp nằm ở một bến tàu trên bờ phía bắc của Alamo-Sea ở rìa phía tây của khu định cư của Galilee, bao gồm Boatshop và một nghề đánh bắt cá/nghề cá thương mại liên quan.",
        spotQuality = "Rất Tốt",
        afkCatchInMinute = 1,
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

        location = "Biển Alamo",
        statement = "Biển Alamo là vùng nước lớn nhất nằm trên lục địa San Andreas.Nó được nuôi dưỡng bởi dòng chảy nông nghiệp từ những quả nho gần đó và cống vào Thái Bình Dương qua Cassidy Creek và sông Zancudo ..",
        spotQuality = "Huyền thoại",
        afkCatchInMinute = 1,
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

        location = "Sông Zancudo",
        statement = "Trung tâm nằm trên Tongva Drive ở Thung lũng Tongva, Hạt Los Santos ngay bên cạnh một con suối cuối cùng ăn vào sông Zancudo.",
        spotQuality = "Sử thi",
        afkCatchInMinute = 1,
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
    -- ["FISHING"] = 'G',
    ["LOCATION"] = 'Địa Điểm',
    ["SPOTQUALITY"] = 'Chất Lượng',
    ["AFKCATCHMIN"] = 'AFK trong',
    ["AFKCATCHMINUTE"] = 'Phút',
    ["FISHQUALITYSCALE"] = 'Chất Lượng Cá',
    ["ENABLEAFKMODE"] = 'Bật Chế Độ AFK',
    ["CATCHFISH"] = 'CÂU CÁ',
    ["LOWLEVEL"] = 'Level Thấp',
    ["AFKCATCHMIN1MIN"] = 'AFK',
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
