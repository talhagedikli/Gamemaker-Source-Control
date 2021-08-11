direction		= 180;
speed			= random_range(0.3, 0.7) * global.difficulty;
image_blend		= c_white;
image_index		= irandom_range(0, image_number - 1);
image_speed		= 0;
var c			= choose(global.starfieldColor);
color			= merge_color(c_white, c, 0.4)
angleSpd		= 0;
fadeOut			= false;
effectTimer		= new Timer();
ability			= noone;
effectTimer.start(5);
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
	other.wepon = ability;
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

