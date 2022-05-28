log("-----------------------------------", "Game Started");
// Make sure i am created firs
if (instance_number(self.object_index) > 1)
{
	show("ERROR: MULTIPLE CONTROL OBJECT EXISTS");
	instance_destroy();
	exit;
}

cm			= instance_create_layer(x, y, layer, objCamera);
sl			= instance_create_layer(x, y, layer, objSaveManager);
in			= instance_create_layer(x, y, layer, objInputManager);
pt			= instance_create_layer(x, y, layer, objParticleManager);
lwo			= instance_create_layer(x, y, layer, objLwoManager);


// Methods
function GameEnd()
{
	log("-----------------------------------", "Game Ended");
	game_end();
}

function GameRestart()
{
	log("-----------------------------------", "Game Restarted");
	game_restart();
}
	

//var a = instance_create_layer(x, y, layer, objBlock) {
//	a.x = 0;
//	a.y = 0;
//}




//var t = time_source_create(time_source_global, 1, time_source_units_frames, function()
//{
//	here;	
//}, -1, time_source_expire_after);

//time_source_start(t);





