function Class() constructor
{
	stepBegin		=undefined;
	step			=undefined;
	stepEnd			=undefined;
	destroy			=undefined;
	cleanUp			=undefined;
	draw			=undefined;
}
function class_create_layer(_x, _y, _layer, _class)
{
	instance_create_layer(_x, _y, _layer, objClass, _class);	
}
function class_create_depth(_x, _y, _depth, _class)
{
	instance_create_depth(_x, _y, _depth, objClass, _class);	
}

function baby() : Class() constructor
{
	x=64;
	y=64;
	xspd=0.4;

	step = function()
	{
		x+=xspd;
		if (place_meeting(x, y, objBlock))
		{
			show("bye");
			instance_destroy(self);
		}
	}
	
	draw = function()
	{
		draw_sprite(sprSkeleton, 0, x, y);
	}
}


function Tweener() : Class() constructor
{
	x = 64; 
	y = 64;
	type = TweenType.BackEaseOut;
	tween = new Tween(type, x, x+32, 60*1);
	tween.start();
	
	step = function()
	{
		x=tween.getValue();
		if (tween.isFinished())
		{
			tween.start(x, x+32);
		}
		
	}
	
	draw = function()
	{
		draw_sprite(sprSkeleton, 0, x, y);	
	}
}

