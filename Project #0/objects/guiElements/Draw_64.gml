#region TESTING VARIABLES
//names
test[0][0] = "xSpeed"
test[0][1] = objPlayer.xSpeed;

test[1][0] = "ySpeed"
test[1][1] = objPlayer.ySpeed;

test[2][0] = "State"
test[2][1] = objPlayer.currentState;

test[3][0] = "keyleft";
test[3][1] = objPlayer.keyLeft;

test[4][0] = "keydown";
test[4][1] = objPlayer.keyDown;

test[5][0] = "keyup";
test[5][1] = objPlayer.keyUp;

test[6][0] = "cam width";
test[6][1] = camera.camW;

test[7][0] = "cam height ";
test[7][1] = camera.camH;

test[8][0] = "cam x ";
test[8][1] = camera.camX;

test[9][0] = "cam y ";
test[9][1] = camera.camY;

test[10][0] = "slider 0 ";
test[10][1] = 0;

test[11][0] = "slider 1 ";
test[11][1] = 0;

test[12][0] = "slider 2 ";
test[12][1] = 0;

test[13][0] = "gui width";
test[13][1] = display_get_gui_width();

test[14][0] = "gui height ";
test[14][1] = display_get_gui_height();

test[15][0] = "view width ";
test[15][1] = camera_get_view_width(VIEW);

test[16][0] = "view height ";
test[16][1] = camera_get_view_height(VIEW);

test[17][0] = "appsur width ";
test[17][1] = surface_get_width(application_surface);

test[18][0] = "appsur height";
test[18][1] = surface_get_height(application_surface);

test[19][0] = "windowr width";
test[19][1] = window_get_width();

test[20][0] = "windowr height";
test[20][1] = window_get_height();

var gs = 1.2;
display_set_gui_size(display_get_gui_width()*gs, display_get_gui_height()*gs);
#region DISPLAY VARIABLES AND NAMES
//set font
draw_set_font(fntGui);

//array length
var _arrayL = array_length(test);

//where to draw
//var _guiW = display_get_gui_width();
//var _guiH = display_get_gui_height();

//x and y margins
var _yM = 16;
var _xM = 16;

//creating string width and height
var _sH = 0;
var _sW1 = 0;
var _sW2 = 0;

var _totalW = 0;


var _x = _xM;
var _y = _yM;

//calculating max string height
var i = 0; repeat (_arrayL)
{
	var _h1 = string_height(string(test[i][0]));
	var _h2 = string_height(string(test[i][1]));
	if (_h1 > _h2)	{ _sH = _h1; }
	else			{ _sH = _h2; }
	i++;
}

//calculating string width of names
var i = 0; repeat (_arrayL)
{
	var _l1 = string_width(string(test[i][0]));
	if (_l1 > _sW1) { _sW1 = _l1; }
	i++;
}

//calculating max string width of values
var i = 0; repeat (_arrayL)
{
	var _l2 = string_width(string(test[i][1]));
	if (_l2 > _sW2) { _sW2 = _l2; }
	i++;
}

//calculating max rectangle's x and y values
var i = 0; repeat (_arrayL)
{
	var _l2 = string_width(string(test[i][1]));
	if (_l2 > _sW2) { _sW2 = _l2; }
	i++;
}


//background rect
_totalW = _xM + _sW1 + 6*_xM;
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, _totalW, 2*_yM + _arrayL*_sH, false);
draw_set_alpha(1);
draw_set_color(c_white);

//draw text names
var i = 0; repeat (_arrayL)
{
	draw_text(_x, _y + (_sH * i), string(test[i][0]));
	i++;
}

//draw text values
var _x2 = _xM + _sW1 + _xM;

var i = 0; repeat (_arrayL)
{
    draw_text(_x2, _y + (_sH * i), ": " + string(test[i][1]));
	i++
}

#endregion
display_set_gui_size(-1, -1);

#endregion

#region BLACK BARS - DRAW_GUI(out)
/*
//variables
var _b = c_black;
var _w = c_white

//var _guiW = display_get_gui_width();
//var _guiH = display_get_gui_height();

//var _gapYOne = abs(targetYOne - yOne);
//var _gapYTwo = abs(targetYTwo - yTwo);


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
	//NOTE: no need to destroy it, we just have one already(guiElemets)

}

//apply target to dynamic variables
yOne = lerp(yOne, targetYOne, 0.1);
yTwo = lerp(yTwo, targetYTwo, 0.1);
*/
#endregion

//var sw = surface_get_width(application_surface);
//var vw = camera_get_view_width(VIEW);

//display_set_gui_maximize(sw/vw, sw/vw, 
//							display_get_gui_width()/2, display_get_gui_height()/2);
//draw_sprite(sprEnemy, image_index, 0, 0);
//display_set_gui_size(-1, -1);
















