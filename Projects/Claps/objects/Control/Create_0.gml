global.gpClock = new iota_clock();
global.gpClock.set_update_frequency(60);

global.uiClock	= new iota_clock();
global.uiClock.set_update_frequency(60);

Manager = {
	Save		: instance_create_layer(x, y, layer, mgrSave),
	Input		: instance_create_layer(x, y, layer, mgrInput),
	Camera		: instance_create_layer(x, y, layer, mgrCamera),
	Room		: instance_create_layer(x, y, layer, mgrRoom),
	Particle	: instance_create_layer(x, y, layer, mgrParticle),
	Background	: instance_create_layer(x, y, layer, mgrBackground)
}

instance_create_layer(x, y, layer, objTest);
// Methods
gameEnd = function()
{
	log("-----------------------------------", "Game Ended");
	game_end();
}

gameRestart = function()
{
	log("-----------------------------------", "Game Restarted");
	game_restart();
}


