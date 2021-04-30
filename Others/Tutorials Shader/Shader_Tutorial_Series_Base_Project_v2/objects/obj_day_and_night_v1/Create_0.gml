/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Day and Night Cycle v1.0
				with brt/con/sat
				multiplying colour";

info_text	= @"Day and Night Cycle v1.0:

				This version multiplies the sample colours with a day time colour and applies brightness, contrast and saturation based on day time as well.";

click_region_gui	= true;		// false: mouse click region in room space | true: mouse click region in gui space
deselectable		= false;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
//sprite			= spr_foto_plant_256x256px; // optional

shader			= shd_day_and_night_v1;
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
// arguments:	  R    G    B   con  sat  brt   popS  popT
scr_add_key_time(010, 070, 200, 0.7, 0.6, 0.00, 3.50, 0.65);	// mid night
scr_add_key_time(010, 080, 220, 0.8, 0.9, 0.00, 2.00, 0.75);	// late night
scr_add_key_time(220, 200, 175, 1.1, 1.3, 0.05, 0.80, 0.80);	// dawn
scr_add_key_time(250, 235, 200, 1.2, 1.1, 0.10, 0.00, 1.00);	// morning
scr_add_key_time(255, 250, 230, 1.3, 0.9, 0.15, 0.00, 1.00);	// noon
scr_add_key_time(250, 240, 200, 1.4, 1.1, 0.15, 0.00, 1.00);	// late after-noon
scr_add_key_time(215, 150, 165, 1.5, 1.4, 0.25, 0.80, 0.80);	// dusk
scr_add_key_time(010, 080, 220, 0.9, 0.9, 0.00, 2.00, 0.75);	// early night

number_of_key_times = array_height_2d(color);
slider_set_automation_speed(0, 0.0015);
slider_set_draw_value(0, false);

// WATER REFLECTION:
// ----------------------------------------------------------------------------
var lyr_reflection	= layer_get_id("tlyr_reflection");
layer_script_begin(lyr_reflection, scr_set_alpha);
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
