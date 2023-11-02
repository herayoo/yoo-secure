fx_version 'bodacious'
game 'gta5'


client_scripts {
	"client/*",
}

server_scripts {
	"config.lua",
	"server/secure.lua"
}

exports {'GetSecureStatus'}