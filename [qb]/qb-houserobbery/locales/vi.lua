local bossName = "<span style=\"color:red;font-weight:bold;text-decoration:underline\">Hải Khùng</span>"
local newLine = "<br>"

local Translations = {
    error = {
        ["missing_something"] = "Không đủ <span style=\"color:red;font-weight:bold\">ĐỒ NGHỀ</span> cũng lau nhà nữa MÁ...<br><span style=\"color:red;font-weight:bold\">Chim Cút</span> ngay!",
        ["not_enough_police"] = "Cảnh sát vẫn còn đang <span style=\"color:blue;font-weight:bold\">Cà Phê</span>",
        ["door_open"] = "Cửa đã bị cậy",
        ["process_cancelled"] = "Lương tâm dằn xé. Dừng lại thôi!",
        ["didnt_work"] = "Kỹ năng như BỀU =]]",
        ["emty_box"] = "Đéo có gì...",
        ["cannot_get_job"] = "Trông mày có vẻ mệt, nghỉ ngơi đi!",
        ["assigned_house"] = "<b>Nhà này đã có người nhận</b><br>Sống trên đời không nên cướp mối làm ăn của anh em!<br><br>Hãy tìm gặp đại ca "..bossName.." để biết địa điểm khác",
        ["not_assigned_house"] = "<b>Chủ nhà bên trong</b><br>Muốn làm giàu cũng không nên nóng vội nhoen!<br><br>Hãy tìm gặp đại ca "..bossName.." để biết địa điểm khác",
        ["job_expired"] = "Nhiệm vụ quá hạn",
    },
    success = {
        ["worked"] = "DM Mở được rồi, mừng quá",
        ["job_assigned"] = bossName..newLine.."Không cần vội. Chú em cứ về và chờ tin nhắn của anh từ %{maxTime}:00 tối tới %{minTime}:00 sáng",
    },
    target = {
        ["job_boss"] = "Nói chuyện với Hải Khùng",
    },
    menu = {
        ["boss_header"] = "Đại ca Hải Khùng",
        ["boss_welcome"] = "Giang hồ thường gọi tao là "..bossName.."<br>Chú em có thể giúp anh vài việc lặt vặt?",
        ["getjob_header"] = "Nhận việc",
        ["getjob_txt"] = "Dăm ba cái việc vặt, cứ để em",
        ["level_header"] = "Xem điểm kỹ năng",
        ["level_txt"] = "Trình độ của em đang ở mức nào rồi?",
        ["level_info_header"] = "Cấp độ: <span style=\"color:yellow;font-weight:bold;text-decoration:underline\"> %{value}</span>",
        ["level_info_txt"] = "Điểm kỹ năng: <span style=\"color:green;font-weight:bold\"> %{value}</span>/ %{value2}",
        ["goback"] = "Đã rõ",
        ["exit"] = "Gặp đại ca sau"
    },
    email = {
        ["sender"] = "Đại ca Hải Khùng",
        ["subject"] = "Vị trí lau nhà",
        ["message"] = "Từ %{maxTime}:00 tối tới %{minTime}:00 sáng. Tới căn hộ để lấy cho anh <b>%{item}</b>.<br>Anh sẽ không quên công chú đâu!<br><br><br>Nhấn nút bên dưới để hiện vị trí"
    },
    phone = {
        ["title"] = "<b>Nhiệm vụ mới</b>",
        ["text"] = "Nhiệm vụ lau nhà",
    },
}
Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})