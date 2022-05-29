log("-----------------------------------", "Game Started");
// Make sure i am created firs
if (instance_number(self.object_index) > 1)
{
	show("ERROR: MULTIPLE CONTROL OBJECT EXISTS");
	instance_destroy();
	exit;
}



cm			= instance_create_layer(x, y, layer, objManager, new Camera());
sl			= instance_create_layer(x, y, layer, objSaveManager);
in			= instance_create_layer(x, y, layer, objManager, new Input());
pt			= instance_create_layer(x, y, layer, objParticleManager);




//var i = 0 repeat(TweenType.Length-1)
//{
//	var ins = instance_create_layer(16, 16+i*16, layer, objTweener);
//	ins.type = i;
//	i++;
//}
instance_create_layer(x, y, layer, objPlayer, new TweenerGuy());


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