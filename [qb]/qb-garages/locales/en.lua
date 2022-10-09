local Translations = {
    error = {
        no_vehicles = "Không có phương tiện ở vị trí này",
        not_impound = "Xe của bạn không ở trong bãi giam",
        not_owned = "Không thể cất được xe này",
        not_correct_type = "Bạn không thể cất loại phương tiện này tại nơi này",
        not_enough = "Không có đủ tiền",
        no_garage = "Không",
        vehicle_occupied = "You can't store this vehicle as it is not empty",
    },
    success = {
        vehicle_parked = "Bạn đã đậu xe",
    },
    menu = {
        header = {
            house_car = "Garage Nhà %{value}",
            public_car = "Garage Công Cộng %{value}",
            public_sea = "Public Boathouse %{value}",
            public_air = "Public Hangar %{value}",
            job_car = "Job Garage %{value}",
            job_sea = "Job Boathouse %{value}",
            job_air = "Job Hangar %{value}",
            gang_car = "Gang Garage %{value}",
            gang_sea = "Gang Boathouse %{value}",
            gang_air = "Gang Hangar %{value}",
            depot_car = "Bãi Giam %{value}",
            depot_sea = "Bãi Giam %{value}",
            depot_air = "Bãi Giam %{value}",
            vehicles = "Xe có sẵn",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Rời Garage",
            sea = "⬅ Rời Boathouse",
            air = "⬅ Rời Hangar",
        },
        text = {
            vehicles = "Xem xe đã được đậu",
            depot = "Biển Số: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
            garage = "Trạng Thái: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
        }
    },
    status = {
        out = "Ở Ngoài",
        garaged = "Trong Garage",
        impound = "Giam Bởi Cảnh Sát",
    },
    info = {
        car_e = "E - Garage",
        sea_e = "E - Boathouse",
        air_e = "E - Hangar",
        park_e = "E - Đậu Xe",
        house_garage = "House garage",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
