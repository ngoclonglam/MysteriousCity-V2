local Translations = {
    error = {
        not_online = 'Người chơi không trực tuyến',
        wrong_format = 'Định dạng không chính xác.',
        missing_args = 'Không phải mọi đối số đã được nhập (x, y, z)',
        missing_args2 = 'Tất cả các đối số phải được điền!',
        no_access = 'Không có quyền truy cập vào lệnh này',
        company_too_poor = 'Công ty bạn đã phá sản',
        item_not_exist = 'Vật phẩm không tồn tại',
        too_heavy = 'Túi đồ quá đầy',
        location_not_exist = 'Vị trí không tồn tại',
        duplicate_license = 'Rockstar License đang được sử dụng (hãy thử lại)',
        no_valid_license  = 'Rockstar License này không được tìm thấy',
        not_whitelisted = 'Server đang bảo trì hoặc bạn không có quyền vào Server',
        server_already_open = 'Server đang mở',
        server_already_closed = 'Server đã đóng',
        no_permission = 'Bạn không có quyền cho điều này..',
        no_waypoint = 'Không có vị trí chỉ định.',
        tp_error = 'Có lỗi khi dịch chuyển.',
        connecting_database_error = 'Lỗi cơ sở dữ liệu xảy ra trong khi kết nối với máy chủ. (Đã bật SQL chưa?)',
        connecting_database_timeout = 'Kết nối với cơ sở dữ liệu đã hết thời gian. (Đã bật SQL chưa?)',
    },
    success = {
        server_opened = 'Máy chủ đã được mở',
        server_closed = 'Máy chủ đã bị đóng',
        teleported_waypoint = 'Dịch chuyển đến địa điểm chỉ định.',
    },
    info = {
        received_paycheck = 'Bạn đã nhận được tiền trợ cấp là $%{value}',
        job_info = 'Nghề: %{value} | Cấp độ: %{value2} | Duty: %{value3}',
        gang_info = 'Gang: %{value} | Cấp độ: %{value2}',
        on_duty = 'Bạn đang on-duty!',
        off_duty = 'Bạn đang off-duty!',
        checking_ban = 'Xin chào %s. Chúng tôi đang kiểm tra tính xác thực của tài khoản.',
        join_server = 'Xin chào %s đã tới {Server Name}.',
        checking_whitelisted = 'Xin chào %s. Chúng tôi đang kiểm tra whitelist',
        exploit_banned = 'Bạn đã bị cấm vì gian lận, hãy kiểm tra discord chúng tôi để biết thêm thông tin: %{discord}',
        exploit_dropped = 'Bạn đã bị đuổi vì khai thác lỗi hệ thống',
    },
    command = {
        tp = {
            help = 'Dịch chuyển tới người chơi hoặc tọa độ (Admin)',
            params = {
                x = { name = 'id/x', help = 'ID người chơi hoặc tọa độ X'},
                y = { name = 'y', help = 'Tọa độ Y'},
                z = { name = 'z', help = 'Tọa độ Z'},
            },
        },
        tpm = { help = 'Dịch chuyển tới địa điểm chỉ định (Admin)' },
        togglepvp = { help = 'Bật chế độ PVP (Admin)' },
        addpermission = {
            help = 'Đưa quyền người chơi (God)',
            params = {
                id = { name = 'id', help = 'ID người chơi' },
                permission = { name = 'permission', help = 'Cấp độ quyền hạn' },
            },
        },
        removepermission = {
            help = 'Remove Player Permissions (God)',
            params = {
                id = { name = 'id', help = 'ID người chơi' },
                permission = { name = 'permission', help = 'Cấp độ quyền hạn' },
            },
        },
        openserver = { help = 'Mở máy chủ cho mọi người (Admin)' },
        closeserver = {
            help = 'Đóng máy chủ cho những người không có quyền (Admin)',
            params = {
                reason = { name = 'reason', help = 'Lý do đóng cửa (tùy chọn)' },
            },
        },
        car = {
            help = 'Lấy xe (Admin)',
            params = {
                model = { name = 'model', help = 'Tên model xe' },
            },
        },
        dv = { help = 'Xóa xe (Admin)' },
        givemoney = {
            help = 'Đưa tiền người chơi (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                moneytype = { name = 'moneytype', help = 'Loại tiền (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Số tiền' },
            },
        },
        setmoney = {
            help = 'Đưa tiền người chơi về con số nhất định (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                moneytype = { name = 'moneytype', help = 'Loại tiền (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Số tiền' },
            },
        },
        job = { help = 'Kiểm tra nghề của mình' },
        setjob = {
            help = 'Chỉnh nghề của bản thân hoặc người chơi khác (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                job = { name = 'job', help = 'Nghề' },
                grade = { name = 'grade', help = 'Cấp Độ' },
            },
        },
        gang = { help = 'Check Your Gang' },
        setgang = {
            help = 'Set A Players Gang (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                gang = { name = 'gang', help = 'Gang name' },
                grade = { name = 'grade', help = 'Gang grade' },
            },
        },
        ooc = { help = 'OOC Chat Message' },
        me = {
            help = 'Thể hiện suy nghĩ của mình',
            params = {
                message = { name = 'message', help = 'Nội dung' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
