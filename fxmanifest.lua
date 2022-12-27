fx_version 'cerulean'
game 'gta5'

name 'Serrulata-Studios'
author 'Gale#4864'
description 'Savable Harness'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    'shared/config.lua'
}

client_scripts {   
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
    'client/target.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

dependencies {
     'ps-ui'
}

lua54 'yes'