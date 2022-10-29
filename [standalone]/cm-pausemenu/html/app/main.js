let notifications = []
let audioPlayer = null;
function hexToRgbA(hex) {
    var c;
    if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)) {
        c = hex.substring(1).split('');
        if (c.length == 3) {
            c = [c[0], c[0], c[1], c[1], c[2], c[2]];
        }
        c = '0x' + c.join('');
        return 'rgba(' + [(c >> 16) & 255, (c >> 8) & 255, c & 255].join(',') + ',1)';
    }
    throw new Error('Bad Hex');
}
function GenerateNotification(message, timeout, themes, currentTheme) {
    let id = notifications.length + 1;
    app.ShowWelcomeMessage(false)
    const themeData = themes[currentTheme]
    if (timeout == null) {
        timeout = 5000;
    }
    if (message == null) {
        message = "UNKOWN";
    }
    audioPlayer = new Audio("./assets/sound/codemnotify.ogg");
    audioPlayer.volume = 0.5;
    audioPlayer.play();
    let html = `
       <div style="transform: translateX(165px); background: ${themeData.notifyBg}" class="notify" id="notify-${id}" >
        <p class="notify-text">${message}</p>
        <div class="notify-border" style="background-color: ${themeData.notifyBorderColor};">
        </div>
        <img src="./assets/themes/${currentTheme}_theme/notify_icon.png" class="notify_icon">
     </div>
   `
    $('.notify-container').append(html)
    anime({
        targets: `#notify-${id}`,
        translateX: "0",
        duration: 550,
        easing: "spring(1, 70, 100, 10)",
    });
    notifications[id] = setTimeout(() => {
        anime({
            targets: `#notify-${id}`,
            translateX: "165px",
            duration: 550,
            easing: "spring(1, 70, 100, 10)",
        });
        setTimeout(() => {
            $("#notify-" + id).remove();
            notifications[id] = null;
            if ($('.notify')[0]) {
                app.ShowWelcomeMessage(false)
            } else {
                app.ShowWelcomeMessage(true)
            }
        }, 150);
    }, timeout)
}

const OnNuiMessage = () => {
    window.addEventListener('message', (event) => {
        const data = event.data
        const action = data.action
        const payload = data.payload
        switch (action) {
            case "SET_VISIBILITY":
                app.SetMenuVisibility(payload)
                break
            case "SET_LOGO":
                app.SetLogo(payload)
                break
            case "SEND_NOTIFICATION":
                if (app.GetMenuVisibility) {
                    const currentTheme = app.GetTheme
                    const themes = app.GetThemes

                    GenerateNotification(payload.text, payload.timeout, themes, currentTheme)
                }
                break
            case "SET_BATTLEPASS_MISSIONS":
                app.SetBattlepassMissions(payload)
                break
            case "SET_BATTLEPASS_DATA":
                app.SetBattlepassData(payload)
                break
            case "SET_BATTLEPASS_ITEMS":
                app.SetBattlepassItems(payload)
                break
            case "SET_THEME":
                app.SetTheme(payload)
                break
            case "SET_RESOURCE_NAME":
                app.SetResourceName(payload)
                break
            case "IS_NIGHT":
                app.SetIsNight(payload)
                break
            case "SET_BATTLEPASS_REMAIN_DAY":
                app.SetBattlepassRemainDay(payload)
                break
            case "CHECK_NUI_READY":
                postData(`https://${payload}/nuiReady`, {})
                app.SetResourceName(payload)
                break
            case "UPDATE_JOB":
                app.UpdateJob(payload.job, payload.job_grade_name)
                break
            case "UPDATE_MONEY":
                app.UpdateMoney(payload.cash, payload.bank)
                break
            case "UPDATE_PLAYER_NAME":
                app.UpdatePlayerName(payload)
                break
            case "UPDATE_BANK":
                app.UpdateBank(payload)
                break
            case "UPDATE_CASH":
                app.UpdateCash(payload)
                break
            case "UPDATE_PLAYERS_COUNT":
                app.UpdatePlayersCount(payload)
                break
            case "UPDATE_PLAYER_PING":
                app.UpdatePlayerPing(payload)
                break
            case "UPDATE_CHAT_MESSAGES":
                app.UpdateChatMessages(payload)
                break
            case "SET_STORE_URL":
                app.SetStoreURL(payload)
                break
            case "SET_DAILY_AWARDS_DAY_COUNTER":
                app.SetDailyAwardsDayCounter(payload)
                break
            case "SET_DAILY_AWARD_ITEMS":
                app.SetDailyAwardItems(payload)
                break
            case "SET_DAILY_AWARD_DATA":
                app.SetDailyAwardData(payload)
                break
            case "SET_PATCH_NOTES":
                app.SetPatchNotes(payload)
                break
            case "UPDATE_AVATAR":
                app.UpdateAvatar(payload)
                break
            case "UPDATE_LIVECALL_MESSAGE":
                app.UpdateLiveCallMessage(event.data.messagedata)
                break;
            case "SET_IDENTITY":
                app.SetIdentity(event.data.identifier)
                break
            case "isAdmin":
                app.setAdmin(event.data.value)
                break;
            case "getCallData":
                app.getCallData(event.data.val)
                break;
            case "SET_FREE_BATTLEPASS":
                app.SetFreeBattlepass(payload)
                break
            case "LOCALE":
                app.getLocales(event.data.value)
                break;
            case "DisplayPage":
                app.getDisplayePage(event.data.value)
                break;
            case "SET_ONLINEADMIN":
                app.getOnlineAdmins(event.data.value)
                break;
            case "UPDATE_LIVECALL_TIME":
                app.setLiveTime(event.data.time)
                break;


            default:
                break
        }
    })
}


const OnPressEsc = (resourceName) => {
    postData(`https://${resourceName}/exit`, {})
}

const postData = async (url = '', data = {}) => {
    // Default options are marked with *
    const response = await fetch(url, {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
        body: JSON.stringify(data) // body data type must match "Content-Type" header
    });
    return response.json(); // parses JSON response into native JavaScript objects
}

const app = new Vue({
    el: '#app',
    data: {
        showWelcomeMessage: true,
        currentPage: 'main',
        isNight: false,
        show: false,
        resourceName: 'cm-pausemenu',
        dailySwiper: false,
        battlepassSwiper: false,
        battlepassMissionsSwiper: false,
        battlepassMissionProgressbar: {},
        battlepassMissionReadMore: {},
        battlepassRemainDay: 30,
        tbxId: '',
        checked: false,
        chatMessage: '',
        chatMessages: [],
        oldMessages: [],
        oldMessagesIndex: -1,
        playerData: {
            job: 'UNEMPLOYED',
            grade_label: 'CIVIL',
            cash: 0,
            bank: 0,
            name: '',
            players: 0,
            ping: 0,
        },
        storeUrl: '',
        dailyAwardItems: [],
        dailyAwardsDayCounter: false,
        dailyAwardData: {
            identifier: '',
            claimedDays: [],
        },
        gameTimeInterval: false,
        gameTime: 0,
        theme: 'purple',
        minute: '',
        hour: '',
        month: '',
        day: '',
        year: '',
        dayLabel: '',
        livecallmessage: '',
        livecallmessagedata: '',
        liveCallData: '',
        sendIdentifier: '',
        isAdmin: false,
        patchNotes: [],
        themes: {
            purple: {
                color: '#DB00FF',
                opacityColor: '#db00ff8a',
                notifyBg: 'linear-gradient(90deg, #730086 0%, rgba(0, 0, 0, 0) 100%)',
                notifyBorderColor: '#CC0BED',

            },
            red: {
                color: '#FF0000',
                opacityColor: '#ff00008a',
                notifyBg: 'linear-gradient(90deg, #7D0000 0%, rgba(0, 0, 0, 0) 100%)',
                notifyBorderColor: '#ED0B0B',

            },
            green: {
                color: '#9EFF00',
                opacityColor: '#9dff008a',
                notifyBg: 'linear-gradient(90deg, #568A00 0%, rgba(0, 0, 0, 0) 100%)',
                notifyBorderColor: '#9BF20D',

            },
            blue: {
                color: '#00FFD1',
                opacityColor: '#00ffd18a',
                notifyBg: 'linear-gradient(90deg, rgba(1, 255, 210, 0.54) 0%, rgba(1, 255, 210, 0) 100%)',
                notifyBorderColor: '#00FFD1',

            },
            white: {
                color: '#FFFFFF',
                opacityColor: '#ffffff8a',
                notifyBg: 'linear-gradient(90deg, #5E5E5E 0%, rgba(0, 0, 0, 0) 100%);',
                notifyBorderColor: '#FFFFFF',

            },

        },
        battlepassData: {},
        battlepassItems: [],
        battlepassMissions: {},

        avatar: './assets/img/pp.png',
        visibleModals: {},
        freeBattlepass: false,
        locales: {},
        displayPage: {},
        onlineadmin: '',
        calldatatime: '',
        calldatadate: '',
        logo: '',
        playerlivetime: ''
    },

    methods: {
        setLiveTime(val) {
            this.playerlivetime = val;
        },
        SetLogo(val) {
            this.logo = val
        },
        getOnlineAdmins(value) {

            this.onlineadmin = value;
        },
        liveCallEnd(val, val2) {
            if (val) {
                postData(`https://${this.resourceName}/closeLiveCallAdmin`, { identifier: val2 })
                this.SetCurrentPage('main')
            } else {
                // user
                postData(`https://${this.resourceName}/closeLiveCall`)
                this.SetCurrentPage('main')
            }

        },
        ShowWelcomeMessage(val) {
            this.showWelcomeMessage = val
        },
        getDisplayePage(val) {
            this.displayPage = val;

        },
        getLocales(val) {
            this.locales = val
        },
        PlayClickSound() {
            const click = document.querySelector('#click')
            if (!click.paused) click.pause();
            click.currentTime = 0;
            click.volume = 0.3;
            click.play();
        },
        SetFreeBattlepass(val) {
            this.freeBattlepass = val
        },
        VerifyTebex() {
            if (this.checked) {
                postData(`https://${this.resourceName}/verifyTbx`, { tbxId: this.tbxId })
                this.tbxId = ''
                this.PlayClickSound()
            }
        },
        SetBattlepassRemainDay(day) {
            this.battlepassRemainDay = day
        },
        OpenModal(item, index) {
            if (item.type == 'box') {
                for (key in this.visibleModals) {
                    if (key != index) {
                        this.visibleModals[key] = false
                    }
                }
                this.visibleModals[index] = !this.visibleModals[index]
                this.PlayClickSound()

            }
        },
        GetBattlepassMissionProgress(id) {
            let data = this.battlepassData.missions.find((m) => m.id == id)
            if (data) {
                const num = (data.progress + "").split(".")[1]
                if (num) {
                    return parseFloat(data.progress).toFixed(2)
                } else {
                    return data.progress.toFixed(0)
                }
            } else {
                return 0
            }
        },
        SetBattlepassMissions(missions) {
            this.battlepassMissions = missions
            if (this.currentPage == 'battlepass_missions') this.SetupBattlepassMissionsSwiper()

        },
        getMessage(val) {
            this.sendIdentifier = val;
            postData(`https://${this.resourceName}/getMessageData`, { identifier: val })
            this.currentPage = 'createcall'
            this.PlayClickSound()

        },
        getCallData(val) {

            this.liveCallData = val;

            if (this.liveCallData) {
                this.calldatatime = this.liveCallData[0].calltime
                this.calldatadate = this.liveCallData[0].calldate
            }

        },
        setAdmin(val) {
            this.isAdmin = val;

        },
        SetIdentity(val) {
            this.playeridentifier = val;
        },
        UpdateLiveCallMessage(val) {
            this.livecallmessagedata = val;

            Vue.nextTick(() => {
                if ($('.create_call_container_middle')[0]) {
                    $('.create_call_container_middle').animate({ scrollTop: 9999 }, 1);
                }


            })

        },
        sendlivecallchat(val) {
            if (val) {
                this.livecallmessage = val;
                postData(`https://${this.resourceName}/sendlivechatmessage`, { message: this.livecallmessage })
                this.livecallmessage = ''
            }

        },
        sendlivecallchatadmin(val, val2) {

            if (val2) {
                if (val) {
                    this.livecallmessage = val;
                    postData(`https://${this.resourceName}/sendlivechatmessageadmin`, { message: this.livecallmessage, identifier: val2 })
                    this.livecallmessage = ''
                }

            } else {
                console.log('ERROR PLS CONTACT CODEM')
            }
            this.PlayClickSound()
        },
        SetBattlepassItems(val) {
            this.battlepassItems = val
        },
        GetBattlepassLevelText(level) {

            let myLevel = this.battlepassData.level
            if (myLevel >= level) {
                return this.locales["CLICK_ITEM"]
            } else {
                return `${this.locales["LV"]} ${level}
                ${this.locales["REQUIRED"]}`

            }
        },
        GetBattlepassLevelProgress(level) {
            let myXP = this.battlepassData.xp
            let myLevel = this.battlepassData.level
            let maxXP = this.battlepassItems[myLevel - 1].requiredXP
            if (level > myLevel) {
                return 0
            } else if (level < myLevel) {
                return 100
            } else {
                return (100 * myXP) / maxXP
            }
        },
        CheckClaimedBattlepassItem(index) {
            let levels = this.battlepassData.claimedLevels
            if (levels) {
                return levels.includes(index)
            } else {
                return false

            }
        },
        SetBattlepassData(val) {
            this.battlepassData = val
        },
        UpdateAvatar(val) {
            this.avatar = val
        },

        ClaimBattlepassItem(item, level) {
            let myLevel = this.battlepassData.level
            let levels = this.battlepassData.claimedLevels

            if (levels && myLevel >= level && !levels.includes(level)) {
                postData(`https://${this.resourceName}/ClaimBattlepassItem`, {
                    item,
                    itemLevel: level,
                })
                this.PlayClickSound()

            }
        },
        SetPatchNotes(val) {
            this.patchNotes = val
        },
        SetTheme(theme) {
            this.theme = theme
        },
        GetThemeAsset(asset) {
            return `./assets/themes/${this.theme}_theme/${asset}`
        },
        MainDailyClass(day) {
            if (day == this.dailyAwardsDayCounter && !this.CheckClaimedDailyItem(day)) {
                return 'daily_current_day'
            } else if (day < this.dailyAwardsDayCounter && this.CheckClaimedDailyItem(day)) {
                return 'daily_completed_box'
            } else if (day == this.dailyAwardsDayCounter && this.CheckClaimedDailyItem(day)) {
                return 'daily_current_day daily_completed_box'
            }

            return ''

        },
        ReadMore(n) {
            this.battlepassMissionReadMore[n] = !this.battlepassMissionReadMore[n]
            this.PlayClickSound()

        },
        FormatMissionText(text, n) {
            if (text.length > 75) {
                if (this.battlepassMissionReadMore[n]) {
                    return text
                } else {

                    return text.slice(0, 70)
                }
            } else {
                return text
            }
        },
        CheckMissionLength(text) {
            if (text.length > 75) {
                return true
            } else {
                return false
            }
        },
        GetRowLine(day) {
            return Math.ceil(day / 20)
        },
        GetMaxRow() {
            return Math.ceil(this.dailyAwardItems.length / 20)
        },
        SetDailyAwardData(val) {
            this.dailyAwardData = val
        },
        SetDailyAwardItems(val) {
            this.dailyAwardItems = val

            this.dailyAwardItems.forEach((item) => {
                if (item.type == 'vehicle') {
                    fetch('./assets/car_images/' + item.image, { method: 'HEAD' })
                        .then(res => {
                            if (!res.ok) {
                                item.image = 'unmarked.png'
                            }
                        }).catch(err => console.log('Error:', err));
                }
            })

        },
        SetDailyAwardsDayCounter(val) {
            this.dailyAwardsDayCounter = val

        },
        SetStoreURL(val) {
            this.storeUrl = val
        },
        OpenStore() {
            window.invokeNative('openUrl', this.storeUrl)
            this.PlayClickSound()


        },
        Exit() {
            postData(`https://${this.resourceName}/exit`, {})
        },
        UpdateChatMessages(messages) {
            this.chatMessages = messages
            Vue.nextTick(() => {
                let element = document.querySelector('.nav_chat_container')
                if (document.body.contains(element)) {
                    element.scrollTop = element.scrollHeight;

                }

            })

        },
        SendChatMessage() {
            postData(`https://${this.resourceName}/sendChatMessage`, {
                message: this.chatMessage
            })
            this.oldMessages.unshift(this.chatMessage);
            this.oldMessagesIndex = -1;
            this.chatMessage = ''
            this.PlayClickSound()
        },
        UpdatePlayerPing(ping) {
            this.playerData.ping = ping
        },
        UpdatePlayersCount(amount) {
            this.playerData.players = amount
        },
        UpdateBank(bank) {
            this.playerData.bank = bank
        },
        UpdateCash(cash) {
            this.playerData.cash = cash
        },
        UpdatePlayerName(name) {
            this.playerData.name = name
        },
        UpdateJob(job, grade_label) {
            this.playerData.job = job
            this.playerData.grade_label = grade_label
        },
        numberWithSpaces(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        UpdateMoney(cash, bank) {
            this.playerData.cash = cash
            this.playerData.bank = bank
        },
        ResetModal() {
            for (key in this.visibleModals) {
                this.visibleModals[key] = false
            }
        },
        SetCurrentPage(val) {
            if ((this.currentPage == 'battlepass' || this.currentPage == 'daily_awards') && val == 'main') this.ResetModal()

            this.currentPage = val
            this.PlayClickSound()
            if (val == 'daily_awards') this.SetupDailySwiper()
            if (val == 'battlepass') this.SetupBattlepassSwiper()
            if (val == 'battlepass_missions') this.SetupBattlepassMissionsSwiper()
            if (val == 'createcall') this.setupFistLiveCall()
            if (val == 'admincallpage') this.setupCallLiveData()
        },
        setupFistLiveCall() {
            postData(`https://${this.resourceName}/firstLiveCallSave`)
        },
        setupCallLiveData() {
            postData(`https://${this.resourceName}/callLiveData`)
        },
        SetIsNight(val) {
            this.isNight = val
        },
        ClickBottomMenu(action) {
            postData(`https://${this.resourceName}/clickBottomMenu`, {
                action
            })
            this.PlayClickSound()

        },
        SetupBattlepassSwiper() {
            if (this.battlepassSwiper) {
                this.battlepassSwiper.destroy()
            }
            Vue.nextTick(() => {
                this.battlepassSwiper = new Swiper('.battlepass-swiper', {
                    direction: 'horizontal',
                    rewind: true,
                    slidesPerView: 6,
                    slidesPerGroup: 6,
                    navigation: {
                        nextEl: '.battlepass-swiper-next',
                        prevEl: '.battlepass-swiper-prev',
                    },
                });
            });
        },
        SetupBattlepassMissionsSwiper() {

            if (this.battlepassMissionsSwiper) {
                this.battlepassMissionsSwiper.destroy()
            }
            Vue.nextTick(() => {
                this.battlepassMissionsSwiper = new Swiper('.battlepass-missions-swiper', {
                    direction: 'horizontal',
                    rewind: true,
                    slidesPerView: 4,
                    navigation: {
                        nextEl: '.battlepass-missions-swiper-next',
                        prevEl: '.battlepass-missions-swiper-prev',
                    },
                });
                for (let i = 0; i < this.battlepassMissions.missions.length; i++) {
                    let data = this.battlepassMissions.missions[i]
                    let progress = this.GetBattlepassMissionProgress(data.id)
                    if (this.battlepassMissionProgressbar[i]) {
                        this.battlepassMissionProgressbar[i].destroy()
                        this.battlepassMissionProgressbar[i] = null
                    }
                    this.battlepassMissionProgressbar[i] = new ProgressBar.Circle('.battlepass_mission_progress' + i, {
                        strokeWidth: 7,
                        easing: 'easeInOut',
                        duration: 1400,
                        color: '#FF3D00',
                        trailColor: '#00000033',
                        trailWidth: 7,
                        svgStyle: {
                            filter: 'drop-shadow(0px 1px 21px rgba(255, 61, 0, 0.24))',
                        }
                    });
                    let val = (progress / data.repeatAmount)
                    if (val > 1) {
                        val = 1
                    }
                    this.battlepassMissionProgressbar[i].animate(val.toFixed(2));  // Number from 0.0 to 1.0
                }

            });
        },
        SetupDailySwiper() {
            if (this.dailySwiper) {
                this.dailySwiper.destroy()
            }
            Vue.nextTick(() => {
                this.dailySwiper = new Swiper('.daily-swiper', {
                    direction: 'horizontal',
                    rewind: true,
                    slidesPerView: 5,
                    slidesPerGroup: 5,
                    navigation: {
                        nextEl: '.daily-swiper-next',
                        prevEl: '.daily-swiper-prev',
                    },
                });
                if (this.dailyAwardsDayCounter) {
                    let slideCount = Math.ceil(this.dailyAwardsDayCounter / 5)
                    for (let i = 0; i < slideCount - 1; i++) {
                        this.dailySwiper.slideNext()
                    }
                }
            })
        },

        SetMenuVisibility(val) {
            this.show = val

            if (!val) {
                this.chatMessage = ''
                this.ShowWelcomeMessage(true)
            } else {
                this.SetDate()
                if (this.currentPage == 'daily_awards') this.SetupDailySwiper()
                if (this.currentPage == 'battlepass') this.SetupBattlepassSwiper()
                if (this.currentPage == 'battlepass_missions') this.SetupBattlepassMissionsSwiper()

            }

        },
        SetResourceName(val) {
            this.resourceName = val
        },
        MoveOldMessageIndex(up) {
            if (up && this.oldMessages.length > this.oldMessagesIndex + 1) {
                this.oldMessagesIndex += 1;
                this.chatMessage = this.oldMessages[this.oldMessagesIndex];
            } else if (!up && this.oldMessagesIndex - 1 >= 0) {
                this.oldMessagesIndex -= 1;
                this.chatMessage = this.oldMessages[this.oldMessagesIndex];
            } else if (!up && this.oldMessagesIndex - 1 === -1) {
                this.oldMessagesIndex = -1;
                this.chatMessage = "";
            }
        },
        ClaimDailyItem(item, itemDay) {
            postData(`https://${this.resourceName}/claimDailyItem`, {
                item,
                itemDay: itemDay + 1
            })
            this.PlayClickSound()

        },
        GetDailyItemLabel(item) {
            if (item.type == 'money') {
                return '$' + item.amount
            }
            if (item.type == 'item' || item.type == 'weapon') {
                return item.amount + 'x ' + item.label
            }
            if (item.type == 'vehicle') {
                return '1x ' + item.label
            }
            if (item.type == 'box') {
                return '1x ' + item.label
            }

        },
        GetClaimedText(itemDay) {
            const dayCounter = this.dailyAwardsDayCounter
            const _itemDay = itemDay + 1
            let claimed = this.CheckClaimedDailyItem(_itemDay)
            if (claimed) {
                return this.locales["CLAIMED"]
            }
            if (!claimed && _itemDay < dayCounter) {
                return this.locales["EXPIRED"]
            }
            if (_itemDay == dayCounter) {
                return this.locales["CLICK_ITEM"]
            }
            return this.locales["DAY"] + ' ' + _itemDay
        },
        GetDailyItemBoxClass(itemDay) {
            const dayCounter = this.dailyAwardsDayCounter
            const _itemDay = itemDay + 1
            let claimed = this.CheckClaimedDailyItem(_itemDay)
            if (claimed && _itemDay == dayCounter - 1) {
                return 'daily_item_box_claimed_big'
            }

            if (!claimed && _itemDay == dayCounter - 1) {
                return 'daily_item_box_claimed_big'
            }

            if (!claimed && _itemDay < dayCounter) {
                return 'daily_item_box_claimed_small'
            }

            if (claimed && _itemDay < dayCounter) {
                return 'daily_item_box_claimed_small'
            }

            if (_itemDay == dayCounter) {
                return 'daily_item_box_current'
            }

            if (_itemDay == dayCounter + 1) {
                return 'daily_item_box_next_big'
            }

            return 'daily_item_box_next_small'

        },
        CheckClaimedDailyItem(day) {
            return this.dailyAwardData.claimedDays.find((data) => data == day) ? true : false
        },
        GetDailyItemImage(item) {
            if (item.type == 'vehicle') {
                return `./assets/car_images/${item.image}`
            } else {
                return `./assets/item_images/${item.image}`
            }
        },
        StartGameTimeCounter() {
            this.gameTimeInterval = setInterval(() => {
                this.gameTime += 1
            }, 1000)
        },
        SetTime() {

            setInterval(() => {
                const date = new Date();
                let Hour = date.getHours();
                let Minute = date.getMinutes();
                if (Hour < 10) {
                    Hour = "0" + Hour;
                }

                if (Minute < 10) {
                    Minute = "0" + Minute;
                }
                this.minute = Minute
                this.hour = Hour
            }, 1000)
        },
        SetDate() {
            const weekday = [
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday"
            ];
            const date = new Date();
            let day = date.getDate();
            var dayIndex = date.getDay();
            let month = date.getMonth() + 1;
            const year = date.getFullYear()
            if (day < 10) {
                day = '0' + day
            }
            if (month < 10) {
                month = '0' + month
            }
            this.month = month
            this.day = day
            this.year = year
            this.dayLabel = weekday[dayIndex]
        },
    },
    computed: {
        GetCurrentDayDailyItem() {
            if (this.dailyAwardsDayCounter) {
                return this.dailyAwardItems[this.dailyAwardsDayCounter - 1]
            }

        },
        GetTheme() {
            return this.theme
        },
        GetThemes() {
            return this.themes
        },
        GetMenuVisibility() {
            return this.show
        },
        formatGameTime() {
            var sec_num = parseInt(this.gameTime, 10); // don't forget the second param
            var hours = Math.floor(sec_num / 3600);
            var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
            var seconds = sec_num - (hours * 3600) - (minutes * 60);

            if (hours < 10) { hours = "0" + hours; }
            if (minutes < 10) { minutes = "0" + minutes; }
            if (seconds < 10) { seconds = "0" + seconds; }
            return hours + ':' + minutes + ':' + seconds;
        },
        getDate() {

            return this.day + '.' + this.month + '.' + this.year
        },
        getTime() {

            return this.hour + ":" + this.minute
        },
        BgOverlay() {
            if (this.show) {
                return `url(./assets/img/overlay.png), url(./assets/img/${this.isNight ? 'overlay_2' : 'overlay_2_dark'}.png)`
            } else {
                return ``
            }
        },

    },
    mounted() {
        OnNuiMessage()
        this.StartGameTimeCounter()
        this.SetTime()
        document.onkeydown = (evt) => {
            evt = evt || window.event;
            var isEscape = false;
            const el = document.querySelector('.nav_chat_input')
            if (document.body.contains(el)) {
                if (el === document.activeElement) {
                    if (evt.which === 38 || evt.which === 40) {
                        evt.preventDefault();
                        this.MoveOldMessageIndex(evt.which === 38);
                    }
                }
            }
            if ("key" in evt) {
                isEscape = (evt.key === "Escape" || evt.key === "Esc");
            } else {
                isEscape = (evt.keyCode === 27);
            }
            if (isEscape) {
                OnPressEsc(this.resourceName)
            }
        };
    }
})


