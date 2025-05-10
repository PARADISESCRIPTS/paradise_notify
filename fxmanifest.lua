fx_version 'cerulean'
game 'gta5'

author 'Paradise'
description 'A modern notification system for FiveM'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'config.lua',
    'scripting/client.lua'
}

server_scripts {
    'scripting/server.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/notify.mp3'
} 