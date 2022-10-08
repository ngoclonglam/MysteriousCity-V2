fx_version 'cerulean'
game 'gta5'

description 'Nearby Location'
version '1.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client.lua',
}

export "ShowNearestLocation"

lua54 'yes'