QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Dân Thường',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Thất Nghiệp',
                payment = 10
            },
        },
	},
	['police'] = {
		label = 'Cảnh Sát',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['1'] = {
                name = 'Tập Sự',
                payment = 50
            },
			['2'] = {
                name = 'Hạ Sĩ',
                payment = 75
            },
			['3'] = {
                name = 'Sĩ Quan',
                payment = 100
            },
			['4'] = {
                name = 'Đội Trưởng',
                payment = 125
            },
			['5'] = {
                name = 'Phó Giám Đốc',
                isboss = true,
                payment = 150
            },
            ['6'] = {
                name = 'Giám Đốc',
				isboss = true,
                payment = 200
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Học Viên',
                payment = 50
            },
			['1'] = {
                name = 'Thực Tập',
                payment = 75
            },
			['2'] = {
                name = 'Bác Sĩ',
                payment = 100
            },
			['3'] = {
                name = 'Quản Lý',
                payment = 125
            },
			['4'] = {
                name = 'Viện Phó',
                isboss = true,
                payment = 150
            },
            ['5'] = {
                name = 'Viện Trưởng',
				isboss = true,
                payment = 150
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Thực tập',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Quản lý',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Thực tập',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Quản lý',
				isboss = true,
                payment = 150
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Thực tập',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Quản lý',
				isboss = true,
                payment = 150
            },
        },
	},
    ['tunner'] = {
		label = 'Tunner',
		defaultDuty = true,
		grades = {
			['1'] = {
                name = 'Nhân Viên',
                payment = 75
            },
			['2'] = {
                name = 'Giám Đốc',
                payment = 100,
                isboss = true
            },
			
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = 'mechanic',
		defaultDuty = true,
		grades = {
			['1'] = {
                name = 'Thực Tập',
                payment = 5
            },
			['2'] = {
                name = 'Nhân Viên',
                payment = 10
            },
			['3'] = {
                name = 'Quản Lý',
                payment = 15
            },
			['4'] = {
                name = 'Giám Đốc',
				isboss = true,
                payment = 20
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
	['electrical'] = {
		label = 'Thợ Điện',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
                name = 'Chuyên Gia',
                payment = 50
            },
		},
	},
	['prison'] = {
		label = 'Quản Giáo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['1'] = {
                name = 'Quản Ngục',
                payment = 50
            },
			['2'] = {
                name = 'Quản Tù',
                payment = 100
            },
			['3'] = {
                name = 'Quản Lí',
                payment = 150,
				isboss = true
            },
		},
	},
    ['fire'] = {
		label = 'Cứu Hỏa',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['1'] = {
                name = 'Thực tập',
                payment = 50
            },
			['2'] = {
                name = 'Nhân viên',
                payment = 100
            },
			['3'] = {
                name = 'Quản lý',
                payment = 150,
				isboss = true
            },
		},
	},
    ["burgershot"] = {
		label = "Burgershot Employee",
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 100
            },
			['3'] = {
                name = "Quản lý",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
	},
    ['vu'] = {
        label = 'Mystery Bar',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['1'] = {
                name = 'Phục Vụ',
                payment = 0
            },
            ['2'] = {
                name = 'Giám Đốc',
                payment = 0,
                isboss = true
            }
        }
    },
}
