fx_version "cerulean"

game 'gta5'

server_script 'server/main.lua'

client_script 'client/main.lua'

files {
  'html/ui.html',
  'html/ui.css',
  'html/ui.js',
  'html/farming.png',
}

ui_page 'html/ui.html'

shared_script 'config.lua'

lua54 'yes'