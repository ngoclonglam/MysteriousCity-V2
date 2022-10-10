local Translations = {
    error = {
        not_online = 'Người chơi không trực tuyến',
        wrong_format = 'Định dạng không chính xác',
        missing_args = 'chưa nhập đủ các số (x, y, z)',
        missing_args2 = 'Tất cả các đối số phải được điền vào!',
        no_access = 'Không có quyền sử dụng lệnh này',
        company_too_poor = 'Công ty của bạn đã phá sản',
        item_not_exist = 'Vật phẩm không tồn tại',
        too_heavy = 'Kho đồ đã đầy',
        duplicate_license = 'Rockstar License đang được sử dụng (hãy thử lại)',
        no_valid_license  = 'Rockstar License này không được tìm thấy',
        not_whitelisted = 'Server đang bảo trì hoặc bạn không có quyền vào Server',
        server_already_open = 'Server đang mở',
        server_already_closed = 'Server đã đóng'
    },
    success = {
         server_opened = 'Server đã được mở lại',
        server_closed = 'Server đã được đóng'
    },
    info = {
        received_paycheck = 'bạn nhận được sốt tiền thanh toán là $%{value}',
        job_info = 'Công việc: %{value} | Cấp độ: %{value2} | Làm việc: %{value3}',
        gang_info = 'Băng đảng: %{value} | Cấp độ: %{value2}',
        on_duty = 'Bạn đã sẵn sàng làm viêc!',
        off_duty = 'Bạn đã dừng làm việc!',
        checking_ban = 'Xin chào %s. Chúng tôi đang kiểm tra tính xác thực của tài khoản.',
        join_server = 'Xin chào %s đã tới {Server Name}.',
        checking_whitelisted = 'Xin chào %s. Chúng tôi đang kiểm tra whitelist'
    }
}

if GetConvar('qb_locale', 'en') == 'vn' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
