fx_version 'cerulean'
author 'ikova'
description 'new_banking Remake'
version '2.1.0'

ui_page('client/html/UI.html') --THIS IS IMPORTANT


shared_scripts {
	'config.lua',
	'locale.lua',
	'locales/*.lua',
}

server_scripts {  
	'server.lua'
}


client_scripts {
	'client/client.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

export 'openUI'

files {
	'client/html/*.*',
    'client/html/media/font/*.otf',
    'client/html/media/img/*.png',
    'locale.js',
}
