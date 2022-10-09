local Translations = {
    gps = {
        gps_set = "Đã thiết lập GPS",
        vehicle_marked = "Xe của bạn đã được đánh dấu trên GPS",
        vehicle_cannot_located = "Xe của bạn đang trong Garage hoặc tạm giữ",
        gps_set_with_title = "Đã thiết lập GPS %{value}",
        gps_set_to = "Đã thiết lập GPS tới địa chỉ %{value} !",
        location_blip_set = "Vị trí của họ đã được đánh dấu trên bản đồ !",
    },
    contact = {
        new_suggested = "Bạn nhận được chia sẻ liên hệ!",
    },
    error = {
        not_have_phone = "Bạn không có điện thoại :(",
        action_not_available = "Hành động chưa được hỗ trợ :(",
        no_one_nearby = "Không tìm thấy ai xung quanh :(",
    },
    success = {
        vehicle_parked = "Phương tiện được lưu trữ",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})