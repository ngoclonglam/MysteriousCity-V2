Config = {}

Config.prop = 'gr_prop_gr_bench_04b'

Config.craftingBenches = {
    {id = "ID1", coords = vector3(2659.99, 3923.66, 42.17), heading = 86.96},
    {id = "ID2", coords = vector3(259.38, -779.89, 30.57), heading = 70.95}
}

Config.fakeBenches = {
    {id = "fakeId1", coords = vector3(123.74, 6635.66, 31.87), heading = 130.69},
    {id = "fakeId2", coords = vector3(308.67, -907.06, 29.29), heading = 263.84},
    {id = "fakeId3", coords = vector3(-174.85, 218.75, 89.9), heading = 357.31},
    {id = "fakeId4", coords = vector3(-22.2, -691.94, 244.25), heading = 203.23},
    {id = "fakeId5", coords = vector3(22.21, 3652.23, 40.03), heading = 97.94},
    {id = "fakeId6", coords = vector3(3290.1, 5196.75, 18.42), heading = 7.86},
}

--[[
Make sure to change the image path to your inventory image file. Default is qb-inventory, you can change it to qb-inventory by doing this example below:
    https://cfx-nui-qb-inventory/html/images/radio.png
]]


-- Recipes that come with every workbench
Config.defaultRecipes = {
    weapon_knife = {
        item = "weapon_knife",
        label = "Dao Thái Lan",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_knife.png",
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "diamond", label = "Kim Cương", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/diamond.png"},
            {item = "emerald", label = "Ngọc Lục Bảo", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/emerald.png"},
            {item = "leather", label = "Da Thuộc", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/leather.png"},
        }
    },
    giaygoiqua = {
        item = "giaygoiqua",
        label = "Giấy Gói Qùa",
        image = "https://cfx-nui-qb-inventory/html/images/giaygoiqua.png",
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Nhựa", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        }
    },
    halloween_gift = {
        item = "halloween_gift",
        label = "Hộp Qùa Halloween",
        image = "https://cfx-nui-qb-inventory/htmk/images/halloween_gift.png",
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "giaygoiqua", label = "Giấy Gói Qùa", amount = 4, image = "https://cfx-nui-qb-inventory/html/images/giaygoiqua.png"},
            {item = "pumpkin", label = "Bí Ngô", amount = 50, image = "https://cfx-nui-qb-inventory/html/images/pumpkin.png"},
        }
    }
}

--Recipes that are unlocked with blueprints
Config.blueprintRecipes = {
    advancedlockpick = {
        item = "advancedlockpick",
        label = "Advanced Lockpick",
        image = "https://cfx-nui-qb-inventory/html/images/advancedlockpick.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "aluminum", label = "Aluminum", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "rubber", label = "Rubber", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
            {item = "plastic", label = "Plastic", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint.png"
    },
}
