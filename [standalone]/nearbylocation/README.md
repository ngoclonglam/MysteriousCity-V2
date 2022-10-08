# Standalone script to search a closest location from given ones
- *Author:* [caothienlong](https://github.com/caothienlong)
# Dependencies
[Notification](https://github.com/caothienlong/notification.git)
# How to use
- Define a list of locations that you want to search closet one
- Define a blip options that you want to display on map/mini map (Optional)
- Trigger either event/exported function ShowNearestLocation with given locations and blip options above
# Sample
Below are sample of integrate script with QBCore framework
- ### Add new radial menu in qb-radialmenu
If you are using qb-radialmenu, add code as below in config.lua. (*Note: Below is just a sample I've used for my server*)
```
            {
                id = 'store',
                title = 'Cửa hàng tạp hóa',
                icon = 'store',                                     -- Icon "fas fa-"
                type = 'client',
                label = '24/7 Supermarket',                         -- The label name of blip/location you want to search
                event = 'qb-shops:client:ShowNearestLocation',      -- client event to triggered search closet location
                shouldClose = true,
            }
```