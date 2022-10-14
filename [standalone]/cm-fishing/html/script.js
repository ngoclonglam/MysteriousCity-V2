let notifications = []
let audioPlayer = null;

function GenerateNotification(message, type, timeout) {
	let id = notifications.length + 1;
	let colors = {
		["succes"]: "#2abdc7",
		["error"]: "#d4423d",
		["info"]: "#FBD33F",
	}
	if (type == null) {
		type = "succes";
	}
	if (timeout == null) {
		timeout = 5000;
	}
	if (message == null) {
		message = "UNKOWN";
	}
	audioPlayer = new Audio("./codemnotify.ogg");
	audioPlayer.volume = 0.9;
	audioPlayer.play();
	let html = `
       <div style="transform: translateX(-165px)" class="notify" id="notify-${id}">

       <P class="notify-text">${message}</P>
       <div class="top-line"></div>
       <div class="notify-dots-${type}"></div>
     </div>
   `
	$('.notify-container').append(html)
	anime({
		targets: `#notify-${id}`,
		translateX: "-165",
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
		}, 150);
	}, timeout)
}

function clicksound() {

	audioPlayer = new Audio("./codemclick.ogg");
	audioPlayer.volume = 0.9;
	audioPlayer.play();
}




window.addEventListener("message", function (event) {
	var item = event.data;
	switch (item.type) {
		case "OPEN_MENU":
			app.showUI()
			app.getData(item)

			$("#test").css("width", "2rem !important")

			break;
		case "CLOSE_MENU":
			app.hideUI()
			break
		case "FISHING_STARTED":
			app.FishingStarted(true, item.text, item.time, item.updateProgressbar)
			break
		case "FISHING_STOPPED":
			app.FishingStarted(false)
			break
		case "MINIGAME_START":


			app.changehomepage('minigame')
			document.querySelector("body").style.display = "flex";

			StartGame();
			break;
		case "send_response":

			app.GetResponse(item.resourceName)

			break;
		case "SetLanguages":
			app.SetLanguage(item.value)

			break
		case "UseDiscord":
			app.setDiscord(item.value)
			break;
		case "useafkmode":
			app.setafkfarkm(item.value)
			break;

		default:

			break;
	}
});



















const app = new Vue({
	el: "#app",

	data: {
		show: false,
		homepage: 'main',
		page: 'main',
		selectedButton: 'main',
		selectedButtonMain: 'main',
		fishdata: '',
		search: '',
		searchplayer: '',
		playertable: '',
		searchmarketplayer: '',
		marketbasket: [],
		baskettotalprice: 0,
		playertotalprice: 0,
		playeritems: [],
		spots: [],
		spotsSwiper: false,
		showPrevSwiperButton: false,
		showNextSwiperButton: true,
		achievementsSwiper: false,
		showMarket: false,
		nearSpot: {},
		progressBar: null,
		fishingStarted: false,
		fishingProgressText: '',
		playercustomimage: '',
		playerdiscordimage: '',
		playeraccount: '',
		achievenmentsdata: '',
		playerlevel: 0,
		playerxp: 0,
		rewards: '',
		rewardsTable: [],
		counter: false,
		resourceName: '',
		language: '',
		maxxp: 0,
		usediscord: false,
		useafkfarm: false
	},
	methods: {
		setafkfarkm(val) {
			this.useafkfarm = val;
		},
		setDiscord(val) {
			this.usediscord = val;
		},
		SetLanguage(val) {
			this.language = val

		},
		GetResponse(resourceName) {
			this.resourceName = resourceName
			$.post(`https://${this.resourceName}/GetResponse`, JSON.stringify({}));

		},

		FishingStarted(val, text, time, updateProgressbar) {
			this.fishingStarted = val
			if (this.fishingStarted) {
				Vue.nextTick(() => {
					this.fishingProgressText = text
					if (updateProgressbar) {
						this.SetProgressBar(time)
					}
				})
			}
		},
		SetProgressBar(time) {
			if (this.progressBar) {
				this.progressBar.destroy()
				this.progressBar = null
			}
			this.progressBar = new ProgressBar.Circle('.fish-progressbar', {
				strokeWidth: 8,
				easing: 'easeInOut',
				duration: time,
				color: '#01D3E0',
				trailColor: '#01d3e014',
				trailWidth: 8,

			});
			this.progressBar.animate(1.0); // Number from 0.0 to 1.0
		},
		changehomepage(val) {
			this.homepage = val
		},
		MarkLocation(coords) {
			$.post(`https://${this.resourceName}/MarkLocation`, JSON.stringify({
				coords
			}));

		},
		showUI() {
			this.show = true
		},
		hideUI() {
			this.show = false
			$.post(`https://${this.resourceName}/close`);

			this.newPage('main')
		},
		StartFishing() {
			$.post(`https://${this.resourceName}/StartFishing`);

		},

		afkmodestart() {

			$.post(`https://${this.resourceName}/StartAFKFishing`);
		},
		setupAchievementsSwiper() {
			if (this.achievementsSwiper) {
				this.achievementsSwiper.destroy()
			}
			Vue.nextTick(() => {
				this.achievementsSwiper = new Swiper('.achievements-swiper-container', {
					direction: 'horizontal',
					rewind: true,

					slidesPerView: 4,
					slidesPerGroup: 4,
					navigation: {
						nextEl: '.achievements-swiper-next',
						prevEl: '.achievements-swiper-prev',
					},
					pagination: {
						el: '.swiper-pagination',
						type: 'bullets',
					},
				});
			})

		},
		setupSpotsSwiper() {
			if (this.spotsSwiper) {
				this.spotsSwiper.destroy()
			}
			Vue.nextTick(() => {
				this.spotsSwiper = new Swiper('.spots-swiper-container', {
					direction: 'horizontal',
					rewind: true,

					slidesPerView: 3,
					slidesPerGroup: 3,
					navigation: {
						nextEl: '.swiper-next',
						prevEl: '.swiper-prev',
					},
				});
			})
			setTimeout(() => {
				this.spotsSwiper.on('slideChange', () => {
					const isEnd = this.spotsSwiper.isEnd
					if (isEnd) {
						this.showPrevSwiperButton = true
						this.showNextSwiperButton = false
					} else {
						this.showPrevSwiperButton = false
						this.showNextSwiperButton = true
					}
				});

			}, 600)
		},
		newPage(val) {
			this.playertotalprice = 0
			if (val == this.page) {
				return
			}
			if (val != 'spots') {

				if (this.spotsSwiper) {
					this.spotsSwiper.destroy()
				}

			}
			if (val != 'profile') {
				if (this.achievementsSwiper) {
					this.achievementsSwiper.destroy()
				}
			}
			clicksound();
			if (val == 'wikicommon') {

			} else if (val == 'main') {
				this.homepage = 'main'
				this.selectedButtonMain = ''
			} else if (val == 'wikiuncommon') {

			} else if (val == 'wikirare') {

			} else if (val == 'wikilegendary') {


			} else if (val == 'profile') {
				this.selectedButtonMain = 'main'

			} else if (val == 'wikiepic') {

			} else if (val == 'wikiall') {

			} else if (val == 'wiki') {
				this.page = 'wikicommon'
				this.selectedButtonMain = 'wiki';

			} else if (val == 'board') {
				this.selectedButtonMain = 'board';
				$.post(`https://${this.resourceName}/action`, JSON.stringify({
					action: 'board'
				}), (data) => {
					this.playertable = data
				});
			} else if (val == 'market') {
				this.selectedButtonMain = 'market';
			} else if (val == 'spots') {
				this.selectedButtonMain = 'spots';
			} else if (val == 'basketpage') {
				// this.marketbasket.forEach(element => {
				//   this.baskettotalprice = parseInt(element.itemprice) + this.baskettotalprice
				// });
			} else if (val == 'itemsellpage') {
				let deafultprice =
					$.post(`https://${this.resourceName}/action`, JSON.stringify({
						action: 'sellitem'
					}), (data) => {


						this.playeritems = data
						this.playeritems.forEach(element => {

							this.playertotalprice = parseInt(element.itemprice * element.itemcount) + this.playertotalprice

						});

					});

			}


			this.page = val;
			this.selectedButton = val;

			if (val == 'spots') {
				this.setupSpotsSwiper()
			} else if (val == 'profile') {
				this.setupAchievementsSwiper()
			}
			this.search = ''

		},
		getData(data) {

			this.fishdata = data.fishdata

			this.fishdata = data.fish
			this.spots = data.spots
			this.showMarket = data.showMarket
			this.nearSpot = data.nearSpot
			this.playeraccount = data.playeraccount
			this.achievenmentsdata = data.achievenments
			this.playerlevel = this.playeraccount[0].level
			this.playerxp = this.playeraccount[0].xp
			this.maxxp = data.getxp

			this.rewards = data.rewards
			this.rewardsTable = []

			this.achievenmentsdata.forEach(element => {
				this.rewards.forEach(element2 => {
					this.rewardsTable.push({

						level: element.Achievenmentlvl,
						gorevdurumu: element2[element.Achievenmentlvl],
						odul: element.Achievenmentmoney,
					})


				});
			});

			if (this.showMarket) {
				this.newPage('market')
			}
			this.counter = false

		},
		addtocard(item, category, price, label, stars) {
			clicksound();
			this.marketbasket.push({
				itemname: item,
				itemcategory: category,
				itemprice: price,
				itemlabel: label,
				itemstars: stars
			});


			GenerateNotification(`${this.language["ADDBASKET"]}`, 'error', 2500)
			this.baskettotalprice = this.baskettotalprice + price

		},
		deletetocard(val, price) {
			clicksound();
			GenerateNotification(`${this.language["REMOVEDBASKET"]}`, 'error', 2500)
			this.marketbasket.splice(val, 1)
			this.baskettotalprice = this.baskettotalprice - price
		},

		deletetocardplayeritem(val, count, price) {
			clicksound();
			GenerateNotification(`${this.language["REMOVEDBASKET"]}`, 'error', 2500)
			this.playeritems.splice(val, 1)
			let total = count * price
			this.playertotalprice = this.playertotalprice - total
		},
		buyitem(val) {
			if (val == 'cash') {
				$.post(`https://${this.resourceName}/action`, JSON.stringify({
					action: 'cashbuyitem',
					items: this.marketbasket,
					totalprice: this.baskettotalprice
				}), (data) => {
					if (data) {
						this.marketbasket = []
						this.baskettotalprice = 0
						GenerateNotification(`${this.language["PURCHASED"]}`, 'error', 2500)
					} else {
						GenerateNotification(`${this.language["ENOUGHMONEY"]}`, 'error', 2500)
					}
				});
			} else {
				$.post(`https://${this.resourceName}/action`, JSON.stringify({
					action: 'bankbuyitem',
					items: this.marketbasket,
					totalprice: this.baskettotalprice
				}), (data) => {
					if (data) {
						this.marketbasket = []
						this.baskettotalprice = 0
						GenerateNotification(`${this.language["PURCHASED"]}`, 'error', 2500)
					} else {
						GenerateNotification(`${this.language["ENOUGHMONEY"]}`, 'error', 2500)
					}
				});
			}

		},
		reward(odul, level) {
			this.counter = true
			GenerateNotification(`${this.language["AWARDS"]}`, 'error', 2500)
			$.post(`https://${this.resourceName}/action`, JSON.stringify({
				action: 'reward',
				val: odul,
				val2: level
			}));

		},
		playersellitem() {
			$.post(`https://${this.resourceName}/action`, JSON.stringify({
				action: 'sellitems',
				items: this.playeritems,
				totalprice: this.playertotalprice
			}));
			this.playertotalprice = 0
			this.playeritems = []
			GenerateNotification(`${this.language["PURCHASED"]}`, 'error', 2500)
		},
		discordimage() {
			clicksound()
			$.post(`https://${this.resourceName}/action`, JSON.stringify({
				action: 'discord'
			}), (data) => {
				this.playeraccount = data
				GenerateNotification(`${this.language["PHOTO"]}`, 'error', 2500)
			});
		},
		resetPhoto() {
			clicksound()
			$.post(`https://${this.resourceName}/action`, JSON.stringify({
				action: 'resetphoto'
			}), (data) => {
				this.playeraccount = data

				GenerateNotification(`${this.language["PHOTO"]}`, 'error', 2500)
			});
		},
		changecustomimage() {
			$.post(`https://${this.resourceName}/action`, JSON.stringify({
				action: 'customimage',
				image: this.playercustomimage
			}), (data) => {
				this.playeraccount = data
				this.playercustomimage = ''
				GenerateNotification(`${this.language["PHOTO"]}`, 'error', 2500)
			});
		}


	},
	mounted() {
		this.SetProgressBar(.6)
		document.onkeydown = (evt) => {
			evt = evt || window.event;
			var isEscape = false;
			if ("key" in evt) {
				isEscape = (evt.key === "Escape" || evt.key === "Esc");
			} else {
				isEscape = (evt.keyCode === 27);
			}
			if (isEscape) {
				this.hideUI()
			}
		};
	},
	computed: {
		filterByTerm() {

			if (this.search.length > 0) {
				return this.fishdata.filter((fish) => {
					return fish.itemname.toLowerCase().includes(this.search.toLowerCase())
				})
			} else {
				return this.fishdata
			}

		},
		filterByMarket() {
			if (this.search.length > 0) {
				return this.fishdata.filter((fish) => {
					return fish.itemname.toLowerCase().includes(this.search.toLowerCase())
				})
			} else {
				return this.fishdata
			}

		},
		filterPlayer() {
			if (this.searchplayer.length > 0) {
				return this.playertable.filter((player) => {

					return player.playername.toLowerCase().includes(this.searchplayer.toLowerCase())
				})
			} else {
				return this.playertable
			}

		},
		playerxpwidth() {

			return {
				'width': `${this.playerxp}%`,
			}


		},



	},


})





// ----
// Game
// ----
let messageListener = null;

function StartGame() {
	if (messageListener) {
		window.removeEventListener(messageListener, "message");
	}
	(function () {
		let gameOver = false;

		// --------------
		// Animation loop
		// --------------
		function StartTimer() {
			let seconds = 15;
			const interval = setInterval(() => {
				seconds -= 1;
				if (seconds === 0) {
					clearInterval(interval);
					$.post(
						`https://${this.resourceName}/minigamecompleted`,
						JSON.stringify({
							success: false,
						})
					);

					resetGame();
				}
			}, 1000);
		}

		StartTimer();

		function animationLoop() {
			if (!gameOver) {
				indicator.updatePosition();
				indicator.detectCollision();
				progressBar.updateUi();
				progressBar.detectGameEnd();
				fish.updateFishPosition();
				requestAnimationFrame(animationLoop);
			}
		}

		// ---------
		// Indicator
		// ---------

		class Indicator {
			constructor() {
				this.indicator = document.querySelector(".indicator");
				this.height = this.indicator.clientHeight;
				this.y = 0;
				this.velocity = 0;
				this.acceleration = 0;
				this.topBounds = gameBody.clientHeight * -1 + 48;
				this.bottomBounds = 0;
			}

			applyForce(force) {
				this.acceleration += force;
			}

			updatePosition() {
				this.velocity += this.acceleration;
				this.y += this.velocity;

				//  Reset acceleration
				indicator.acceleration = 0;

				// Change direction when hitting the bottom + add friction
				if (this.y > this.bottomBounds) {
					this.y = 0;
					this.velocity *= 0.1;
					this.velocity *= -1;
				}

				// Prevent from going beyond the top
				// Don't apply button forces when beyond the top

				if (indicator.y < this.topBounds) {
					indicator.y = this.topBounds;
					indicator.velocity = 0;
				} else {
					if (keyPressed) {
						indicator.applyForce(-0.13);
					}
				}

				// Apply constant force
				indicator.applyForce(0.1);

				// Update object position
				this.indicator.style.transform = `translateY(${this.y}px)`;
			}

			detectCollision() {
				if (
					(fish.y < this.y && fish.y > this.y - this.height) ||
					(fish.y - fish.height < this.y &&
						fish.y - fish.height > this.y - this.height)
				) {
					progressBar.fill();
					document.body.classList.add("collision");
				} else {
					progressBar.drain();
					document.body.classList.remove("collision");
				}
			}
		}

		// ----
		// Fish
		// ----

		class Fish {
			constructor() {
				this.fish = document.querySelector(".fish");
				this.height = this.fish.clientHeight;
				this.y = -125;
				this.direction = null;
				this.randomPosition = null;
				this.randomCountdown = null;
				this.speed = 0.4;
			}

			resetPosition() {
				this.y = -125;
			}

			updateFishPosition() {
				if (!this.randomPosition || this.randomCountdown < 0) {
					this.randomPosition =
						Math.ceil(Math.random() * (gameBody.clientHeight - this.height)) *
						-1;
					this.randomCountdown = Math.abs(this.y - this.randomPosition);
					this.speed = 0.4;
				}

				if (this.randomPosition < this.y) {
					this.y -= this.speed;
				} else {
					this.y += this.speed;
				}

				this.fish.style.transform = `translateY(${this.y}px)`;
				this.randomCountdown -= this.speed;
			}
		}

		// ------------
		// Progress bar
		// ------------

		class ProgressBar {
			constructor() {
				this.wrapper = document.querySelector(".progress-bar");
				this.progressBar = this.wrapper.querySelector(
					".progress-gradient-wrapper"
				);
				this.progress = 50;
			}

			reset() {
				this.progress = 50;
			}

			drain() {
				if (this.progress > 0) this.progress -= 0.4;
				if (this.progress < 1) this.progress = 0;
			}

			fill() {
				if (this.progress < 100) this.progress += 0.3;
			}

			detectGameEnd() {
				if (this.progress >= 100) {
					gameOver = true;
					$.post(
						`https://${this.resourceName}/minigamecompleted`,
						JSON.stringify({
							success: true,
						})
					);
					resetGame();
				}
			}

			updateUi() {
				this.progressBar.style.height = `${this.progress}%`;
			}
		}

		// -----------
		// Application
		// -----------

		const gameBody = document.querySelector(".game-body");
		let keyPressed = false;
		const indicator = new Indicator();
		const progressBar = new ProgressBar();
		const fish = new Fish();

		// ------------
		// Mouse events
		// ------------
		let events = {};
		events["mousedown"] = window.addEventListener("mousedown", indicatorActive);
		events["mouseup"] = window.addEventListener("mouseup", indicatorInactive);
		events["keydown"] = window.addEventListener("keydown", indicatorActive);
		events["keyup"] = window.addEventListener("keyup", indicatorInactive);
		events["touchstart"] = window.addEventListener(
			"touchstart",
			indicatorActive
		);
		events["touchend"] = window.addEventListener("touchend", indicatorInactive);

		messageListener = window.addEventListener("message", function (event) {
			let data = event.data;
			switch (data.type) {
				case "keydown":

					indicatorActive();
					break;
				case "keyup":
					indicatorInactive();
					break;
				case "hide":
					resetGame();
					break;
				default:
					break;
			}
		});

		function indicatorActive() {
			if (!keyPressed) {
				keyPressed = true;
				document.body.classList.add("indicator-active");
			}
		}

		function indicatorInactive() {
			if (keyPressed) {
				keyPressed = false;
				document.body.classList.remove("indicator-active");
			}
		}

		// ----------
		// Reset game
		// ----------

		const niceCatch = document.querySelector(".nice-catch");
		const perfect = document.querySelector(".perfect");
		const successButton = document.querySelector(".success");
		const game = document.querySelector(".game");
		events["click"] = successButton.addEventListener("click", resetGame);
		game.style.display = 'flex'

		function resetGame() {
			progressBar.reset();
			fish.resetPosition();
			game.style.display = 'none'

			successButton.removeAttribute("style");
			niceCatch.removeAttribute("style");
			perfect.removeAttribute("style");
			game.removeAttribute("style");
			gameOver = false;
			for (key in events) {
				window.removeEventListener(key, events[key]);
			}
			events = {};
			//animationLoop();
		}

		// ----------------
		// Success timeline
		// ----------------

		// -------------
		// Initiate loop
		// -------------

		animationLoop();
	})();

	// -------
	// Seaweed
	// -------

	(function () {
		let seaweed = [];
		const canvas = document.querySelector('[data-element="seaweed"]');
		canvas.width = canvas.clientWidth * 2;
		canvas.height = canvas.clientHeight * 2;
		const context = canvas.getContext("2d");

		function animationLoop() {
			clearCanvas();
			seaweed.forEach((seaweed) => seaweed.draw());

			requestAnimationFrame(animationLoop);
		}

		function clearCanvas() {
			context.clearRect(0, 0, canvas.width, canvas.height);
		}

		class Seaweed {
			constructor(segments, spread, xoff) {
				this.segments = segments;
				this.segmentSpread = spread;
				this.x = 0;
				this.xoff = xoff;
				this.y = 0;
				this.radius = 1;
				this.sin = Math.random() * 10;
			}

			draw() {
				context.beginPath();
				context.strokeStyle = "#143e5a";
				context.fillStyle = "#143e5a";
				context.lineWidth = 2;
				for (let i = this.segments; i >= 0; i--) {
					if (i === this.segments) {
						context.moveTo(
							(Math.sin(this.sin + i) * i) / 2.5 + this.xoff,
							canvas.height + -i * this.segmentSpread
						);
					} else {
						context.lineTo(
							(Math.sin(this.sin + i) * i) / 2.5 + this.xoff,
							canvas.height + -i * this.segmentSpread
						);
					}
					// context.arc(Math.sin(this.sin + i) * 10 + 30, this.y + (this.segmentSpread * i), this.radius, 0, 2*Math.PI);
				}
				context.stroke();

				this.sin += 0.05;
			}
		}

		seaweed.push(new Seaweed(6, 8, 25));
		seaweed.push(new Seaweed(8, 10, 35));
		seaweed.push(new Seaweed(4, 8, 45));

		animationLoop();
	})();

	// -----------------
	// Reel line tension
	// -----------------

	(function () {
		let line = null;
		const canvas = document.querySelector('[data-element="reel-line-tension"]');
		canvas.width = canvas.clientWidth * 2;
		canvas.height = canvas.clientHeight * 2;
		const context = canvas.getContext("2d");

		function animationLoop() {
			clearCanvas();
			line.draw();
			line.animate();

			requestAnimationFrame(animationLoop);
		}

		function clearCanvas() {
			context.clearRect(0, 0, canvas.width, canvas.height);
		}

		class Line {
			constructor() {
				this.tension = 0;
				this.tensionDirection = "right";
			}

			draw() {
				context.beginPath();
				context.strokeStyle = "#18343d";
				context.lineWidth = 1.3;
				context.moveTo(canvas.width, 0);
				context.bezierCurveTo(
					canvas.width,
					canvas.height / 2 + this.tension,
					canvas.width / 2,
					canvas.height + this.tension,
					0,
					canvas.height
				);
				context.stroke();
			}

			animate() {
				if (document.body.classList.contains("collision")) {
					if (this.tension > -30) this.tension -= 8;
				} else {
					if (this.tension < 0) this.tension += 4;
				}
			}
		}

		line = new Line();
		animationLoop();
	})();

	// -------
	// Bubbles
	// -------

	(function () {
		let bubbles = {};
		let bubblesCreated = 0;
		const canvas = document.querySelector('[data-element="bubbles"]');
		canvas.width = canvas.clientWidth * 2;
		canvas.height = canvas.clientHeight * 2;
		const context = canvas.getContext("2d");

		function animationLoop() {
			clearCanvas();
			Object.keys(bubbles).forEach((bubble) => bubbles[bubble].draw());

			requestAnimationFrame(animationLoop);
		}

		function clearCanvas() {
			context.clearRect(0, 0, canvas.width, canvas.height);
		}

		class Bubble {
			constructor() {
				this.index = Object.keys(bubbles).length;
				this.radius = Math.random() * (6 - 2) + 2;
				this.y = canvas.height + this.radius;
				this.x = canvas.width * Math.random() - this.radius;
				this.sin = this.style > 0.5 ? 0 : 5;
				this.style = Math.random();
				this.childAdded = false;
				this.speed = 1;
				this.sway = Math.random() * (0.03 - 0.01) + 0.01;
				this.swayDistance =
					Math.random() * (canvas.width - canvas.width / 2) + canvas.width / 2;
			}

			draw() {
				context.beginPath();
				context.strokeStyle = "#abe2f9";
				context.lineWidth = 2;
				context.arc(
					this.x + this.radius,
					this.y + this.radius,
					this.radius,
					0,
					2 * Math.PI
				);
				context.stroke();
				this.x =
					Math.sin(this.sin) * this.swayDistance +
					this.swayDistance -
					this.radius;
				this.sin += this.sway;
				this.y -= this.speed;

				if (this.y + this.radius < 0) {
					delete bubbles[this.index];
				}

				if (this.y < canvas.height * 0.6) {
					if (!this.childAdded) {
						bubbles[bubblesCreated] = new Bubble();
						bubblesCreated++;
						this.childAdded = true;
					}
				}
			}
		}

		bubbles[bubblesCreated] = new Bubble();
		bubblesCreated++;
	})();
}