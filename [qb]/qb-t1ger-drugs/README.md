# T1GER DRUG OPERATIONS

### Contact
Author: T1GER#9080
Discord: https://discord.gg/FdHkq5q

### AUTH / SUPPORT
Join my discord, if not already joined - and open a ticket. Post screenshot of your order including order# and product(s).

### Dependencies:
- ProgressBars [https://gitlab.com/t1ger-scripts/t1ger-requirements] (otherwise, disable in Config.lua)
- K4MB1 Lab Shells Pack [https://cdn.discordapp.com/attachments/648602697175662682/891699420779933796/drugshells.rar] (SEE https://k4mb1.tebex.io/package/4672285)
- K4MB1 High End Labs [OPTIONAL] [NOT-INCLUDED] (SEE https://k4mb1.tebex.io/package/4698329) (Disable Config.K4MB1_Labs if not ensured this pack)

### Installation
1) Drag & drop the folder into your `resources` server folder.
2) Import or run `t1ger_drugs.sql` file into your database.
3) Configure config.lua to match & satisfy your needs/requirements.
4) Install & ensure the necesarry dependencies.
5) Add `start t1ger_drugs` to your server config.

### Showcase
- https://www.youtube.com/c/T1GER/videos

### Utils
There is a utils.lua file in client folder.
Kindly read carefully on the comments etc. before editing, otherwise use my discord for support.

### DRUG LAB SHELLS
By default my resource supports both of K4MB1's drug lab shell packs. 
However, only the old drug shell pack is included in the resource. 
To use the high end labs, you need to purchase them and set the Config.K4MB1_Labs accordingly.

### SHELL OFFSETS
Inside `Config.Offsets` you can set the offset coordinates for each shell type. Make sure you know what you are doing, otherwise do not touch.

### DRUG TYPES
Go to `Config.DrugTypes` and customize as you please.
These are the defined drugs on your server. For example ['weed'] doesnt meed the item name is weed, it's just the type for this drug is called weed.
Inside this you edit stuff like sellable item, draw texts and keys for labs, required items & amounts for proceesing and/or packaging etc.
Best practice to add new drug type is to basically copy one of the existing tables and edit the values, items etc. 
Make sure to add the corresponding type inside Config.Markers, Config.Blips, at type inside Config.DrugLabs, Config.Shells (and at whatever prop u want)

### DRUG JOBS 
Go to `Config.DrugJobs` and customize as you please.
- Everything for each option should be self-explanatory otherwise read the comments.
- Inside here u can also set item rewards

### DRUG SALE 
Go to `Config.DrugSale` and customize the settings to your needs.
Add sellable drug items inside `Config.DrugTypes`

### DRUG EFFECTS
Go to `Config.DrugEffects` and customize as you please.
Replace the default usable items with whatever item you want to.
Read the comments to know what each function does.

### CUSTOM NOTIFICATIONS
Go to utils.lua and find the event called: ['t1ger_drugs:notify']
Change or edit ESX.ShowNotification to whatever notification function you may have.
You only need to edit this one place, the rest my script wille handle, as it triggers the EVENT, then your function

### JOB PHONE NOTIFICATIONS
Go to utils.lua and find the event called: ['t1ger_drugs:job_notify']
Change or edit the event to be using your phone format/trigger events, otherwise disable it completely and receive normal notifications.

### INVENTORY ICONS 
Shoutout and thanks to Z1tronix#0001 for making these icons on short notice. You can use them as you please. 
Z1tronix's Discord: https://discord.gg/P3pSNJVu

