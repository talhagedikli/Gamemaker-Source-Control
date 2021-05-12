//player button inputs

#region//checking is on ground, if it is stop y move, if it isn't apply grav
//onGround and Onwall controls
onGround	= place_meeting(x, y + 1, objBlock);
onWall		= place_meeting(x + facing, y, objBlock);



#endregion


//animation speed

//switching states
switch (state) {
	case states.normal:
		player_state_normal();
		break;

}

//ySpeed = clamp(ySpeed, -vMaxSpeed, vMaxSpeed);
//xSpeed = clamp(xSpeed, -hMaxSpeed, hMaxSpeed);

//horizontal and vertical collisions
//check_collisions_pixel_perfect();









