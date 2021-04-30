//player button inputs
player_buttons_init();

#region//checking is on ground, if it is stop y move, if it isn't apply grav
//onGround and Onwall controls
onGround	= check_below(objGround);
onWall		= place_meeting(x+facing, y, objGround);

//applying gSpeed
if (onGround == false)
{
	ySpeed += gSpeed;
}
#endregion


//animation speed
frame += frameSpeed;

//switching states
switch (currentState) 
{
	case states.normal:
		player_state_normal();
		break;
	
	case states.crouch:
		player_state_crouch();
		break;
	
	case states.dash:
		player_state_dash();
		break;
	
	case states.grab:
		player_state_grab();
		break;
		
	case states.dead:
		player_state_dead();
		break;
		
	case states.stop:
		player_state_stop();
		break;

}

//tracking position
xPos = x;
yPos = y;

//horizontal and vertical collisions
//önceden position tracking in üstündeydi 
check_collisions();

//animation control
player_animation_control();

//frame reset to first frame(0)
frame_reset();

//applying xSpeed and ySpeed		EDITED - its in the check_collisions script
//x += xSpeed;
//y += ySpeed;



