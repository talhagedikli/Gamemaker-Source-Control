log("-----------------------------------", "Game Started");
// Make sure i am created firs
if (instance_number(self.object_index) > 1)
{
	show("ERROR: MULTIPLE CONTROL OBJECT EXISTS");
	instance_destroy();
	exit;
}


cm			= instance_create_layer(x, y, layer, objCamera);
lc			= instance_create_layer(x, y, layer, objLightController);
sl			= instance_create_layer(x, y, layer, objSaveManager);
pt			= instance_create_layer(x, y, layer, objParticle);

mouse		= instance_create_layer(x, y, layer, objMouse);

//var i = 0 repeat(TweenType.Length-1)
//{
//	var ins = instance_create_layer(16, 16+i*16, layer, objTweener);
//	ins.type = i;
//	i++;
//}
//instance_create_depth(x, y, depth-999, objEquipment, new MouseGuy());



//instance_create_depth(63, 22, depth, objPlayer, new TweenerGuy());
//instance_create_depth(63, 24, depth, objPlayer, new TweenerGuy());
//instance_create_depth(63, 29, depth, objPlayer, new TweenerGuy());
//instance_create_depth(63, 29, depth-1, objEquipment, new LilCircle());
//instance_create_depth(63, 29, depth-1, objEquipment, new LilCircle());
//instance_create_depth(63, 29, depth-1, objEquipment, new LilCircle());



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