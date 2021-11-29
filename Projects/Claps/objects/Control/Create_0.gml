// Make sure i am created first
if (instance_number(object_index) > 1)
{
  instance_destroy();
  exit;
}
log("-----------------------------------", "Game Started");

global.gpClock = new iota_clock();
global.gpClock.set_update_frequency(60);

global.uiClock	= new iota_clock();
global.uiClock.set_update_frequency(60);

Manager = 
{
	Save		: instance_create_layer(x, y, layer, objSaveManager),
	Input		: instance_create_layer(x, y, layer, objInputManager),
	Camera		: instance_create_layer(x, y, layer, objCamera),
	Room		: instance_create_layer(x, y, layer, objRoomManager),
	Part		: instance_create_layer(x, y, layer, objParticleManager),
	Background	: instance_create_layer(x, y, layer, objBackgroundManager)
}
// Methods
GameEnd = function()
{
	log("-----------------------------------", "Game Ended");
	game_end();
}

GameRestart = function()
{
	log("-----------------------------------", "Game Restarted");
	game_restart();
}








