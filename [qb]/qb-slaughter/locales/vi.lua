local Translations = {
    target = {
        job_boss = "Nói chuyện với chủ trại gà",
    },
    alert = {
        
    },
    menu = {
        boss_welcome = "Xin chào %{value}!. Bạn cần gì?",
        onduty_lbl = "Nhận việc",
        onduty_txt = "Tôi rất nhanh nhẹn, hãy giao việc <b> bắt gà </b> cho tôi",
        offduty_lbl = "Nghỉ việc",
        offduty_txt = "Bay nhảy mệt đít quá! Chim cút đây!",
        exit = "Tạm biệt"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})