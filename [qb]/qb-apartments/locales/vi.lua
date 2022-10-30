local Translations = {
    error = {
        to_far_from_door = 'Bạn ở quá xa chuông cửa',
        nobody_home = 'Không thấy ai trả lời? Ủa có ai ở nhà không tak?',
        nobody_at_door = 'Không có ai trước cửa nhà',
        insufficient_balance =  'Nghèo vãi bều !!! Không đủ tiền mặt/bank...'
    },
    success = {
        receive_apart = 'Bạn vừa nhận được căn hộ',
        changed_apart = 'Bạn đã di dời căn hộ',
        extended_apart = 'Bạn đã gia hạn căn hộ',
    },
    info = {
        at_the_door = 'Có ai đang bấm chuông!',
        open_menu = 'Bấm [<strong>F1</strong>] để tương tác Căn Hộ',
        radial_menu = 'Căn Hộ',
    },
    text = {
        options = '[E] Tùy chọn Căn hộ',
        enter = 'Vào Căn hộ',
        ring_doorbell = 'Bấm chuông',
        logout = 'Đăng xuất Nhân vật',
        change_outfit = 'Đổi quần áo',
        open_stash = 'Mở kho đồ',
        move_here = 'Dời tới đây',
        rent_here = 'Thuê Căn hộ',
        open_door = 'Kiểm tra cửa',
        leave = 'Rời Căn hộ',
        close_menu = '⬅ Đóng Menu',
        back_menu = '⬅ Quay lại',
        tennants = 'Ten Ten',
        extend = 'Gia Hạn Hợp Đồng Thuê',
        rental_price_txt = 'Giá: $%{price}/%{length} Ngày',
        stash_menu = {
            header = 'Nâng Cấp Kho Đồ',
            upgrade_weight = 'Nâng cấp sức chứa',
            upgrade_slots = 'Nâng cấp không gian chứa',
            weight_txt = 'Sức chứa hiện tại: %{value}',
            slots_txt = 'Số ô chứa hiện tại: %{value}',
        },
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
