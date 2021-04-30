/// @description Init
//-----------------------------------------------------------------------------
//	This object creates a slider and a button to automate the slider.
//
//	To set the width of the slider, just drag out its sides in the room editor.
//	The automation button is created to the right or left of the slider,
//	depending on where the centre of the slider is:
//	- slider center < GUI center -> automation button right of slider
//	- slider center > GUI center -> automation button left of slider
//
//	If you don't want the automation button, place a kill modifier over the  
//	area where the automation button would appear.
//
//	There are several setter scripts to change the slider:
//	- slider_set_value:				real, 0 <= value <= 1
//	- slider_set_caption:			string
//									can be "" to draw no caption
//	- slider_set_sprite:			sprite id
//	- slider_set_automation_speed:	real, 0 < automation_speed < 1
//									lower = slower
//									0 would mean no movement which can be toggled 
//										by the automation button
//									> 0.1 is very fast already
//	- slider_set_draw_value:		boolean
//									draw the value onto the slider button?
//
//	And several getter scripts:
//	- slider_get_id					sliders instance id
//	- slider_get_value				real, 0 <= value <= 1
//	- slider_get_caption			string
//	- slider_get_automation_speed	real, 0 < automation_speed < 1
//	- slider_get_draw_value			boolean
//	- slider_get_released			boolean
//									whether the slider was just released
//	- slider_get_pressed			boolean
//									whether the slider was just pressed
//-----------------------------------------------------------------------------

// Apply kill modifier - optional:
if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}

event_inherited();


// SLIDER BASICS:
//-----------------------------------------------------------------------------
slider_number	= slider_sys_register();	// adds slider to a list and stores list position
value			= 0.5;						// 0 <= value <= 1
caption			= string(slider_number);	// will be written on the button
show_value		= true;


// BAR: the background image of the slider
//-----------------------------------------------------------------------------
bar_sprite		= spr_3slice_hor_orange;
bar_slice_size	= round(sprite_get_width(bar_sprite) / 3);	// 3-slice image: left, middle and right part. Thus size = width / 3
bar_width		= sprite_width;								// not needed but consistent
bar_height		= sprite_get_height(bar_sprite);
x1_bar			= x - round(0.5 * bar_width);
y1_bar			= y - round(0.5 * bar_height);
x2_bar			= x1_bar + bar_width;
y2_bar			= y1_bar + bar_height;


// BUTTON: the foreground image of the slider
//-----------------------------------------------------------------------------
slider_sys_set_btn(spr_btn_96x31px); // all buttons: 31x31 | 96x31 | 127x31; can be changed in instance creation code (room)


// SLIDER DIMENSIONS:
//-----------------------------------------------------------------------------
slider_sys_set_dimensions();


// AUTOMATION:
//-----------------------------------------------------------------------------
var automation_x;
if (x < (0.5 * display_get_gui_width()))	automation_x = x2_bar + 48;
else										automation_x = x1_bar - 48;
automation_id = instance_create_layer(automation_x, y, layer, obj_btn_automate_slider);
with (automation_id) {
	slider_id =  other.id
}

automation_type	= 0;		// 0: off | 1: back and forth | 2: cycle
automation_sign	= 1;		// 1: increase value | -1 decrease value
automation_spd	= 0.01;		// 0 < automation_spd < 1

