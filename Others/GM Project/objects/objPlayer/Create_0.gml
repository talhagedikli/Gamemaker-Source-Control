 //animation
animation_init();

//state
currentState	= states.normal;

//speed variables
xSpeed			= 0;
ySpeed			= 0;
gSpeed			= 0.25;

jPower			= -5;
jumps			= 0;
jumpsMax		= 2;

wallJumpX		= 3;
wallJumpY		= -5;

xDashPower		= 6;
yDashPower		= -5;
dashX			= 0;
dashY			= 0;

//accel, decel and max speed
aSpeed			= 0.2;
dSpeed			= 0.5;
mSpeed			= 3;

//accels and decel variables
groundAccel		= 0.3;
groundDecel		= 0.5;

airAccel		= 0.2;
airDecel		= 0.15;

/* 
dashAccel		= 2;
dashDecel		= 2;
*/

//counters and buffers
dashCounter		= 0;
dashCounterMax	= 10;

dashportCounter	= 0;
dashportMax		= 150;

bufferCounter	= 0;
bufferMax		= 8;

coyoteCounter	= 0;
coyoteMax		= 6;

grabCounter		= 0;
grabMax			= 50;
grabFallDown	= 20;



//control point variables
landed			= false;		//edited

onGround		= false;
onWall			= false;

canJump			= false;
//canGrab			= false;
canClimb		= false;
canDash			= false;
canDashport		= true;

isDashing		= false;
//isClimbing		= false;

//create a bird to test it
if (!instance_exists(objBird))
{
	var _x = global.xSpawnTarget - global.spawnFacing*sprite_width;
	var _y = global.ySpawnTarget - sprite_height;
	instance_create_layer(_x, _y, "effects", objBird);
}








