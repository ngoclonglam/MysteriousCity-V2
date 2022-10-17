local Translations = {
    notifications = {
        ["char_deleted"] = "Nhân vật đã được xóa!",
        ["deleted_other_char"] = "Bạn đã xóa thành công nhân vật Citizen ID :%{citizenid}.",
        ["forgot_citizenid"] = "Bạn quên nhập Citizen ID!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Xóa nhân vật người chơi khác",
        ["citizenid"] = "Citizen ID",
        ["citizenid_help"] = "Citizen ID của nhân vật bạn muốn xóa",

        -- /logout
        ["logout_description"] = "Thoát ra màn hình chọn nhân vật (Admin)",

        -- /closeNUI
        ["closeNUI_description"] = "Đóng màn hình chọn nhân vật"
    },

    misc = {
        ["droppedplayer"] = "Bạn đã đi khỏi thành phố Mysterious"
    },

    ui = {
        -- Main
        characters_header = "Nhân Vật Của Tôi",
        emptyslot = "Chỗ Trống",
        play_button = "Chơi",
        create_button = "Tạo Nhân Vật",
        delete_button = "Xóa Nhân Vật",

        -- Character Information
        charinfo_header = "Thông Tin Nhân Vật",
        charinfo_description = "Chọn nhân vật bạn muốn để coi thông tin của nó",
        name = "Tên",
        male = "Nam",
        female = "Nữ",
        firstname = "Tên",
        lastname = "Họ",
        nationality = "Quốc Tịch",
        gender = "Giới Tính",
        birthdate = "Ngày Sinh",
        job = "Nghề",
        jobgrade = "Cấp Độ",
        cash = "Tiền Mặt",
        bank = "Ngân Hàng",
        phonenumber = "SĐT",
        accountnumber = "STK",

        chardel_header = "Tạo Nhân Vật",

        -- Delete character
        deletechar_header = "Xóa Nhân Vật",
        deletechar_description = "Bạn Có Chắc Muốn Xóa Nhân Vật?",

        -- Buttons
        cancel = "Hủy",
        confirm = "Đồng Ý",

        -- Loading Text
        retrieving_playerdata = "Lấy dữ liệu người chơi",
        validating_playerdata = "Xác thực dữ liệu người chơi",
        retrieving_characters = "Lấy các ký tự",
        validating_characters = "Xác thực ký tự",

        -- Notifications
        ran_into_issue = "Chúng tôi gặp phải một vấn đề",
        profanity = "Có vẻ như bạn đang cố gắng sử dụng một số từ thô tục hoặc những từ xấu trong tên hoặc quốc tịch của bạn!",
        forgotten_field = "Có vẻ như bạn đã quên nhập một hoặc nhiều trường trong danh sách!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
