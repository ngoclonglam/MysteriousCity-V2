fx_version 'cerulean'
game 'gta5'

description 'QB-HouseRobbery'
version '1.0.0'

shared_scripts {
 '@qb-core/shared/locale.lua',
 'locales/vi.lua',
 'config.lua',
}
client_scripts {
    -- customized files
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/functions.lua',
    'client/events.lua',
    'client/peds.lua',
    -- qb-core original file
    'client/main.lua'
}
server_scripts {
    -- customized files
    'server/functions.lua',
    'server/events.lua',
    -- qb-core original file
    'server/main.lua'
}

dependencies {
 'qb-lockpick',
 'qb-skillbar'
}

lua54 'yes'
