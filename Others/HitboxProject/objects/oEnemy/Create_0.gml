//animation 
animation_init();

//states
currentState = 0;

//movement
gSpeed = 0.25;
onGround = false;
xCounter = 0;
yCounter = 0;

xSpeed = 0;
ySpeed = 0;

aSpeed = 0.2;
dSpeed = 0.5;
mSpeed = 2;

jPower = -4;

airAccel = 0.1;
groundAccel = 0.2;
airDecel = 0;
groundDecel = 0.5;

landed = true;

hit = false;

//hurtbox
hurtbox = hurtbox_create(18,24,-9,-24);

hitStun = 0;
hitBy = -1;

