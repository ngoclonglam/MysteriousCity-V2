Config = {}

Config.Gifts = {
    ["gift-newbie"] = { -- Key of row should be matched with item defined in shared/items.lua
        { type = "car", name = "bison", luck = { min = 1, max = 30} },
        { type = "car", name = "bobcatxl", luck = { min = 31, max = 90} },
        { type = "car", name = "burrito3", luck = { min = 91, max = 150} },
        { type = "car", name = "minivan2", luck = { min = 181, max = 200} },
    },
    ["halloween_gift"] = {
        { type = "car", name = "pariah", luck = {min = 1, max = 1} },
        { type = "car", name = "scorcher", luck = {min = 2, max = 5} },
        { type = "item", name = "renamecard", luck = {min = 6, max = 17} },
        { type = "item", name = "phonecard", luck = {min = 17, max = 27} },
        { type = "item", name = "carcard", luck = {min = 28, max = 38} },
        { type = "money", amount = math.random(2000, 6000), luck = {min = 39, max = 200} },
    },
    ["gift-common"] = {
        { type = "money", amount = 100000, luck = { min = 1, max = 100} }, -- luck number, min is 1 and max is 100
    },
    ["gift-rare"] = {
        { type = "money", amount = 300000, luck = { min = 1, max = 100} },
    },
    ["gift-epic"] = {
        { type = "money", amount = 500000, luck = { min = 1, max = 100} },
    },
}

Config.Lang = {
    error = {
        canceled = "Hủy bỏ",
        cannot_receive = "Không thể nhận vật phẩm. Kiểm tra lại túi đồ",
        cannot_open = "Hộp quà móc meo không mở được",
        cannot_register_vehicle = "Bạn không thể lưu trữ chiếc xe này trong nhà để xe của bạn :(",
    },
    process = {
        open_gift = "Đang mở quà",
        register_vehicle = "Đang đăng ký giấy tờ xe",
    },
    success = {
        cash_received = "Bạn vừa nhận tiền mặt từ mở quà là $",
    }
}