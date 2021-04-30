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

//light
myLight = noone;

////Outline vars
//uniPixelW		= shader_get_uniform(shOutline, "pixelW");
//uniPixelH		= shader_get_uniform(shOutline, "pixelH");
//texelW			= texture_get_texel_width(sprite_get_texture(sprite_index, 0));
//texelH			= texture_get_texel_height(sprite_get_texture(sprite_index, 0));
//sLights			= shader_get_sampler_index(shOutline, "lights");//simpler2D exp

//tLight			= undefined;
//oLight			= noone;
//pLight			= undefined;
















