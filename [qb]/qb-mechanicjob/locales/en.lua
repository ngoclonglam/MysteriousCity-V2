local Translations = {
    labels = {
        engine = 'Động Cơ',
        bodsy = 'Thân Xe',
        radiator = 'Bộ Tản Nhiệt',
        axle = 'Trục Xe',
        brakes = 'Phanh Xe',
        clutch = 'Ly Hợp',
        fuel = 'Bình Xăng',
        sign_in = 'Vào Ca',
        sign_off = 'Tan Ca',
        o_stash = 'Mở Kho Đồ',
        h_vehicle = '[E] Cất Xe',
        g_vehicle = '[E] Lấy Xe',
        o_menu = '[E] Mở Bảng Sửa Xe',
        work_v = '[E] Đưa Xe Lên Cáng',
        progress_bar = 'Đang Sửa Xe...',
        veh_status = 'Tình Trạng Xe:',
        job_blip = 'Công Ty Mechanic',
    },

    lift_menu = {
        header_menu = 'Tùy Chọn Sửa Xe',
        header_vehdc = 'Lấy xe ra',
        desc_vehdc = 'Bỏ kết nối xe với cáng',
        header_stats = 'Kiểm tra tình trạng xe',
        desc_stats = 'Coi tình trạng xe như nào',
        header_parts = 'Bộ phận xe',
        desc_parts = 'Các bộ phận cần để sửa xe',
        c_menu = '⬅ Đóng Menu'
    },

    parts_menu = {
        status = 'Tình Trạng: ',
        menu_header = 'Bộ Phận Xe',
        repair_op = 'Sửa Xe:',
        b_menu = '⬅ Trở Lại Menu',
        d_menu = 'Trở lại Menu trước',
        c_menu = '⬅ Đóng Menu'
    },

    nodamage_menu = {
        header = 'Không Có Thiệt Hại',
        bh_menu = 'Trở Lại',
        bd_menu = 'Không có thiệt hại cho bộ phần này!',
        c_menu = '⬅ Đóng Menu'
    },

    notifications = {
        not_enough = 'Bạn không có đủ vật liệt',
        not_have = 'Bạn không có vật liệu',
        not_materials = 'Không có đủ vật liệu trong kho',
        rep_canceled = 'Hủy bỏ sửa xe',
        repaired = 'đã được sửa chữa!',
        uknown = 'Tình trạng không biết',
        not_valid = 'Không phải xe hợp lệ',
        not_close = 'Bạn không đủ gần với chiếc xe',
        veh_first = 'Bạn phải ở trong xe trước tiên',
        outside = 'Bạn phải ở ngoài xe',
        wrong_seat = 'Bạn không phải là người lái xe hoặc đang ở trên một chiếc xe đạp',
        not_vehicle = 'Bạn không ở trong một chiếc xe',
        progress_bar = 'Sửa chữa xe..',
        process_canceled = 'Quá trình hủy bỏ',
        not_part = 'Không phải là một bộ phận hợp lệ',
        partrep ='Bộ phận %{value} đã được sửa!',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})