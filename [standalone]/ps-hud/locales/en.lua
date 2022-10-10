local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Cài đặt HUD được tải!",
        ["hud_restart"] = "HUD đang khởi động lại!",
        ["hud_start"] = "HUD bây giờ đã bắt đầu!",
        ["hud_command_info"] = "Lệnh này đặt lại cài đặt HUD hiện tại của bạn!",
        ["load_square_map"] = "Tải bản đồ vuông ...",
        ["loaded_square_map"] = "Bản đồ vuông đã tải!",
        ["load_circle_map"] = "Tải bản đồ vòng tròn ...",
        ["loaded_circle_map"] = "Bản đồ vòng tròn đã tải!",
        ["cinematic_on"] = "Chế độ điện ảnh bật!",
        ["cinematic_off"] = "Chế độ điện ảnh tắt!",
        ["engine_on"] = "Động cơ bắt đầu!",
        ["engine_off"] = "Động cơ tắt!",
        ["low_fuel"] = "Mức nhiên liệu thấp!",
        ["access_denied"] = "Bạn không được ủy quyền!",
        ["stress_gain"] = "Cảm thấy căng thẳng hơn!",
        ["stress_removed"] = "Cảm thấy thư giãn hơn!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
