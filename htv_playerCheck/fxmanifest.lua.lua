fx_version 'cerulean'

game 'gta5'

author 'HTV Development'

name 'htv_playerCheck'

version '1.0.0'

description 'HTV Playercheck'

client_scripts{
    'client/client.lua'
}

server_script{
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}

shared_script {
    '@es_extended/imports.lua',
    'config.lua'
}
