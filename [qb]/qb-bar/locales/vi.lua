local Translations = {
    menu = {
        bar_header  = "Myth Dragon",
        bar_whiskey = "Rượu Whiskey",
        bar_beer = "Bia Myst",
        bar_close = "Đóng Menu"
    },
    food = {
        bar_header = "Myth Dragon",
        bar_chicken = "Gà Quay",
        bar_fruit = "Đĩa Trái Cây",
        bar_slice = "Vi Cá",
        bar_vica = "Súp Vi Cá"
    },
    txt = {
        bar_whiskey = "Rượu nặng khiến bạn say đắm",
        bar_beer = "Bia không nặng nhưng lại say mê",
        bar_chicken = "Gà quay thơm ngon nức mũi",
        bar_fruit = "Đĩa trái cây bốn mùa",
        bar_slice = "Vi cá làm súp",
        bar_vica = "Súp làm từ vi cá thơm bổ béo"
    },
    progress = {
        make_whiskey = "Đang Làm Rượu",
        make_beer = "Đang làm Bia",
        make_food = "Đang làm đồ ăn",
        make_slice = "Đang làm vi cá"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})