fx_version 'cerulean'
author 'ikova'
description 'new_banking remake'

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

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files {
	'client/html/UI.html',
    'client/html/style.css',
    'client/html/media/font/*.otf',
    'client/html/media/img/*.png',
    'locale.js',
}
