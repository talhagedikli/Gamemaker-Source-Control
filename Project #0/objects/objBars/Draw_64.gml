//variables
var _b = c_black;
var _w = c_white

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

var _gapYOne = abs(targetYOne - yOne);
var _gapYTwo = abs(targetYTwo - yTwo);


//DRAW BARS
if (global.createBars)
{
	//switch targets
	targetYOne = yUpTwo;
	targetYTwo = yDownTwo;
	
	//create bars
	draw_set_color(_b);
	draw_rectangle(xOne, yUpOne,	xTwo, yOne, false);
	draw_rectangle(xOne, yDownOne,	xTwo, yTwo, false);
	draw_set_color(_w);
	
	
}
else
{
	//switch targets
	targetYOne = yUpOne;
	targetYTwo = yDownOne;
	
	//bars fade out
	draw_set_color(_b);
	draw_rectangle(xOne, yUpOne,	xTwo, yOne, false);
	draw_rectangle(xOne, yDownOne,	xTwo, yTwo, false);
	draw_set_color(_w);
	
	//after it reaches to 0, destroy the bars that created
	//it may create a couple of bars but it destroys itself in a second 
	if (_gapYOne == 0 and _gapYTwo == 0)
	{
		instance_destroy();
	}
	
}

//apply target to dynamic variables
yOne = lerp(yOne, targetYOne, 0.1);
yTwo = lerp(yTwo, targetYTwo, 0.1);


