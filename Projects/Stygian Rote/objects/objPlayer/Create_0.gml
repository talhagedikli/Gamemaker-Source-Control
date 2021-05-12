 //animation
animation_init();

enum states {
	//PLAYER
	normal,
	crouch,
	dash,
	grab,
	climb,
	
	rock,
	
	dead,
	stop,
}

//state
state	= states.normal;

//speed variables
xSpeed			= 0;
ySpeed			= 0;
gSpeed			= 0.05;
spd				= 0;
dir				= 0;
enginePower		= 0;
maxEnginePower	= 5;


//accel, decel and max speed
aSpeed			= 0.2;
dSpeed			= 0.5;
hMaxSpeed		= 2.5;
vMaxSpeed		= 2.5;

//accels and decel variables
groundAccel		= 0.1;
groundDecel		= 0.1;

airAccel		= 0.1;
airDecel		= 0.075;

/* 
dashAccel		= 2;
dashDecel		= 2;
*/

doubleJump		= false;

grabCounter		= 0;
grabMax			= 50;
grabFallDown	= 20;

//Backpack
packPower		= 0;
packPowerAccel	= 0;
packPowerDecel	= 0;
packPowerMax	= 0.25;
gasMax			= 128;
gas				= gasMax;
gasRate			= gas/gasMax;













