-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] = 'Menu Quản Lý - ',
    },
    body = {
        ['manage'] = 'Quản Lý Nhân Viên',
        ['managed'] = 'Kiểm Tra Danh Sách Nhân Viên',
        ['hire'] = 'Tuyển Nhân Viên',
        ['hired'] = 'Thuê Người Gần Đó',
        ['storage'] = 'Truy Cập Kho',
        ['storaged'] = 'Mở Kho',
        ['outfits'] = 'Đồng Phục',
        ['outfitsd'] = 'Xem Danh Sách Đồng Phục',
        ['money'] = 'Quản Lý Tài Sản',
        ['moneyd'] = 'Kiểm Tra Tiền Công Ty',
        ['mempl'] = 'Quản Lý Nhân Viên - ',
        ['mngpl'] = 'Quản Lý ',
        ['grade'] = 'Cấp Độ: ',
        ['fireemp'] = 'Đuổi Nhân Viên',
        ['hireemp'] = 'Tuyển Nhân Viên - ',
        ['cid'] = 'Citizen ID: ',
        ['balance'] = 'Tiền: $',
        ['deposit'] = 'Gửi',
        ['depositd'] = 'Gửi Tiền Vào Công Ty',
        ['withdraw'] = 'Rút',
        ['withdrawd'] = 'Rút Tiền Từ Công Ty',
        ['depositm'] = 'Gửi Tiền <br> Số Dư Có Sẵn: $',
        ['withdrawm'] = 'Rút Tiền <br> Số Dư Có Sẵn: $',
        ['submit'] = 'Chấp Nhận',
        ['amount'] = 'Số lượng',
        ['return'] = 'Quay Về',
        ['exit'] = 'Quay Về',
    },
    drawtext = {
        ['label'] = '[E] Mở Quản Lý Công Việc',
    },
    target = {
        ['label'] = 'Menu Quản Lý',
    },
    headersgang = {
        ['bsm'] = 'Menu Quản Lý Gang  - ',
    },
    bodygang = {
        ['manage'] = 'Manage Gang Members',
        ['managed'] = 'Recruit or Fire Gang Members',
        ['hire'] = 'Recruit Members',
        ['hired'] = 'Hire Gang Members',
        ['storage'] = 'Storage Access',
        ['storaged'] = 'Open Gang Stash',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Change Clothes',
        ['money'] = 'Money Management',
        ['moneyd'] = 'Check your Gang Balance',
        ['mempl'] = 'Manage Gang Members - ',
        ['mngpl'] = 'Manage ',
        ['grade'] = 'Grade: ',
        ['fireemp'] = 'Fire',
        ['hireemp'] = 'Hire Gang Members - ',
        ['cid'] = 'Citizen ID: ',
        ['balance'] = 'Balance: $',
        ['deposit'] = 'Deposit',
        ['depositd'] = 'Deposit Money into account',
        ['withdraw'] = 'Withdraw',
        ['withdrawd'] = 'Withdraw Money from account',
        ['depositm'] = 'Deposit Money <br> Available Balance: $',
        ['withdrawm'] = 'Withdraw Money <br> Available Balance: $',
        ['submit'] = 'Confirm',
        ['amount'] = 'Amount',
        ['return'] = 'Return',
        ['exit'] = 'Exit',
    },
    drawtextgang = {
        ['label'] = '[E] Open Gang Management',
    },
    targetgang = {
        ['label'] = 'Menu Gang',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
