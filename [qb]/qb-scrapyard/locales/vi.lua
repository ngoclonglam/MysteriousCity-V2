local mBossName = "<span style=\"color:green;font-weight:bold;text-decoration:underline\">Hải Khùng</span>"
local mBossErr = "<span style=\"color:red;font-weight:bold;text-decoration:underline\">Hải Khùng</span>"
local mNewLine = "<br>"

local Translations = {
    error = {
        smash_own = "Á đìu, xe của mình mà rã chi tak? Lâu lâu óc chó. Haiz.",
        cannot_scrap = "Xe này không nằm trong danh sách được yêu cầu!",
        not_driver = "Phải ngồi ghế tài xế mới rã được",
        demolish_vehicle = "Email đã được gửi rồi, xóa rồi thì ráng chịu!",
        canceled = "Hủy bỏ! Kiếm việc lương thiện thôi",
        email_expired = "Email này đã cũ rồi, xóa đi là vừa",
        limit_reached = mBossErr..mNewLine.."Hôm nay rã nhiêu đủ rồi. Ngày mai rã tiếp !",
        job_inprogress = mBossErr..mNewLine.."Nhiệm vụ vừa giao đã làm xong đâu DM?",
        job_failed = mBossErr..mNewLine.."Phế VLOZ. Có tý việc cũng éo xong. Cút!",
    },
    text = {
        scrapyard = 'Bãi Rã Xe',
        disassemble_vehicle = '~g~E~w~ - Bắt đầu rã xe',
        email_list = "~g~E~w~ - E-mail Danh sách xe cần rã",
        demolish_vehicle = "Đang Rã",
    },
    email = {
        sender = "Phế Liệu Xe Hải Khùng",
		subject = "Mẫu xe yêu cầu",
		message = "Anh có tý việc cần nhờ chú mày. Chú mày có thể giúp anh đến bãi xe được đánh dấu tìm còn xe dưới đây mang đến bãi rã giúp anh được không?<br /><br /><br />Xe yêu cầu: <strong>%{value}</strong><br />",
    },
    alert = {
        ["police_alert"] = "Có người đang rã xe!!"
    },
    target = {
        ["job_boss"] = "Nói chuyện với Hải Khùng",
    },
    menu = {
        ["boss_header"] = "Đại ca Hải Khùng",
        ["boss_welcome"] = "Giang hồ thường gọi tao là "..mBossName.."<br>Chú em có thể giúp anh vài việc lặt vặt?",
        ["getjob_header"] = "Nhận việc",
        ["getjob_txt"] = "Dăm ba cái việc vặt, cứ để em",
        ["level_header"] = "Xem điểm kỹ năng",
        ["level_txt"] = "Trình độ của em đang ở mức nào rồi?",
        ["level_info_header"] = "Cấp độ: <span style=\"color:yellow;font-weight:bold;text-decoration:underline\">%{value}</span>",
        ["level_info_txt"] = "Điểm kỹ năng: <span style=\"color:green;font-weight:bold\">%{value}</span>/%{value2}",
        ["goback"] = "Đã rõ",
        ["exit"] = "Gặp đại ca sau"
    },
    success = {
        ["job_assigned"] = mBossName..mNewLine.."Không cần vội. Chú em cứ về và chờ tin nhắn của anh",
        ["scrap_location"] = mBossName..mNewLine.."Tay nghề khá đấy. Đến vị trí đánh dấu để tiến hành chặt xe",
        ["vehicle_location"] = mBossName..mNewLine.."Chiếc xe đang đỗ ở bãi đậu xe đánh dấu. Đến bẻ khóa trước đã...Cẩn thận!",
        ["job_accomplished"] = mBossName..mNewLine.."Ờ mây zing, gút chóp em! Hãy nhanh chóng rời khỏi đó..",
    },
    phone = {
        ["title"] = "<b>Nhiệm vụ mới</b>",
        ["text"] = "Nhiệm vụ rã xe",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})