local mBossName = "Bi Bịp Bợm"

local Translations = {
    error = {
        negative = 'Thử bán với số lượng bé hơn zero à?',
    },
    success = {
        sold = 'Bạn vừa bán %{value} x %{value2} được $%{value3}',
        items_received = 'Bạn vừa nhận %{value} x %{value2}',
    },
    info = {
        title = 'Chợ Đầu Mối',
        sell = 'Bán vật phẩm',
        sell_shop = 'Bán %{value}',
        buy = 'Mua vật phẩm',
        buy_shop = "Mua %{value}",
        market_closed = 'Chợ đã đóng cửa. Quay lại từ %{value}:00 AM - %{value2}:00 PM',
        sell_items = 'Chất lượng: %{quality}% | Giá bán: $%{price} ',
        back = '⬅ Quay Lại',
        max = 'Hiện Có %{value}',
        shop = 'Cửa hàng %{value}',
    },
    target = {
        boss = 'Nói chuyện với '..mBossName,
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})