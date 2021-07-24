#region Create -----------------------------------------------------------------
// Init
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
animation_init();
//speed variables
xSpeed		= 0;
ySpeed		= 0;
lastPos 	= new Vector2();
shipAngle	= 0;
motion		= new Vector2(0, 0);

// Inventory
hpMax		= 5;
hp			= hpMax;
inventory	= ["talha", "bera", "yasir"];
showInv		= false;

// Attack 
colliding	= noone;

// Area and distance
enum DIR 
{
	RIGHT,
	UP,
	LEFT,
	DOWN
}

//show(dirfind(area));
collisions	= ds_list_create();
touching	= false;

#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions

// Array sorting functions
typeSort	= function(_a, _b)
{
	return _a.type - _b.type;
}
#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
state = new SnowState("idle");

state.history_enable();
state.set_history_max_size(15);
state.event_set_default_function("init", function() 
{
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
});

state.add("idle", {
	enter: function() 
	{
		// test
		shipDir.set(5, 0);
	},
	step: function()
	{
		if (InputManager.keyRight)
		{
			shipAngle -= 1;
		}
		else if (InputManager.keyLeft)
		{
			shipAngle += 1;
		}
		x += lengthdir_x(motion.length(), shipAngle);
		y += lengthdir_y(motion.length(), shipAngle);
	}
});

// var arr = [0, 1, 2];
// var m = 2;
// foreach(arr as (val, ind)
// {
// 	show(val * m);
// })
	
state.add("move", {
	enter: function() 
	{
		DoLater(moveDur*4/5, function(data)
		{
			// Code
			show(data.msg);
		},
		{ 
			nextState	: "attack",
			msg		 	: "nothing"
		}, true);
		
		//alarm[0] = moveDur*4/5;			// 10
	},
	step: function() 
	{
		// Code here
	},
	leave: function()
	{
		// Code here
	}
});

state.add("attack", {
	enter: function()
	{
		// Code here
	},
	step: function()
	{
		// Code here
	}
});

#endregion //-------------------------------------------------------------------

Camera.following = self;

global.clock.variable_interpolate("x", "iotaX");
global.clock.variable_interpolate("y", "iotaY");

global.clock.add_cycle_method(function() {
	
});

