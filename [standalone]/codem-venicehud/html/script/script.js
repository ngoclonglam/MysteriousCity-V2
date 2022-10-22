var rpm = 0
var generalspeed = 0
var mayhemhudcarhealth
var mayhemhudcarfuel
var vertexhudcarfuel
var vertexhudcarhalth

var malibuhudhealthbar
var malibuhudarmourbar
var malibuhudthirstbar
var malibuhudhungerbar
var malibuhudstaminabar
var malibuhudstressbar
var malibuhudoxybar

var mayhemhudaltdudee
var mayhemhudwind

var perspecthudrpm
var perspecthudcarfuel
var perspecthudcarhealth


var mayhemhudnitro
var perspecthudnitro




var venicehudonwalkstressbar
var venicehudstressbar

const app = new Vue({
    el: "#app",

    data: {
        text1: '',
        text2: '',
        joblabel: '',
        grade_label: '',
        bankMoney: 0,
        cash: 0,
        ammo: 0,
        max_ammo: 0,
        weaponImage: '',
        fuel: 0,
        enableAmmoHud: true,
        enableWatermarkJob: true,
        enableWaterMarkCash: true,
        enableWaterMarkBank: true,
        deneme: true,
        showbankcashborder: true,
        resourceName: 'codem-venicehud',
        styleselectoropen: false,
        speedometerSize: 1.1,
        hudSize: 1.0,
        sealtBeltIsOn: false,
        engineIsOn: false,
        enableWaterMarkId: true,
        cruiseIsOn: false,
        engineHealth: 1000,
        text1Style: {},
        text2Style: {},
        clock: '',
        date: '',
        street: '',
        zone: '',
        heading: '',
        positionsData: {},
        EnableOnlinePlayers: true,
        showgeneralmenu: '',
        UseWaterMarkText: true,
        logoWidth: 0,
        logoHeight: 0,
        WaterMarkLogo: '',
        disableWaterMarkTextAndLogo: false,
        selectselectscreen: 'settingspage',
        currenteditmode: '',
        indicatorDegree: 0,
        displayAmmoHud: false,
        lightsOn: false,
        showOxy: false,
        hudColors: {},
        carhudColors: {},
        secilenhud: '',
        secilencarhud: '',
        playerid: '',
        enableWaterMarkHud: true,
        vehiclerpm: 0,
        vertexhudspeedtext: 0,
        DisplayRealTime: true,
        malibufix: false,
        vehicleclass: 0,
        windspeed: 0,
        language: {},
        pagespeedometer: '',
        gear: 0,
        vehicleisin: false,
        editmode: false,
        helpermode :'',
        editmodemayhem: false,
        editmodevertex: false,
        enablehelper: false,
        hideBoxData: {
            health: 100,
            armor: 100,
            water: 100,
            stress: 100,
            hunger: 100,
            stamina: 100,
            oxy: 100
        },
        hideBoxDataDisplay: {
            health: 100,
            armor: 100,
            water: 100,
            stress: 100,
            hunger: 100,
            stamina: 100,
            oxy: 100
        },
        statusData: {
            health: 0,
            hunger: 0,
            thirst: 0,
            stamina: 0,
            stress: 0,
            armour: 0,
            altitude: 0,
            oxy: 0,
            nitro: 0,
            mic_level: 1,
            talking: false
        },
        helperText: '',
        showmenuData: '',
        enableCinematic: false,
        forceHide: true,
        showhud: false,
        totalply: 0,
        displayOnWalk: false,
        mapustu :true,
        enablehudsettings : '',
        seatbeltnitroengine :''

    },

    methods: {
        changeSeatbelt(val){
            this.seatbeltnitroengine = val
           
        },
        setHudEnableSettings(val){
            this.enablehudsettings = val;
           
        },
        mapUstuSettings(val){
            this.mapustu = val
        },
        SetLanguage(val) {
            this.language = val
        },
        DisplayOnWalk(val) {
            this.displayOnWalk = val
        },
        totalsPlayers(val) {
            this.totalply = val;
        },
        resetHud() {
            $.post(`https://${
                this.resourceName
            }/defaulthuds`, JSON.stringify({}));
        },
        SetForceHide(val) {
            this.forceHide = val

        },
        hideHud() {
            this.showhud = !this.showhud
            $.post(`https://${
                this.resourceName
            }/toggleHud`, JSON.stringify({val: this.showhud}));
        },

        ToggleCinematic() {
            $.post(`https://${
                this.resourceName
            }/toggleCinematic`, JSON.stringify({}), (val) => {
                this.enableCinematic = val
            });
        },
        SetHideData(type, e) {
            let val = e.target.value

            if (val > 0 && val <= 100) {

                $.post(`https://${
                    this.resourceName
                }/hudselected`, JSON.stringify({

                    settingstype: "hideBoxData",
                    val: {
                        ...this.hideBoxData,
                        [type]: val
                    }
                }));
            } else {
                this.hideBoxDataDisplay[type] = 100
            }
        },
        venicehudreset() {

            $.post(`https://${
                this.resourceName
            }/resetVenice`, JSON.stringify({}));
        },
        showsettings(val) {
            if (val == 'phone') {
                this.showmenuData = 'phone'
                this.showgeneralmenu.showphonekey = !this.showgeneralmenu.showphonekey

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showphonekey}));
            } else if (val == 'inventory') {
                this.showmenuData = 'inventory'
                this.showgeneralmenu.showinventorykey = !this.showgeneralmenu.showinventorykey

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showinventorykey}));
            } else if (val == 'menu') {
                this.showmenuData = 'menu'
                this.showgeneralmenu.showmenukey = !this.showgeneralmenu.showmenukey

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showmenukey}));
            } else if (val == 'mic') {
                this.showmenuData = 'mic'
                this.showgeneralmenu.showmickey = !this.showgeneralmenu.showmickey

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showmickey}));
            } else if (val == 'logo') {
                this.showmenuData = 'logo'
                this.showgeneralmenu.showlogo = !this.showgeneralmenu.showlogo

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showlogo}));
            } else if (val == 'id') {
                this.showmenuData = 'id'
                this.showgeneralmenu.showid = !this.showgeneralmenu.showid

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showid}));
            } else if (val == 'online') {
                this.showmenuData = 'online'
                this.showgeneralmenu.showonline = !this.showgeneralmenu.showonline

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showonline}));
            } else if (val == 'money') {
                this.showmenuData = 'money'
                this.showgeneralmenu.showmoney = !this.showgeneralmenu.showmoney

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showmoney}));
            } else if (val == 'job') {
                this.showmenuData = 'job'
                this.showgeneralmenu.showjob = !this.showgeneralmenu.showjob

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showjob}));
            } else if (val == 'ammo') {
                this.showmenuData = 'ammo'
                this.showgeneralmenu.showammo = !this.showgeneralmenu.showammo

                $.post(`https://${
                    this.resourceName
                }/showmenusettings`, JSON.stringify({set: this.showmenuData, val: this.showgeneralmenu.showammo}));
            }
        },
        setHelperText(val) {
            this.helperText = val
        },
        HelperText(val) {
            this.enablehelper = val
        },
        LocationUpdate(zone, street, heading) {
            this.street = street
            this.zone = zone
            this.heading = heading
        },
        SetDisplayRealTime(val) {
            this.DisplayRealTime = val
        },
        SetDate(clock, date) {
            this.clock = clock
            this.date = date

        },
        setVehicleisin(val) {
            this.vehicleisin = val;
        },
        SelectSpeedometer(val) {
            this.secilencarhud = val
            $.post(`https://${
                this.resourceName
            }/currentcarHud`, JSON.stringify({hud: this.secilencarhud}));
        },
        selectpagespeedometer(val) {
            
            this.pagespeedometer = val;
           

            if (val == 'venicehudeditmode') {
                this.secilenhud = 'venicehud'
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
            } else if (val == 'malibuhudeditmode') {
                this.secilenhud = 'malibuhud'
                this.malibufix = true
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
            } else if (val == 'belaireditmode') {
                this.secilenhud = 'belairhud'
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
            } else if (val == 'mayhemhudsettingspage') {
                this.secilencarhud = 'mayhemhud'

                $.post(`https://${this.resourceName}/currentcarHud`, JSON.stringify({hud: this.secilencarhud}));

            } else if (val == 'settingpagevertexhud') {
                this.secilencarhud = 'vertexhud'
                $.post(`https://${
                    this.resourceName
                }/currentcarHud`, JSON.stringify({hud: this.secilencarhud}));
            } else if (val == 'settingspageperspect') {
                this.secilencarhud = 'perspecthud'
                $.post(`https://${
                    this.resourceName
                }/currentcarHud`, JSON.stringify({hud: this.secilencarhud}));
            }

            this.styleselectoropen = false

        },
        setid(val) {
            this.playerid = val
        },
        SetWaterMarkText(text1, text2) {
            this.text1 = text1
            this.text2 = text2

        },
        SetFuel(fuel) {
           
          
            this.fuel = fuel
            if (this.secilencarhud == 'vertexhud') {
                if (this.carhudColors['vertexhud']) {              
                // loadProgress('#vertexhudcarfuel', this.carhudColors['vertexhud'].gas, this.fuel / 100)
                loadProgress('#vertexhudcarfuel', this.carhudColors['vertexhud'].gas, this.fuel / 100)
            }
            } else if (this.secilencarhud == 'perspecthud') {
                loadProgress('#perspecthudcarfuel', this.carhudColors['perspecthud'].gas, this.fuel / 100)
                // perspecthudcarfuel.animate(this.fuel / 100);
            } else if (this.secilencarhud == 'mayhemhud') {
                if (this.carhudColors['mayhemhud']) {
                    loadProgress('#mayhemhudcarfuel', this.carhudColors['mayhemhud'].gas, this.fuel / 100)
                }

            }

        },
        UpdateJob(joblabel, gradelabel) {
            this.joblabel = joblabel
            this.grade_label = gradelabel
        },
        SetCash(val) {
            this.cash = val
        },
        SetWeaponImage(val) {
            this.weaponImage = val
        },
        SetBankMoney(val) {
            this.bankMoney = val
        },
        SetAmmos(ammo, max_ammo) {
            this.ammo = ammo
            this.max_ammo = max_ammo
        },
        SetLogoSize(width, height) {
            this.logoWidth = width
            this.logoHeight = height
        },
        SetStyles(val, val2) {
            this.text2Style = val2
            this.text1Style = val
        },
        setVehicleClass(val) {
            this.vehicleclass = val;
        },
        SetShowOxy(toggle) {
            this.showOxy = toggle
        },
        SetEnableWatermarkCash(val) {
            this.enableWaterMarkCash = val
        },
        SetEnableWatermarkId(val) {
            this.enableWaterMarkId = val
        },
        SetDisableWaterMarkTextAndLogo(val) {
            this.disableWaterMarkTextAndLogo = val
        },
        SetWaterMarkHud(val) {
            this.enableWaterMarkHud = val
        },
        seWindSpeed(val) {
            this.windspeed = val
            if (this.secilencarhud == 'perspecthud') {
                perspecthudwindspeed.animate(this.windspeed / 10);
            } else if (this.secilencarhud == 'mayhemhud') {

                loadProgress('#mayhemhudwind', this.carhudColors['mayhemhud'].wind, this.windspeed / 10)

            }
        },
        SetWaterMarkLogo(val) {
            this.WaterMarkLogo = val
        },
        ResetHudPositions() {

            $.post(`https://${
                this.resourceName
            }/ResetHudPositions`, JSON.stringify({hud: this.secilenhud}));
        },
        ResetCarHudPositions() {

            $.post(`https://${
                this.resourceName
            }/ResetCarHudPositionsandColors`, JSON.stringify({hud: this.secilencarhud}));
        },

        UpdateLights(val) {
            this.lightsOn = val
        },
        SetUseWaterMarkText(val) {
            this.UseWaterMarkText = val
        },
        ToggleEngine(val) {
            if (this.secilencarhud == 'vertexhud') {
                this.engineIsOn = val
            }

        },
        ToggleCruise(val) {
            this.cruiseIsOn = val
        },
        SetWaterMarkLogo(val) {
            this.WaterMarkLogo = val
        },
        SetEnableOnlinePlayers(val) {
            this.EnableOnlinePlayers = val
        },
        UpdateSeatbelt(val) {
            this.sealtBeltIsOn = val
        },

        DisplayWeaponAmmo(toggle) {
            this.displayAmmoHud = toggle
        },
        SetEnableAmmoHUD(val) {
            this.enableAmmoHud = val
        },


        SetEnableWatermarkJob(val) {
            this.enableWatermarkJob = val
        },
        SetEnableWatermarkBankMoney(val) {
            this.enableWaterMarkBank = val
        },
        SetEnableWatermarkBankMoneyBorder(val) {
            this.showbankcashborder = val
        },
        openhudselectormenu(open) {

            this.styleselectoropen = open;
        },
        randomcolor() {

            $.post(`https://${
                this.resourceName
            }/ResetCarHudPositionsandColors`, JSON.stringify({hud: this.secilencarhud, randomcolor: setBg()}));
        },
        selecthudmalibu(val) {
            if (val == 'malibuhud') {
                this.secilenhud = 'malibuhud'
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
                if (malibuhudhealthbar) {
                    malibuhudhealthbar.destroy();
                    malibuhudhealthbar = null;
                }
                if (malibuhudarmourbar) {
                    malibuhudarmourbar.destroy();
                    malibuhudarmourbar = null;
                }
                if (malibuhudthirstbar) {
                    malibuhudthirstbar.destroy();
                    malibuhudthirstbar = null;
                }
                if (malibuhudhungerbar) {
                    malibuhudhungerbar.destroy();
                    malibuhudhungerbar = null;
                }
                if (malibuhudstaminabar) {
                    malibuhudstaminabar.destroy();
                    malibuhudstaminabar = null;
                }
                if (malibuhudstressbar) {
                    malibuhudstressbar.destroy();
                    malibuhudstressbar = null;
                }
                if (malibuhudoxybar) {
                    malibuhudoxybar.destroy();
                    malibuhudoxybar = null;
                }

                if (this.hudColors['malibuhud']) {

                    loadProgress('#malibuhudhealthbar', this.hudColors['malibuhud'].health, this.statusData['health'] / 100)
                    loadProgress('#malibuhudarmourbar', this.hudColors['malibuhud'].armor, this.statusData['armour'] / 100)
                    loadProgress('#malibuhudthirstbar', this.hudColors['malibuhud'].thirst, this.statusData['thirst'] / 100)
                    loadProgress('#malibuhudhungerbar', this.hudColors['malibuhud'].hunger, this.statusData['hunger'] / 100)
                    loadProgress('#malibuhudstaminabar', this.hudColors['malibuhud'].stamina, this.statusData['stamina'] / 100)
                    loadProgress('#malibuhudstressbar', this.hudColors['malibuhud'].stress, this.statusData['stress'] / 100)
                    loadProgress('#malibuhudoxybar', this.hudColors['malibuhud'].oxy, this.statusData['oxy'] / 100)

                }

            } else if (val == 'belairhud') {
                this.secilenhud = 'belairhud'
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
            } else {
                this.secilenhud = 'venicehud'
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));
            }

        },
        editmodeopenmayhemspeedometer(val) {
            if (val) {
                this.secilencarhud = 'mayhemhud';
                this.pagespeedometer = '';
                this.styleselectoropen = false
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('mayhemhud')

                }, 200)
            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        editmodeopenvertexspeedometer(val) {

            if (val) {
                this.pagespeedometer = '';
                this.secilencarhud = 'vertexhud';

                this.styleselectoropen = false

                this.editmodevertex = val

                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('vertexhud')

                }, 200)
            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        editmodeopenperspectspeedometer(val) {
            if (val) {
                this.pagespeedometer = '';
                this.secilencarhud = 'perspecthud';
                this.editmode = true
                this.styleselectoropen = false
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('perspecthud')

                }, 200)

            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        editmodeopenbelairhud(val) {
            if (val) {
                this.pagespeedometer = '';
                this.secilenhud = 'belairhud';
                this.styleselectoropen = false
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('belairhud')

                }, 200)
                $.post(`https://${
                    this.resourceName
                }/currentHud`, JSON.stringify({hud: this.secilenhud}));

            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        editmodeopenmalibuhud(val) {
            if (val) {
                this.pagespeedometer = '';
                this.secilenhud = 'malibuhud';
                this.styleselectoropen = false
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('malibuhud')

                }, 200)
            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        editmodeopenmayhemhud(val) {
            if (val) {
                this.pagespeedometer = '';
                this.secilencarhud = 'mayhemhud';
                this.styleselectoropen = false
                this.editmodemayhem = true
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: true}));
                setTimeout(() => {
                    this.InitDrag('mayhemhud')

                }, 200)
            } else {
                $.post(`https://${
                    this.resourceName
                }/editModeActive`, JSON.stringify({toggle: false}));
            }
        },
        currentselectsettingspage(page) {

            this.selectselectscreen = page;
        },

        setEditmode(val) {
            this.editmode = val
        },
        setEditmodemayhem(val) {
            this.editmodemayhem = val
        },
        setEditmodevertex(val) {
            this.editmodevertex = val
        },

        ColorInput(e) {
            $(e.currentTarget).parent().find('.colorinput').click()

        },
        OnChangeColor(e) {

            $.post(`https://${
                this.resourceName
            }/hudselected`, JSON.stringify({
                settingstype: 'hudColors',
                val: {
                    color: e.target.value,
                    type: e.target.getAttribute('data-type'),
                    hud: this.secilenhud

                }

            }));

        },
        OnChangeCarhudColor(e) {

            $.post(`https://${
                this.resourceName
            }/hudselected`, JSON.stringify({
                settingstype: 'carhudColors',

                val: {
                    color: e.target.value,
                    type: e.target.getAttribute('data-type'),
                    carhud: this.secilencarhud
                }

            }));

        },
        SetSpeedometerSize() {
            $.post(`https://${
                this.resourceName
            }/hudselected`, JSON.stringify({settingstype: 'speedometerSize', val: this.speedometerSize}));
        },
        SethudSize() {
            $.post(`https://${
                this.resourceName
            }/hudselected`, JSON.stringify({settingstype: 'hudsize', val: this.hudSize}));
        },
        UpdateSettings(data) {

            if (data.showHideBox != null && data.showHideBox != undefined) {
                this.showHideBox = data.showHideBox
            }
            if (data.showmenu != null && data.showmenu != undefined) {
                this.showgeneralmenu = data.showmenu
            }
            if (data.speedtype) {
                this.selectSpeedUnit = data.speedtype
            }
            if (data.hudColors) {
                this.hudColors = data.hudColors
            }
            if (data.carhudColors) {
                this.carhudColors = data.carhudColors
            }
            if (data.hud) {
                this.secilenhud = data.hud
           
            }
            if (data.carhud) {
                this.secilencarhud = data.carhud
            }

            if (data.forceHide != null && data.forceHide != undefined) {
                this.forceHide = data.forceHide
            }
            if (data.refreshRate != null && data.refreshRate != undefined) {
                this.refreshRate = data.refreshRate
                this.displayRefreshRate = data.refreshRate
            }

            if (data.positionsData != null && data.positionsData != undefined) {
                this.positionsData = data.positionsData
            }

            if (data.hideBoxData != null && data.hideBoxData != undefined) {
                this.hideBoxData = data.hideBoxData
                this.hideBoxDataDisplay = data.hideBoxData

            }
            if (data.hide != null && data.hide != undefined) {
                this.hide = data.hide
            }

            if (data.speedometerSize != null && data.speedometerSize != undefined) {
                this.speedometerSize = data.speedometerSize
            }
            if (data.hudsize != null && data.hudsize != undefined) {
                this.hudSize = data.hudsize
            }


            if (mayhemhudcarhealth) {
                mayhemhudcarhealth.destroy();
                mayhemhudcarhealth = null;
            }
            if (mayhemhudcarfuel) {
                mayhemhudcarfuel.destroy();
                mayhemhudcarfuel = null;
            }
            if (mayhemhudaltdudee) {
                mayhemhudaltdudee.destroy();
                mayhemhudaltdudee = null;
            }
            if (mayhemhudwind) {
                mayhemhudwind.destroy();
                mayhemhudwind = null;
            }


            if (malibuhudhealthbar) {
                malibuhudhealthbar.destroy();
                malibuhudhealthbar = null;
            }
            if (malibuhudarmourbar) {
                malibuhudarmourbar.destroy();
                malibuhudarmourbar = null;
            }
            if (malibuhudthirstbar) {

                malibuhudthirstbar.destroy();
                malibuhudthirstbar = null;
            }
            // hunger bar eklenecek
            if (malibuhudstaminabar) {
                malibuhudstaminabar.destroy();
                malibuhudstaminabar = null;
            }
            if (malibuhudhungerbar) {
                malibuhudhungerbar.destroy();
                malibuhudhungerbar = null;
            }
            if (malibuhudstressbar) {
                malibuhudstressbar.destroy();
                malibuhudstressbar = null;
            }
            if (malibuhudoxybar) {
                malibuhudoxybar.destroy();
                malibuhudoxybar = null;
            }
            if (perspecthudrpm) {
                perspecthudrpm.destroy();
                perspecthudrpm = null;
            }

            if (perspecthudcarfuel) {
                perspecthudcarfuel.destroy();
                perspecthudcarfuel = null;
            }
            if (perspecthudcarhealth) {
                perspecthudcarhealth.destroy();
                perspecthudcarhealth = null;
            }
           
           
            if (mayhemhudnitro) {
                mayhemhudnitro.destroy();
                mayhemhudnitro = null;
            }
            if (perspecthudnitro) {
               
                perspecthudnitro.destroy();
                perspecthudnitro = null;
            }


            if (this.carhudColors['mayhemhud']) {
                loadProgress('#mayhemhudcarhealth', this.carhudColors['mayhemhud'].health, this.engineHealth.toFixed(0) / 1000)
                loadProgress('#mayhemhudcarfuel', this.carhudColors['mayhemhud'].gas, this.fuel / 100)
            }
            if (this.fuel != 0 && this.carhudColors['vertexhud'] ) {
                
                 loadProgress('#vertexhudcarfuel', this.carhudColors['vertexhud'].gas, this.fuel / 100)
                loadProgress('#vertexhudcarhalth', this.carhudColors['vertexhud'].health, this.engineHealth.toFixed(0) / 1000)
            }
           

            if (this.hudColors['malibuhud']) {

                loadProgress('#malibuhudhealthbar', this.hudColors['malibuhud'].health, this.statusData['health'] / 100)
                loadProgress('#malibuhudarmourbar', this.hudColors['malibuhud'].armor, this.statusData['armour'] / 100)
                loadProgress('#malibuhudthirstbar', this.hudColors['malibuhud'].thirst, this.statusData['thirst'] / 100)
                loadProgress('#malibuhudhungerbar', this.hudColors['malibuhud'].hunger, this.statusData['hunger'] / 100)
                loadProgress('#malibuhudstaminabar', this.hudColors['malibuhud'].stamina, this.statusData['stamina'] / 100)
                loadProgress('#malibuhudstressbar', this.hudColors['malibuhud'].stress, this.statusData['stress'] / 100)
                loadProgress('#malibuhudoxybar', this.hudColors['malibuhud'].oxy, this.statusData['oxy'] / 100)
            }
            if (this.carhudColors['mayhemhud']) {
                loadProgress('#mayhemhudaltdudee', this.carhudColors['mayhemhud'].altitude, this.statusData['altitude'] / 1000)
                loadProgress('#mayhemhudwind', this.carhudColors['mayhemhud'].wind, this.windspeed / 10)
                loadProgress('#mayhemhudnitro', this.carhudColors['mayhemhud'].nitro, this.statusData['nitro'] / 100)
            }
            if (this.carhudColors['perspecthud'] && this.secilencarhud == 'perspecthud') {
                loadProgress('#perspecthudrpm', this.carhudColors['perspecthud'].shift, rpm)
                loadProgress('#perspecthudcarfuel', this.carhudColors['perspecthud'].gas, this.fuel / 100)
                loadProgress('#perspecthudcarhealth', this.carhudColors['perspecthud'].health, this.engineHealth.toFixed(0) / 1000)
                if(this.seatbeltnitroengine.nitro){
                    loadProgress('#perspecthudnitro', this.carhudColors['perspecthud'].nitro, this.statusData['nitro'] / 100)
                }
              

            }

        },

        SetIndicatorDegree(val, rpm, gear) {
            this.gear = gear
            if (this.secilencarhud == 'mayhemhud') {
                this.vertexhudspeedtext = val
                this.speed = val

                mayhemhudspeedbar.animate(generalspeed)
                if (val >= 100) {
                    if (val >= 260) {
                        this.indicatorDegree = 260 - 124

                    } else {
                        this.indicatorDegree = val - 124
                    }
                } else {
                    this.indicatorDegree = val - 124

                }
            } else if (this.secilencarhud == 'vertexhud') {
                this.vertexhudspeedtext = val

            } else {
                this.vehiclerpm = rpm

                this.vertexhudspeedtext = val
                if (this.carhudColors['perspecthud']) {
                    // if (perspecthudrpm){
                    //     perspecthudrpm.destroy();
                    //     perspecthudrpm = null;
                    // }
                    loadProgress('#perspecthudrpm', this.carhudColors['perspecthud'].shift, rpm)
                }

            }

        },

        InitDrag(hud) {
            if (hud == 'vertexhud') {
                $('.vertexhuddrag').draggable({
                    helper: "clone",
                    revertDuration: 0,
                    revert: "invalid",
                    cancel: ".item-nodrag",
                    containment: "body",
                    scroll: false,
                    start: function (event, ui) {},
                    drag: function (event, ui) {},
                    stop: (event, ui) => {
                        // $(event.target).css('position', "absolute")
                        // $(event.target).css('left', ui.position.left)
                        // $(event.target).css('top', ui.position.top)
                        let left = ui.position.left
                        let top = ui.position.top
                        let type = $(event.target).attr('data-type')
                        $.post(`https://${
                            this.resourceName
                        }/hudselected`, JSON.stringify({
                            settingstype: "positionsData",
                            val: {
                                ...this.positionsData,
                                [type]: {
                                    position: 'absolute',
                                    left: left + 'px',
                                    top: top + 'px'
                                }
                            }
                        }));


                    }
                });

            }


            if (hud == 'malibuhud') {
                $('.radialhudicons').draggable({
                    helper: "clone",
                    revertDuration: 0,
                    revert: "invalid",
                    cancel: ".item-nodrag",
                    containment: "body",
                    scroll: false,
                    start: function (event, ui) {},
                    drag: function (event, ui) {},
                    stop: (event, ui) => {
                        // $(event.target).css('position', "absolute")
                        // $(event.target).css('left', ui.position.left)
                        // $(event.target).css('top', ui.position.top)
                        let left = ui.position.left
                        let top = ui.position.top
                        let type = $(event.target).attr('data-type')
                        $.post(`https://${
                            this.resourceName
                        }/hudselected`, JSON.stringify({
                            settingstype: "positionsData",
                            val: {
                                ...this.positionsData,

                                [type]: {
                                    position: 'absolute',
                                    left: left + 'px',
                                    top: top + 'px'
                                }
                            }
                        }));


                    }
                });
            }

            if (hud == 'belairhud') {
                $('.belairdraghud').draggable({
                    helper: "clone",
                    revertDuration: 0,
                    revert: "invalid",
                    cancel: ".item-nodrag",
                    containment: "body",
                    scroll: false,
                    start: function (event, ui) {},
                    drag: function (event, ui) {},
                    stop: (event, ui) => {
                        // $(event.target).css('position', "absolute")
                        // $(event.target).css('left', ui.position.left)
                        // $(event.target).css('top', ui.position.top)
                        let left = ui.position.left
                        let top = ui.position.top
                        let type = $(event.target).attr('data-type')

                        $.post(`https://${
                            this.resourceName
                        }/hudselected`, JSON.stringify({
                            settingstype: "positionsData",
                            val: {
                                ...this.positionsData,
                                [type]: {
                                    position: 'absolute',
                                    left: left + 'px',
                                    top: top + 'px'
                                }
                            }
                        }));


                    }
                });
            }
            if (hud == 'mayhemhud') {
                $('.mayhemhudspeedometer').draggable({
                    helper: "clone",
                    revertDuration: 0,
                    revert: "invalid",
                    cancel: ".item-nodrag",
                    containment: "body",
                    scroll: false,
                    start: function (event, ui) {},
                    drag: function (event, ui) {},
                    stop: (event, ui) => {
                        // $(event.target).css('position', "absolute")
                        // $(event.target).css('left', ui.position.left)
                        // $(event.target).css('top', ui.position.top)
                        let left = ui.position.left
                        let top = ui.position.top
                        let type = $(event.target).attr('data-type')

                        $.post(`https://${
                            this.resourceName
                        }/hudselected`, JSON.stringify({
                            settingstype: "positionsData",
                            val: {
                                ...this.positionsData,
                                [type]: {
                                    position: 'absolute',
                                    left: left + 'px',
                                    top: top + 'px'
                                }
                            }
                        }));


                    }
                });
            }
            if (hud == 'perspecthud') {
                $('.perspecthudwrapper').draggable({
                    helper: "clone",
                    revertDuration: 0,
                    revert: "invalid",
                    cancel: ".item-nodrag",
                    containment: "body",
                    scroll: false,
                    start: function (event, ui) {},
                    drag: function (event, ui) {},
                    stop: (event, ui) => {
                        // $(event.target).css('position', "absolute")
                        // $(event.target).css('left', ui.position.left)
                        // $(event.target).css('top', ui.position.top)
                        let left = ui.position.left
                        let top = ui.position.top
                        let type = $(event.target).attr('data-type')

                        $.post(`https://${
                            this.resourceName
                        }/hudselected`, JSON.stringify({
                            settingstype: "positionsData",
                            val: {
                                ...this.positionsData,
                                [type]: {
                                    position: 'absolute',
                                    left: left + 'px',
                                    top: top + 'px'
                                }
                            }
                        }));


                    }
                });
            }

        },
        SetStatusData(type, val) {

            if (type == "altitude") {
                if (val >= 2483) {
                    val = 2483
                } else if (val <= 0) {
                    val = 0
                }

            }
            if (type == 'health') {
                if (val < 0) {
                    val = 0
                }
            }
            if (type == 'oxy') {
                if (val < 0) {
                    val = 0
                }
            }
            if (typeof(val) == 'boolean') {
                this.statusData[type] = val

            } else {

                this.statusData[type] = val.toFixed(0)
            }
         
            if (this.secilenhud == 'venicehud') {
         
                if (!this.vehicleisin && !this.displayOnWalk) {
                  
                    venicehudonwalkhealtbar.animate(this.statusData['health'] / 100);
                    venicehudonwalkarmourbar.animate(this.statusData['armour'] / 100);
                    venicehudonwalkthirstbar.animate(this.statusData['thirst'] / 100);
                    venicehudonwalkhungerbar.animate(this.statusData['hunger'] / 100);
                   
                    loadProgress('#venicehudonwalkstressbar',this.hudColors['venicehud'].stress, this.statusData['stress'] / 100)
                    
                    venicehudonwalkstaminabar.animate(this.statusData['stamina'] / 100)
                    venicehudonwalklungsbar.animate(this.statusData['oxy'] / 100)

                }
                if (this.vehicleisin || this.displayOnWalk) {
                    
                    if(this.enablehudsettings['venicehudstress']){
                        
                        loadProgress('#venicehudstressbar',this.hudColors['venicehud'].stress, this.statusData['stress'] / 100)
                    }
                  
                    if(this.enablehudsettings['venicehudarmour']){
                        venicehudhealthbar.animate(this.statusData['health'] / 100);   
                    }
                    if(this.enablehudsettings['venicehudthirst']){
                        venicehudthirstbar.animate(this.statusData['thirst'] / 100);
                    }
                    
                    if(this.enablehudsettings['venicehudarmour']){
                        venicehudarmourbar.animate(this.statusData['armour'] / 100);
                    }
                    if(this.enablehudsettings['venicehudhunger']){
                        venicehudhungerbar.animate(this.statusData['hunger'] / 100);
                    }
                       
                     if(this.showOxy && this.enablehudsettings['venicehudoxy']){
                      
                         venicehudlungsbar.animate(this.statusData['oxy'] / 100);
                     }
                    if(this.enablehudsettings['venicehudstamina']){
                        venicehudmapopenstaminabar.animate(this.statusData['stamina'] / 100);
            
                      }
                
                    if(this.showOxy){
                        $('#venicehudlungsbar').css('display', 'block')
                        $('#venicehudmapopenstaminabar').css('display', 'none')
                        
                    }else {
                        $('#venicehudmapopenstaminabar').css('display', 'block')
                        $('#venicehudlungsbar').css('display', 'none')
                    }
                }
            }
            if (this.secilenhud == 'malibuhud') {

                if (!this.malibufix) {
                    loadProgress('#malibuhudhealthbar', this.hudColors['malibuhud'].health, this.statusData['health'] / 100)
                    loadProgress('#malibuhudarmourbar', this.hudColors['malibuhud'].armor, this.statusData['armour'] / 100)
                    loadProgress('#malibuhudthirstbar', this.hudColors['malibuhud'].thirst, this.statusData['thirst'] / 100)
                    loadProgress('#malibuhudhungerbar', this.hudColors['malibuhud'].hunger, this.statusData['hunger'] / 100)
                    loadProgress('#malibuhudstaminabar', this.hudColors['malibuhud'].stamina, this.statusData['stamina'] / 100)
                    loadProgress('#malibuhudstressbar', this.hudColors['malibuhud'].stress, this.statusData['stress'] / 100)
                    loadProgress('#malibuhudoxybar', this.hudColors['malibuhud'].oxy, this.statusData['oxy'] / 100)
                    if (this.statusData['mic_level']) {
                        if (this.statusData['mic_level'] == 1) {
                            malibuhudmicrophonebar.animate(0.33);
                        } else if (this.statusData['mic_level'] == 2) {
                            malibuhudmicrophonebar.animate(0.66)
                        } else {
                            malibuhudmicrophonebar.animate(1)
                        }
                    }
                }
            }
            if (this.secilencarhud == 'mayhemhud') {
                loadProgress('#mayhemhudaltdudee', this.carhudColors['mayhemhud'].altitude, this.statusData['altitude'] / 1000)
                loadProgress('#mayhemhudnitro', this.carhudColors['mayhemhud'].nitro, this.statusData['nitro'] / 100)
            }
            if (this.secilencarhud == 'perspecthud' && this.seatbeltnitroengine.nitro) {
                loadProgress('#perspecthudnitro', this.carhudColors['perspecthud'].nitro, this.statusData['nitro'] / 100)

            }


        },
        GetResponse(resourceName) {
            this.resourceName = resourceName
        
            $.post(`https://${this.resourceName}/GetResponse`, JSON.stringify({}));

        },
        changemalibufix(val) {
            this.malibufix = val
        },
        SetEngineHealth(val) {
            this.engineHealth = val

            let carhealt = this.engineHealth.toFixed(0) / 1000

            if (this.secilencarhud == 'vertexhud') {

                loadProgress('#vertexhudcarhalth', this.carhudColors['vertexhud'].health, this.engineHealth.toFixed(0) / 1000)
            } else if (this.secilencarhud == 'perspecthud') {

                loadProgress('#perspecthudcarhealth', this.carhudColors['perspecthud'].health, this.engineHealth.toFixed(0) / 1000)
            } else {
                if (this.carhudColors['mayhemhud']) {
                    loadProgress('#mayhemhudcarhealth', this.carhudColors['mayhemhud'].health, carhealt)
                }
            }
        }


    },
    computed: {
        GetSpeedometerSize() {
            return {transform: `scale(${
                    this.speedometerSize
                })`}
        },
        GetResourceName() {
            return this.resourceName
        },
        style() {

            let scales = 0.7
            if (screen.width == 1366 && screen.height == 768) {
                scales = 0.5
            }
            if (screen.width == 2560 && screen.height == 1440) {
                scales = 0.8
            }

            return {
                transform: ' rotate(' + this.indicatorDegree + 'deg) scale(' + scales + ')'
                
                
            }

        },


        mayhemhudspeedcolor() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].speed}
            }

        },
        mayhemhudspeedcolor0() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s0}
            }


        },
        perspecthudroads2() {
            if (this.carhudColors['perspecthud']) {
                return {'stop-color': this.carhudColors['perspecthud'].roads}
            }


        },

        veniceditmodehealth() {


            return {
                'color': this.hudColors['venicehud'].health,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].health,
                'fill': this.hudColors['venicehud'].health,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].health, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }

        },
        veniceditmodehealthbackground() {
            if (this.hudColors['venicehud']) {
                return {'background-color': this.hudColors['venicehud'].health}
            }

        },
        veniceditmodehealthfill() {
            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].health}
            }
        },
        veniceditmodehealthstroke() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].health}
            }
        },
        veniceditmodearmorstroke() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].armor}
            }
        },
        veniceditmodearmorfill() {
            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].armor}
            }
        },
        venicehudarmour() {

            if (this.hudColors['venicehud']) {
                return {
                    'color': this.hudColors['venicehud'].armor,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].armor,
                    'fill': this.hudColors['venicehud'].armor,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['venicehud'].armor, 0.8)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }

        },
        veniceditmodearmorbackground() {
            if (this.hudColors['venicehud']) {
                return {'background-color': this.hudColors['venicehud'].armor}
            }
        },


        venicehudthirst() {


            return {
                'color': this.hudColors['venicehud'].thirst,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].thirst,
                'fill': this.hudColors['venicehud'].thirst,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].thirst, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }

        },
        venicehudthirstbackground() {

            return {'background-color': this.hudColors['venicehud'].thirst}

        },
        venicehudstrokethirst() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].thirst}
            }
        },
        venicehudthirstfill() {
            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].thirst}
            }
        },
        venicehudstrokehunger() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].hunger}
            }
        },

        venicehudstrokehungerfill() {
            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].hunger}
            }
        },
        venicehudstrokehungerstroke() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].hunger}
            }
        },
        venicehudstrokestress() {
            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].stress}
            }

        },
        venicehudstressfill() {
            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].stress}
            }

        },


        venicehudstrokeheal() {
            return {'stroke': this.hudColors['venicehud'].health}

        },
        venicehudstrokearmour() {
            return {'stroke': this.hudColors['venicehud'].armor}

        },
        venicehudstrokestamina() {
            return {'stroke': this.hudColors['venicehud'].stamina}

        },

        venicehudhunger() {


            return {
                'color': this.hudColors['venicehud'].hunger,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].hunger,
                'fill': this.hudColors['venicehud'].hunger,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].hunger, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }

        },
        venicehudhungerbackground() {

            return {'background-color': this.hudColors['venicehud'].hunger}

        },

        venicehudstress() {


            return {
                'color': this.hudColors['venicehud'].stress,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].stress,
                'fill': this.hudColors['venicehud'].stress,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].stress, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }

        },
        venicehudstressbackground() {

            return {'background-color': this.hudColors['venicehud'].stress}

        },

        venicehudoxygen() {


            return {
                'color': this.hudColors['venicehud'].oxy,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].oxy,
                'fill': this.hudColors['venicehud'].oxy,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].oxy, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }

        },
        venicehudoxygenbackground() {

            return {'background-color': this.hudColors['venicehud'].oxy}

        },


        venicehudstaminafill() {

            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].stamina}
            }
        },

     
        venicehudstamina() {

            if (this.hudColors['venicehud']) {
            return {
                'color': this.hudColors['venicehud'].stamina,
                'box-shadow': '0px 0px 11px ' + this.hudColors['venicehud'].stamina,
                'fill': this.hudColors['venicehud'].stamina,
                'background': `linear-gradient(360deg, ${
                    addAlpha(this.hudColors['venicehud'].stamina, 0.8)
                } 0%, rgba(0, 0, 0, 0) 147.06%)`
            }
        }

        },
        venicehudstaminabackground() {

            return {'background-color': this.hudColors['venicehud'].stamina}

        },

        venicehudlungsfill() {

            if (this.hudColors['venicehud']) {
                return {'fill': this.hudColors['venicehud'].oxy}
            }
        },
        venicehudlungsstroke() {

            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].oxy}
            }
        },

        venicehudstrokestressbar() {

            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].stress}
            }
        },
        venicehudstaminastroke() {

            if (this.hudColors['venicehud']) {
                return {'stroke': this.hudColors['venicehud'].stamina}
            }
        },

        GetSpeed() {

            if (this.vertexhudspeedtext.length >= 3) {
                return `<span class="activeSpeed"  v-if="this.carhudColors['vertexhud']" :style="{ 'color' : this.carhudColors['vertexhud'].speed }">${
                    this.vertexhudspeedtext
                }</span>`
            } else if (this.vertexhudspeedtext.length == 2) {
                return `<span class="lightSpeed"  v-if="this.carhudColors['vertexhud']" :style="{ 'color' : this.carhudColors['vertexhud'].speed }">0</span><span class="activeSpeed">${
                    this.vertexhudspeedtext
                }</span>`
            } else if (this.vertexhudspeedtext.length == 1 && this.vertexhudspeedtext.length != 0) {
                return `<span class="lightSpeed"  v-if="this.carhudColors['vertexhud']" :style="{ 'color' : this.carhudColors['vertexhud'].speed }">00</span><span class="activeSpeed"  v-if="this.carhudColors['vertexhud']" :style="{ 'color' : this.carhudColors['vertexhud'].speed }">${
                    this.vertexhudspeedtext
                }</span>`
            } else {
                return `<span class="lightSpeed">000</span>`

            }
        },
        GetSpeedmayhem() {

            if (this.vertexhudspeedtext.length >= 3) {
                return `<span class="activeSpeed2"  v-if="this.carhudColors['mayhemhud']" :style="{ 'color' : this.carhudColors['mayhemhud'].speed }">${
                    this.vertexhudspeedtext
                }</span>`
            } else if (this.vertexhudspeedtext.length == 2) {
                return `<span class="lightSpeed2"  v-if="this.carhudColors['mayhemhud']" :style="{ 'color' : this.carhudColors['mayhemhud'].speed }">0</span><span class="activeSpeed2">${
                    this.vertexhudspeedtext
                }</span>`
            } else if (this.vertexhudspeedtext.length == 1 && this.vertexhudspeedtext.length != 0) {
                return `<span class="lightSpeed2"  v-if="this.carhudColors['mayhemhud']" :style="{ 'color' : this.carhudColors['mayhemhud'].speed }">00</span><span class="activeSpeed2"  v-if="this.carhudColors['mayhemhud']" :style="{ 'color' : this.carhudColors['mayhemhud'].speed }">${
                    this.vertexhudspeedtext
                }</span>`
            } else {
                return `<span class="lightSpeed2">000</span>`

            }
        },
        mayhemhudspeedometershift() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].shift}
            }
        },
        mayhemhudspeedometers20() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s20}
            }
        },
        mayhemhudspeedometers40() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s40}
            }
        },
        mayhemhudspeedometers60() {
            if (this.carhudColors['mayhemhud']) {

                return {'fill': this.carhudColors['mayhemhud'].s60}
            }
        },
        mayhemhudspeedometers80() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s80}
            }
        },

        mayhemhudspeedometers100() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s100}
            }
        },
        mayhemhudspeedometers120() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s120}
            }
        },
        mayhemhudspeedometers140() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s140}
            }
        },
        mayhemhudspeedometers160() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s160}
            }
        },
        mayhemhudspeedometers180() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s180}
            }
        },

        mayhemhudspeedometers200() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s200}
            }
        },
        mayhemhudspeedometers220() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s220}
            }
        },
        mayhemhudspeedometers240() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s240}
            }
        },
        mayhemhudspeedometers260() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].s260}
            }
        },
        mayhemhudspeedometersgas() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].gas}
            }
        },
        mayhemhudspeedometersgasstroke() {
            if (this.carhudColors['mayhemhud']) {
                return {'stroke': this.carhudColors['mayhemhud'].gas}
            }
        },
        mayhemhudspeedometershealth() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].health}
            }
        },
        mayhemhudspeedometershealthbackground() {
            if (this.carhudColors['mayhemhud']) {
                return {
                    'color': this.carhudColors['mayhemhud'].health,
                    'background-color': addAlpha(this.carhudColors['mayhemhud'].health, 0.3)
                }
            }
        },
        mayhemhudspeedometersgasbackground() {
            if (this.carhudColors['mayhemhud']) {
                return {
                    'color': this.carhudColors['mayhemhud'].gas,
                    'background-color': addAlpha(this.carhudColors['mayhemhud'].gas, 0.1)
                }
            }
        },
        mayhemhudspeedometerstopcolor() {
            if (this.carhudColors['mayhemhud']) {
                return {'stop-color': this.carhudColors['mayhemhud'].needle}
            }
        },
        perspecthudaltstopcolor() {
            if (this.carhudColors['perspecthud']) {
                return {'stop-color': this.carhudColors['perspecthud'].roads}
            }
        },
        perspecthudaltstrokecolor() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].roads}
            }
        },
        mayhemhudspeedometershealthstroke() {
            if (this.carhudColors['mayhemhud']) {
                return {'stroke': this.carhudColors['mayhemhud'].health}
            }
        },
        mayhemhudspeedometersnitro() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].nitro}
            }
        },

        mayhemhudspeedometersnitrostroke() {
            if (this.carhudColors['mayhemhud']) {
                return {'stroke': this.carhudColors['mayhemhud'].nitro}
            }
        },
        mayhemhudspeedometersneedle() {
            if (this.carhudColors['mayhemhud']) {
                return {'fill': this.carhudColors['mayhemhud'].needle, 'stroke': this.carhudColors['mayhemhud'].needle}
            }
        },

        mayhemhudspeedometersspeedbar() {
            if (this.carhudColors['mayhemhud']) {
                return {'stroke': this.carhudColors['mayhemhud'].circle}
            }
        },
        vertexhudhealthstroke() {
            if (this.carhudColors['vertexhud']) {
                return {'stroke': this.carhudColors['vertexhud'].health}
            }
        },
        vertexhudgasstroke() {
            if (this.carhudColors['vertexhud']) {
                return {'stroke': this.carhudColors['vertexhud'].gas}
            }
        },

        perspecthudnitrostroke() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].nitro}
            }
        },
        perspecthudgasstroke() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].gas}
            }
        },
        perspecthudgasfill() {
            if (this.carhudColors['perspecthud']) {
                return {'fill': this.carhudColors['perspecthud'].gas}
            }
        },
        perspecthudnitro() {
            if (this.carhudColors['perspecthud']) {
                return {'fill': this.carhudColors['perspecthud'].nitro}
            }
        },
        perspecthudnitroshiftstroke() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].shift}
            }
        },
        perspecthudhealthstroke() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].health}
            }
        },
        perspecthudspeed() {
            if (this.carhudColors['perspecthud']) {
                return {'fill': this.carhudColors['perspecthud'].speed}
            }
        },
        perspecthudroads() {
            if (this.carhudColors['perspecthud']) {
                return {'stroke': this.carhudColors['perspecthud'].roads}
            }
        },


        malibuhudhealthfill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].health}
            }

        },
        malibuhudhealthstroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].health}
            }

        },
        malibuhudhealth() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].health,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].health,
                    'fill': this.hudColors['malibuhud'].health,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].health, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        malibuhudarmourfill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].armor}
            }

        },

        malibuhudarmourstroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].armor}
            }

        },


        malibuhudarmour() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].armor,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].armor,
                    'fill': this.hudColors['malibuhud'].armor,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].armor, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudthirstfill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].thirst}
            }

        },
        malibuhudthirststroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].thirst}
            }

        },

        malibuhudthirst() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].thirst,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].thirst,
                    'fill': this.hudColors['malibuhud'].thirst,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].thirst, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudhungerfill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].hunger}
            }

        },
        malibuhudhungerstroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].hunger}
            }

        },
        malibuhudhunger() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].hunger,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].hunger,
                    'fill': this.hudColors['malibuhud'].hunger,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].hunger, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudstressfill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].stress}
            }

        },

        malibuhudstressstroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].stress}
            }

        },

        malibuhudstress() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].stress,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].stress,
                    'fill': this.hudColors['malibuhud'].stress,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].stress, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudstaminafill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].oxy}
            }

        },
        malibuhudoxystroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].oxy}
            }

        },
        malibuhudstamina() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].oxy,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].oxy,
                    'fill': this.hudColors['malibuhud'].oxy,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].oxy, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudstafill() {

            if (this.hudColors['malibuhud']) {

                return {'fill': this.hudColors['malibuhud'].stamina}
            }

        },
        malibuhudstastroke() {

            if (this.hudColors['malibuhud']) {

                return {'stroke': this.hudColors['malibuhud'].stamina}
            }

        },
        malibuhudsta() {

            if (this.hudColors['malibuhud']) {
                return {
                    'color': this.hudColors['malibuhud'].stamina,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['malibuhud'].stamina,
                    'fill': this.hudColors['malibuhud'].stamina,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['malibuhud'].stamina, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        malibuhudshadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px  4px 21px' + addAlpha(this.hudColors['malibuhud'].health, 0.1),
                   
                }

            }
        },
        malibuhudshadowmic() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px #FFFFFF',
                  
                
                }

            }
        },
        malibuhudarmorshadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].armor,
            
                }

            }
        },
        malibuhudthirstshadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].thirst,
             
                }

            }
        },

        malibuhudhungershadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].hunger,
                  
                }

            }
        },
        malibuhudstaminashadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].stamina,
                
                }

            }
        },
        malibuhudstressshadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].stress,
                 
                }

            }
        },
        malibuhudoxyshadow() {
            if (this.hudColors['malibuhud']) {
                return {
                    'box-shadow': '0px 4px 21px' + this.hudColors['malibuhud'].oxy,
                  
                }

            }
        },
        belairhudstamina() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].stamina}

            }
        },
        belairhudstamina2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].stamina, 0.5)
                    }`}
            }
        },
        belairhudstaminaall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].stamina,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].stamina,
                    'fill': this.hudColors['belairhud'].stamina,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].stamina, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudoxy() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].oxy}

            }
        },
        belairhudoxy2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].oxy, 0.5)
                    }`}
            }
        },
        belairhudoxyall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].oxy,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].oxy,
                    'fill': this.hudColors['belairhud'].oxy,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].oxy, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudstress() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].stress}

            }
        },
        belairhudstress2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].stress, 0.5)
                    }`}
            }
        },
        belairhudstressall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].stress,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].stress,
                    'fill': this.hudColors['belairhud'].stress,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].stress, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudhunger() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].hunger}

            }
        },
        belairhudhunger2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].hunger, 0.5)
                    }`}
            }
        },
        belairhudhungerall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].hunger,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].hunger,
                    'fill': this.hudColors['belairhud'].hunger,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].hunger, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudthirst() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].thirst}

            }
        },
        belairhudthirst2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].thirst, 0.5)
                    }`}
            }
        },
        belairhudthirstall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].thirst,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].thirst,
                    'fill': this.hudColors['belairhud'].thirst,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].thirst, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudarmour() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].armor}

            }
        },
        belairhudarmour2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].armor, 0.5)
                    }`}
            }
        },
        belairhudarmourall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].armor,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].armor,
                    'fill': this.hudColors['belairhud'].armor,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].armor, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },
        belairhudhealth() {
            if (this.hudColors['belairhud']) {
                return {'fill': this.hudColors['belairhud'].health}

            }
        },
        belairhudhealth2() {
            if (this.hudColors['belairhud']) {
                return {'fill': `${
                        addAlpha(this.hudColors['belairhud'].health, 0.5)
                    }`}
            }
        },
        belairhudhealthall() {
            if (this.hudColors['belairhud']) {
                return {
                    'color': this.hudColors['belairhud'].health,
                    'box-shadow': '0px 0px 11px ' + this.hudColors['belairhud'].health,
                    'fill': this.hudColors['belairhud'].health,
                    'background': `linear-gradient(360deg, ${
                        addAlpha(this.hudColors['belairhud'].health, 0.5)
                    } 0%, rgba(0, 0, 0, 0) 147.06%)`
                }
            }
        },

        belairhudhealthshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].health,
                }
            }
        },
        belairhudarmorshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].armor,
                }
            }
        },
        belairhudthirstshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].thirst,
                }
            }
        },
        belairhudhungershadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].hunger,
                }
            }
        },
        belairhudstaminashadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].stamina,
                }
            }
        },
        belairhudstressshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].stress,
                }
            }
        },
        belairhudstressshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].stress,
                }
            }
        },
        belairhudoxyshadow(){
            if (this.hudColors['belairhud']) {
                return {
            'filter' : 'drop-shadow(0 0 0.5rem'+this.hudColors['belairhud'].oxy,
                }
            }
        },
        venicehudondropshadowarmor(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].armor,
                }
            }  
        },
        venicehudondropshadowheal(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].health,
                }
            }  
        },
        venicehudondropshadowthirst(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].thirst,
                }
            }  
        },
        venicehudondropshadowhunger(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].hunger,
                }
            }  
        },

        venicehudondropshadowstress(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].stress,
                }
            }  
        },

       
     
        
        venicehudondropshadowoxy(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].oxy,
                }
            }  
        },
        venicehudondropshadowstamina(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].stamina,
                }
            }  
        },
        venicehudondropshadowstressbar(){
            if (this.hudColors['venicehud']) {
                return {
            'filter' : 'drop-shadow(0 1px 4px'+this.hudColors['venicehud'].stress,
                }
            }  
        },
        mayhemhudcarhealbackground(){
            if (this.carhudColors['mayhemhud']) {
                return {
            'background-color' :  addAlphaMalibu(this.carhudColors['mayhemhud'].health,0.2),
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['mayhemhud'].health,
                }
            }  
        },
        mayhemhudcarfuelbackground(){
            if (this.carhudColors['mayhemhud']) {
                return {
            'background-color' :  addAlphaMalibu(this.carhudColors['mayhemhud'].gas,0.2),
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['mayhemhud'].gas,
                }
            }  
        },
        mayhemhudcarnitrobackground(){
            if (this.carhudColors['mayhemhud']) {
                return {
            'background-color' :  addAlphaMalibu(this.carhudColors['mayhemhud'].nitro,0.2),
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['mayhemhud'].nitro,
                }
            }  
        },
        mayhemhudcircle(){
            if (this.carhudColors['mayhemhud']) {
                return {
                'fill' :  addAlphaMalibu(this.carhudColors['mayhemhud'].circle,1.0),
            
                }
            }  
        },
        perspecthudshadowheal(){
            if (this.carhudColors['perspecthud']) {
                return {
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['perspecthud'].health,
                }
            }  
        },
        perspecthudshadowfuel(){
            if (this.carhudColors['perspecthud']) {
                return {
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['perspecthud'].gas,
                }
            }  
        },
        perspecthudshadowpm(){
            if (this.carhudColors['perspecthud']) {
                return {
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['perspecthud'].shift,
                }
            }  
        },
        perspecthudshadownitro(){
            if (this.carhudColors['perspecthud']) {
                return {
            'filter' : 'drop-shadow(0 1px 18px'+this.carhudColors['perspecthud'].nitro,
                }
            }  
        },
    }


})


function addAlpha(color, opacity) {

    var _opacity = Math.round(Math.min(Math.max(opacity || 1, 0), 1) * 255);
    if (color.length > 6) {
        return color
    } else {
        return color + _opacity.toString(16).toUpperCase();
    }
}
function addAlphaMalibu(color, opacity) {

    var _opacity = Math.round(Math.min(Math.max(opacity || 1, 0), 1) * 255);
    return color + _opacity.toString(16).toUpperCase();
}
if (app.DisplayRealTime) {
    let interval = setInterval(() => {
        const date = new Date();
        var dateD = date.getFullYear() + '.' + (
            date.getMonth() + 1
        ) + '.' + date.getDate();
        let minutes = date.getMinutes()
        let seconds = date.getSeconds()
        if (minutes < 10) {
            minutes = "0" + minutes
        }
        if (seconds < 10) {
            seconds = "0" + seconds
        }
        if (! app.DisplayRealTime) {
            clearInterval(interval)
        }

        const time = date.getHours() + ":" + minutes + ":" + seconds;

        app.SetDate(time, dateD)

    }, 1000)
    const date = new Date();
    var dateD = date.getFullYear() + '.' + (
        date.getMonth() + 1
    ) + '.' + date.getDate();

    let minutes = date.getMinutes()
    let seconds = date.getSeconds()
    if (minutes < 10) {
        minutes = "0" + minutes
    }
    if (seconds < 10) {
        seconds = "0" + seconds
    }
    const time = date.getHours() + ":" + minutes + ":" + seconds;

    app.SetDate(time, dateD)
}


$(document).keydown(function (e) {
    if (e.keyCode == 27) {
        app.changemalibufix(false)
        app.openhudselectormenu(false);

        app.editmodeopenmayhemspeedometer(false)
        app.currentselectsettingspage('');
        app.selectpagespeedometer('');
        app.setEditmode(false);
        app.setEditmodemayhem(false)
        app.setEditmodevertex(false)

        $.post(`https://${
            app.GetResourceName
        }/escape`, JSON.stringify({}));
    }
});


function loadProgress(id, colors, val) {

    setTimeout(function () {
        if (id == '#malibuhudhealthbar') {

            if (! malibuhudhealthbar) {
                malibuhudhealthbar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,
                    opacity:0.5,
                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                  
                    trailWidth: 7,
                    svgStyle: null
                });
            }
            
            malibuhudhealthbar.animate(val);
        }
        if (id == '#malibuhudarmourbar') {
            if (! malibuhudarmourbar) {
                malibuhudarmourbar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,
                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null
                });
            }
            malibuhudarmourbar.animate(val);
        }
        if (id == '#malibuhudthirstbar') {


            if (! malibuhudthirstbar) {

                malibuhudthirstbar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,
                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null

                })
            }


            malibuhudthirstbar.animate(val);
        }
        if (id == '#malibuhudstaminabar') {

            if (! malibuhudstaminabar) {

                malibuhudstaminabar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null

                })
            }


            malibuhudstaminabar.animate(val);
        }
        if (id == '#malibuhudhungerbar') {

            if (! malibuhudhungerbar) {

                malibuhudhungerbar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null

                })
            }


            malibuhudhungerbar.animate(val);
        }
        if (id == '#malibuhudstressbar') {

            if (! malibuhudstressbar) {

                malibuhudstressbar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null

                })
            }


            malibuhudstressbar.animate(val);
        }
        if (id == '#malibuhudoxybar') {

            if (! malibuhudoxybar) {

                malibuhudoxybar = new ProgressBar.Circle(id, {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: 'white',
                    trailWidth: 2,
                    svgStyle: null

                })
            }


            malibuhudoxybar.animate(val);
        }
        if (id == '#mayhemhudcarhealth') {

            if (! mayhemhudcarhealth) {
                mayhemhudcarhealth = new ProgressBar.Circle(id, {
                    strokeWidth: 6,

                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 6,
                    svgStyle: null

                })
            }


            mayhemhudcarhealth.animate(val);
        }
        if (id == '#mayhemhudcarfuel') {
            if (! mayhemhudcarfuel) {

                mayhemhudcarfuel = new ProgressBar.Circle(id, {
                    strokeWidth: 6,
                    duration: 300,
                    color: colors,
                    trailColor:  addAlphaMalibu(colors,0.4),
                    trailWidth: 6,
                    svgStyle: null
                });
            }
            mayhemhudcarfuel.animate(val);
        }
         if (id == '#vertexhudcarfuel') {
     
         
             if (vertexhudcarfuel ) {
              
                vertexhudcarfuel = null;
                }
             if (! vertexhudcarfuel ) {
                 vertexhudcarfuel = new ProgressBar.Path('#vertexhudcarfuel', {
                    
                     duration: 0
                 });
              
                 vertexhudcarfuel.animate(val)
             }
         }
        if (id == "#vertexhudcarhalth") {

            if (! vertexhudcarhalth) {
                vertexhudcarhalth = new ProgressBar.Path("#vertexhudcarhalth", {
                    easing: 'easeInOut',
                    duration: 400
                });
            }
            vertexhudcarhalth.animate(val)
        }
        if (id == '#mayhemhudaltdudee') {
            if (! mayhemhudaltdudee) {
                mayhemhudaltdudee = new ProgressBar.Circle('#mayhemhudaltdudee', {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: 'white',
                    trailWidth: 2,
                    svgStyle: null
                });
            }
            mayhemhudaltdudee.animate(val)

        }
        if (id == '#mayhemhudwind') {
            if (! mayhemhudwind) {
                mayhemhudwind = new ProgressBar.Circle('#mayhemhudwind', {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: 'white',
                    trailWidth: 2,
                    svgStyle: null
                });
            }
            mayhemhudwind.animate(val)

        }
        if (id == '#perspecthudrpm') {

            if (! perspecthudrpm) {
                perspecthudrpm = new ProgressBar.Circle('#perspecthudrpm', {
                    strokeWidth: 7,
                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null
                });
            }
            perspecthudrpm.animate(val);

        }

        if (id == '#perspecthudcarfuel') {

            if (! perspecthudcarfuel) {
                perspecthudcarfuel = new ProgressBar.Circle('#perspecthudcarfuel', {
                    strokeWidth: 7,
                    duration: 300,
                    color: colors,
                   
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null
                });
            }
            perspecthudcarfuel.animate(val);

        }
        if (id == '#perspecthudcarhealth') {
            if (! perspecthudcarhealth) {
                perspecthudcarhealth = new ProgressBar.Circle('#perspecthudcarhealth', {
                    strokeWidth: 7,
                    easing: 'easeInOut',
                    duration: 300,
                    color: colors,
                    trailColor:  addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null
                });
            }

            perspecthudcarhealth.animate(val)

        }
        if (id == '#mayhemhudnitro') {
            if (!mayhemhudnitro) {
                mayhemhudnitro = new ProgressBar.Circle('#mayhemhudnitro', {
                    strokeWidth: 6,
                  
                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 6,
                    svgStyle: null
                });
            }

            mayhemhudnitro.animate(val);
        }

        if (id == '#perspecthudnitro') {
          
            if (! perspecthudnitro) {
                perspecthudnitro = new ProgressBar.Circle('#perspecthudnitro', {
                    strokeWidth: 7,

                    duration: 300,
                    color: colors,
                    trailColor: addAlphaMalibu(colors,0.4),
                    trailWidth: 7,
                    svgStyle: null
                });
            }

            perspecthudnitro.animate(val);
        }
         if (id == '#venicehudstressbar') {
             if (!venicehudstressbar) {
             
                 venicehudstressbar = new ProgressBar.Path('#venicehudstressbar', {


                     duration: 300,
                
                 });
             }
         
             venicehudstressbar.animate(val);
         }
     
        if (id == '#venicehudonwalkstressbar') {
            if (!venicehudonwalkstressbar) {
              
                venicehudonwalkstressbar = new ProgressBar.Path('#venicehudonwalkstressbar', {


                    duration: 300,
                  
                });
            }
        
            venicehudonwalkstressbar.animate(val);
        }



    }, 100)
}


var venicehudhealthbar = new ProgressBar.Path('#venicehudhealthbar', {duration: 300});
var venicehudarmourbar = new ProgressBar.Path('#venicehudarmourbar', {duration: 300});
var venicehudthirstbar = new ProgressBar.Path('#venicehudthirstbar', {duration: 300});
var venicehudhungerbar = new ProgressBar.Path('#venicehudhungerbar', {duration: 300});

var venicehudlungsbar = new ProgressBar.Path('#venicehudlungsbar', {duration: 300});


 var venicehudmapopenstaminabar = new ProgressBar.Path('#venicehudmapopenstaminabar', {duration: 300});
var venicehudstressbar = new ProgressBar.Path('#venicehudstressbar', {duration: 1000});


var mayhemhudspeedbar = new ProgressBar.Path('#mayemhudspeeds', {duration: 300});
var venicehudonwalkhealtbar = new ProgressBar.Path('#venicehudonwalkhealtbar', {duration: 300});
var venicehudonwalkarmourbar = new ProgressBar.Path('#venicehudonwalkarmourbar', {duration: 300});
var venicehudonwalkthirstbar = new ProgressBar.Path('#venicehudonwalkthirstbar', {duration: 300});
var venicehudonwalkhungerbar = new ProgressBar.Path('#venicehudonwalkhungerbar', {duration: 300});

var venicehudonwalkstaminabar = new ProgressBar.Path('#venicehudonwalkstaminabar', {duration: 300});
var venicehudonwalklungsbar = new ProgressBar.Path('#venicehudonwalklungsbar', {duration: 300});




var malibuhudmicrophonebar = new ProgressBar.Circle('#malibuhudmicrophonebar', {
    strokeWidth: 7,
   
    duration: 300,
    color: 'white',
    trailColor: '#ffffff6b',
    trailWidth: 7,
    svgStyle: null
});


var perspecthudwindspeed = new ProgressBar.Circle('#perspecthudwindspeed', {
    strokeWidth: 6,
    easing: 'easeInOut',
    duration: 200,
    color: '#FFC700',
    trailColor: 'rgba(255, 0, 61, 0.4)',
    trailWidth: 1,
    svgStyle: null
});

const setBg = () => {
    const randomColor = Math.floor(Math.random() * 16777215).toString(16);
    return '#' + randomColor;
}

window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.type) {
        case "SET_DATA":
            $('#app').css('display', 'block');
            // app.denemevent();

            break;
        case "fuel_update": app.SetFuel(item.fuel.toFixed(0))
            break
        case "SETTINGS_DATA": app.openhudselectormenu(item.open);
            break;
        case "speed_update": rpm = (item.rpm - 0.20) / 1.83;
            if (rpm < 0) {
                rpm = 0
            }
            if (item.speed >= 260) {

                generalspeed = 1.0;

            } else {


                generalspeed = item.speed / 260

            } app.SetIndicatorDegree(item.speed, item.rpm, item.gear)
            break;

        case "vehicleclass": app.setVehicleClass(item.vehicleclass)
            break;
        case "wind_speed": app.seWindSpeed(item.windspeed)
            break;

        case "update_settings": app.UpdateSettings(item.val)
            break;
        case "set_id": app.setid(item.value)
            break;
        case "watermark_text": app.SetWaterMarkText(item.text1, item.text2)
            break
        case "update_job": app.UpdateJob(item.joblabel, item.grade_label)
            break
        case "update_money": app.SetCash(item.money)
            break
            case "setenablesettings":
             
                 app.changeSeatbelt(item.value)
            break

        case "update_bank": app.SetBankMoney(item.money)
            break;
        case "SetWeaponImage": app.SetWeaponImage(item.value)
            break
        case "display_weapon_ammo": app.DisplayWeaponAmmo(item.toggle)
            break
        case "update_weapon_ammo": app.SetAmmos(item.ammo, item.maxammo)
            break
        case "set_EnableAmmohud": app.SetEnableAmmoHUD(item.value)
            break
        case "EnableWatermarkJob": app.SetEnableWatermarkJob(item.value)
            break
        case "EnableWatermarkCash": app.SetEnableWatermarkCash(item.value)
            break
        case "EnableWatermarkBankMoney": app.SetEnableWatermarkBankMoney(item.value)
            break
        case "Enablecashandbank": app.SetEnableWatermarkBankMoneyBorder(item.value)
            break
        case "EnableWatermarkId": app.SetEnableWatermarkId(item.value)
            break
        case "set_status": app.SetStatusData(item.statustype, item.value)
            break
        case "vehiclepedisin": app.setVehicleisin(item.vehicleisin)
            break

        case "EnableOnlinePlayers": app.SetEnableOnlinePlayers(item.value)
            break
        case "location_update": app.LocationUpdate(item.street, item.zone, item.heading)
            break
        case "DisableWaterMarkTextAndLogo": app.SetDisableWaterMarkTextAndLogo(item.value)
            break
        case "UseWaterMarkText": app.SetUseWaterMarkText(item.value)
            break
        case "WaterMarkLogo": app.SetWaterMarkLogo(item.value)
            break
        case "WaterMarkLogo": app.SetWaterMarkLogo(item.value)
            break
        case "SetLogoSize": app.SetLogoSize(item.width, item.height)
            break
        case "set_watermarkhud": app.SetWaterMarkHud(item.value)
            break
        case "SetStyles": app.SetStyles(item.text1, item.text2)
            break
        case "SetEngineHealth": app.SetEngineHealth(item.value)

            break
        case "total_player": app.totalsPlayers(item.val)
            break
        case "update_altitude": app.UpdateAltitude(item.val)
            break
        case "update_ligths": app.UpdateLights(item.state)
            break
        case "toggle_oxy": app.SetShowOxy(item.toggle)
            break
        case "toggle_engine": app.ToggleEngine(item.toggle)
            break
        case "toggle_cruise": app.ToggleCruise(item.toggle)
            break
        case "update_seatbelt": app.UpdateSeatbelt(item.toggle)
            break
        case "displayOnWalk": app.DisplayOnWalk(item.displayOnWalk)
            break
            case "SetMap": app.mapUstuSettings(item.value)
            break
            
        case "unbuckle":
            const unbuckle = document.querySelector('#unbuckle')
            unbuckle.volume = event.data.volume;
            unbuckle.play();
            break;
        case "buckle":
            const buckle = document.querySelector('#buckle')
            buckle.volume = event.data.volume;
            buckle.play();
            break;
        case "clock_update":
            const date = new Date();
            var dateD = date.getFullYear() + '.' + (
                date.getMonth() + 1
            ) + '.' + date.getDate();
            app.SetDate(item.hours + ":" + item.minutes, dateD)
            break
        case "DisplayRealTime": app.SetDisplayRealTime(item.value)
            break
        case "EnableHelperText": app.HelperText(item.value)
            break
        case "SetEnableHelperText": app.setHelperText(item.value)
            break
        case "set_force_hide": app.SetForceHide(item.value)
            break
        case "SetLanguage": app.SetLanguage(item.value)
            break
        case "send_response": app.GetResponse(item.resourceName)
            break
            case "setHudsettings": app.setHudEnableSettings(item.value)
            break

            
        case "CLOSE":

            break;

        default:
            break;
    }
});

