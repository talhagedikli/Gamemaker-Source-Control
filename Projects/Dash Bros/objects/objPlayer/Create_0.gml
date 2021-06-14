//animation
animation_init();
//speed variables
xSpeed = 0;
ySpeed = 0;
gSpeed = 0.06;
facing = 1;
maxSpeed = 6;
pDirection = new Dir();
pDirection.find(InputManager.horizontalInput, InputManager.verticalInput);
actualDir = pDirection.angle;
spd	= 0;


//accel, decel and max speed
aSpeed = 0.2;
dSpeed = 0.5;
hMaxSpeed = 2.5;
vMaxSpeed = 2.5;
clampSpeed = function(_horizontal = hMaxSpeed, _vertical = vMaxSpeed)
{
	ySpeed = clamp(ySpeed, -_vertical, _vertical);
	xSpeed = clamp(xSpeed, -_horizontal, _horizontal);
}

groundAccel = 0.1;
groundDecel = 0.075;
airAccel = 0.1;
airDecel = 0.075;
crouchDecel = 0.075;

// Dash
dashDir = new Dir();
ghostDashTimer = new Timer();
dashPower = 8;
dashDur = 0.25 * 60;
dashTween = new Tween(tweenType.QUARTEASEOUT);
isDashing = false;

// Jump 
jPower = -2;
jumps = 0;
jumpsMax = 1;
bufferCounter = 0;
bufferMax = 8;
coyoteCounter = 0;
coyoteMax = 6;
doubleJump = false;
landed = false;
canJump = false;

//control point variables
onGround		= false;
onWall			= false;
onCeiling		= false;
isTouching		= false;

checkCollisions = function()
{
	onGround	= place_meeting(x, y + 1, objBlock);
	onWall		= place_meeting(x - sign(xSpeed), y, objBlock);
	onCeiling	= place_meeting(x, y - 1, objBlock);
}

checkTouching = function()
{
	if place_meeting(x + sign(xSpeed), y, objBlock) 
	{
		return true;
	}
	if place_meeting(x, y + sign(ySpeed), objBlock) 
	{
		return true;
	}
	return false;
}

// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
state = new SnowState("normal");

state.history_enable()
state.set_history_max_size(15)
state.event_set_default_function("init", function()
{
	// Init code here
})
	
state.add("normal", { // ---------- Normal State
	enter: function() 
	{
		// Code
	},
	step: function()
	{
		#region Movement phase
		if (abs(InputManager.horizontalInput) or abs(InputManager.verticalInput))
		{
			spd = approach(spd, maxSpeed, 0.1);
			pDirection.find(InputManager.horizontalInput, InputManager.verticalInput);
			xSpeed = approach(xSpeed, lengthdir_x(maxSpeed, pDirection.angle), 0.3);
			ySpeed = approach(ySpeed, lengthdir_y(maxSpeed, pDirection.angle), 0.3);	
		}
		else
		{
			xSpeed = approach(xSpeed, lengthdir_x(maxSpeed/2, pDirection.angle), 0.1);
			ySpeed = approach(ySpeed, lengthdir_y(maxSpeed/2, pDirection.angle), 0.1);				
			spd = approach(spd, maxSpeed, 0.05);
		}
		
		actualDir = flerp(actualDir, pDirection.angle, 0.2);
		//calculating aSpeed and dSpeed

		log(actualDir);

		#endregion
		#region Jumping phase
		// Code here
		#endregion
		#region //Flying section
		// Code here
		#endregion
		clampSpeed(hMaxSpeed, vMaxSpeed);
		#region //Switching state phase
		if (InputManager.keyShiftPressed)
		{
		    state.change("dash", function() {
				dashDir.find(pDirection.x, pDirection.y);
			    isDashing = true;
		    });
		}
		#endregion
	}
})
	
state.add("crouch", { // ---------- Crouch State
	enter: function() 
	{
		// Code here
	},
	step: function() 
	{
		// Code here	
	}
})
	
state.add("dash", { // ---------- Dash State
	enter: function() 
	{
		// Code here
	},
	step: function()
	{
		dashTween.sstart(0, dashPower, 0.25);
		xSpeed = lengthdir_x(dashTween.value, dashDir.angle);
		ySpeed = lengthdir_y(dashTween.value, dashDir.angle);
		//var dt = distance_to_point(lengthdir_x(dashPower, dashDir.angle), lengthdir_y(dashPower, dashDir.angle));
		//var ps = distance_to_point(xSpeed, ySpeed);
		ghostDashTimer.sstart(0.25 / 4, true);
		ghostDashTimer.onTimeout(function()
		{
			part_particles_create(global.partSystem, x, y, global.ptGhostDash, 1);
		});
		clampSpeed(dashPower, dashPower);
		show_debug_message(dashTween.value);
		//if dashTween.value == 0 show_message("done");
		if (dashTween.done || (onWall && xSpeed != 0))
		{
		    state.change("normal", function() {
				ghostDashTimer.reset();
			    dashTween.reset();
			    isDashing = false;
		    });
		}
	}
})
		



signal_join("test");

signal_find("test", id, function() {
	log("found");
	
});

signal_leave("test", id);



















