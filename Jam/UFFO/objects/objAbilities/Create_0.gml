direction		= 180;
speed			= random_range(0.5, 1);
var c			= choose(global.starfieldColor);
color			= merge_color(c_white, c, 0.4)
angleSpd		= 0;
fadeOut			= false;
image_blend		= c_white;
image_index		= irandom_range(0, image_number - 1);
// image_index 	= 6;
image_speed		= 0;
effectTimer		= new Timer();
effectTimer.start(5);
ability			= noone;
destroy = function()
{
	fadeOut = true;
}

leftOutRoom = function()
{
	return bbox_right < 0 ? true : false;
}

pick = function()
{
	var a = audio_play_sound(aPick, 1, false);
	if (ability.type = AbilityType.wepon)
	{
		with (other)
		{
			wepon		= other.ability;
			weponDelay	= wepon.delay;
		}
	}
	else if(ability.type = AbilityType.bounity)
	{
		with (other)
		{
			bounity = other.ability;
		}
	}
	destroy();
}

state = new SnowState(string(image_index));
state.add("0", {
	enter: function()
	{
		ability = new Single();
	},
	step: function()
	{
		
	}
});
state.add("1", {
	enter: function()
	{
		ability = new Triple();
	},
	step: function()
	{
	
	}
});
state.add("2", {
	enter: function()
	{
		ability = new Sphere();
	},
	step: function()
	{
		
	}
});
state.add("3", {
	enter: function()
	{
		ability = new Tornado();
	},
	step: function()
	{
		
	}
});
state.add("4", {
	enter: function()
	{
		ability = new Track();
	},
	step: function()
	{
		
	}
});
state.add("5", {
	enter: function()
	{
		ability = new Speedup();
	},
	step: function()
	{
		
	}
});
state.add("6", {
	enter: function()
	{
		ability = new Shootrate();
	},
	step: function()
	{
		
	}
});

