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
        server_already_open = 'Máy chủ đã mở',
        server_already_closed = 'Máy chủ đã đóng',
        no_permission = 'Bạn không có quyền cho việc này ..',
        no_waypoint = 'Không có điểm trên Map',
        tp_error = 'Lỗi trong khi dịch chuyển tức thời',
        connecting_database_error = 'Đã xảy ra lỗi cơ sở dữ liệu trong khi kết nối với máy chủ.(Đã bật SQL chưa?)',
        connecting_database_timeout = 'Kết nối với cơ sở dữ liệu đã hết thời gian.(Đã bật SQL chưa?)',
    },
    success = {
        server_opened = 'Server đã được mở lại',
        server_closed = 'Server đã được đóng',
        teleported_waypoint = 'Dịch chuyển đến địa điểm chỉ định',
    },
    info = {
        received_paycheck = 'Bạn nhận được số tiền thanh toán là $%{value}',
        job_info = 'Công việc: %{value} | Cấp độ: %{value2} | Làm việc: %{value3}',
        gang_info = 'Băng đảng: %{value} | Cấp độ: %{value2}',
        on_duty = 'Bạn đã sẵn sàng làm viêc!',
        off_duty = 'Bạn đã dừng làm việc!',
        checking_ban = 'Xin chào %s. Chúng tôi đang kiểm tra tính xác thực của tài khoản.',
        join_server = 'Xin chào %s đã tới {Server Name}.',
        checking_whitelisted = 'Xin chào %s. Chúng tôi đang kiểm tra whitelist',
        exploit_banned = 'Bạn đã bị cấm vì gian lận, kiểm tra Discord để biết thêm thông tin: %{discord}',
        exploit_dropped = 'Bạn đã bị kick vì lạm dụng khai thác',
    },
    command = {
        tp = {
            help = 'TP To Player or Coords (Admin)',
            params = {
                x = { name = 'id/x', help = 'ID người chơi or X position'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'TP To Marker (Admin)' },
        togglepvp = { help = 'Toggle PVP on the server (Admin)' },
        addpermission = {
            help = 'Give Player Permissions (God)',
            params = {
                id = { name = 'id', help = 'ID người chơi' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        removepermission = {
            help = 'Remove Player Permissions (God)',
            params = {
                id = { name = 'id', help = 'ID người chơi' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        openserver = { help = 'Open the server for everyone (Admin)' },
        closeserver = {
            help = 'Close the server for people without permissions (Admin)',
            params = {
                reason = { name = 'reason', help = 'Reason for closing (optional)' },
            },
        },
        car = {
            help = 'Spawn Vehicle (Admin)',
            params = {
                model = { name = 'model', help = 'Model name of the vehicle' },
            },
        },
        dv = { help = 'Delete Vehicle (Admin)' },
        givemoney = {
            help = 'Give A Player Money (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        setmoney = {
            help = 'Set Players Money Amount (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        job = { help = 'Check Your Job' },
        setjob = {
            help = 'Set A Players Job (Admin)',
            params = {
                id = { name = 'id', help = 'ID Người chơi' },
                job = { name = 'job', help = 'Job name' },
                grade = { name = 'grade', help = 'Job grade' },
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
            help = 'Show local message',
            params = {
                message = { name = 'message', help = 'Message to send' }
            },
        },
    },
}

if GetConvar('qb_locale', 'en') == 'vn' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
