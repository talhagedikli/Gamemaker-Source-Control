/// @description room change
if (position_meeting(objPlayer.x, objPlayer.y, id) and instance_exists(objPlayer))
{
	show("you win");
	game_restart();
}

