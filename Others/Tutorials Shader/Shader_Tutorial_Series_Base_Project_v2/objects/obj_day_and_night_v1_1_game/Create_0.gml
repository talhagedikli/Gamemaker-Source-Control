/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Day and Night Cycle v1.1
				with brt/con/sat
				overlay colour";

info_text	= @"Day and Night Cycle v1.1:

				This version overlays the sample colours with a day time colour and applies brightness, contrast and saturation based on day time as well.";

click_region_gui	= true;		// false: mouse click region in room space | true: mouse click region in gui space
deselectable		= false;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
//sprite			= spr_foto_plant_256x256px; // optional

shader			= shd_day_and_night_v1_1;
u_col			= shader_get_uniform(shader, "col");
u_con_sat_brt	= shader_get_uniform(shader, "con_sat_brt");

// COLOR VARS:
// ----------------------------------------------------------------------------
color_mix		= -1;
color[0,0]		= undefined;

con_sat_brt_mix	= -1;

key_previous	= -1;
key_next		= -1;

// KEY TIMES:
// ----------------------------------------------------------------------------
// arguments:		R		G		B		con		sat		brt		popS	popT
scr_add_key_time(030,	120,	225,	0.60,	1.00,  -0.20,	0.80,	0.65);	// 00h
scr_add_key_time(040,	125,	215,	0.65,	0.90,  -0.20,	0.70,	0.65);	// 02h
scr_add_key_time(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 04h
scr_add_key_time(125,	070,	175,	1.00,	0.85,  -0.10,  -0.50,	0.60);	// 06h
scr_add_key_time(160,	145,	100,	1.20,	0.65,  -0.03,	0.00,	1.00);	// 08h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 10h
scr_add_key_time(128,	128,	128,	1.20,	0.85,	0.05,	0.00,	1.00);	// 12h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 14h
scr_add_key_time(140,	130,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 16h
scr_add_key_time(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 18h
scr_add_key_time(150,	060,	190,	1.25,	0.70,  -0.05,  -0.50,	0.60);	// 20h
scr_add_key_time(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 22h

number_of_key_times = array_height_2d(color);

slider_set_automation_speed(0, 0.0015);
slider_set_draw_value(0, false);
slider_set_automation_type(0, 2);
gui_set_visible(false);

// WATER REFLECTION:
// ----------------------------------------------------------------------------
var lyr_reflection	= layer_get_id("tlyr_reflection");
layer_script_begin(lyr_reflection, scr_set_alpha_v1_1);
layer_script_end(lyr_reflection, scr_reset_alpha);

u_alpha	= shader_get_uniform(shd_alpha, "alpha");
alpha	= 0;
#endregion
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
#region RESIZE VIEW AND APPLICATION SURFACE (optional): 
//-----------------------------------------------------------------------------
// don't forget to draw in a draw gui event if you dont want to scale the sprite
scr_camera_set_scale(3);
application_surface_draw_enable(false);
#endregion
//-----------------------------------------------------------------------------
