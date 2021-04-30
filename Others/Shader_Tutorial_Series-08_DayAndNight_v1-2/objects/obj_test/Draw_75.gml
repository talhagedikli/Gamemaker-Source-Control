/// @description Test Feedback

// Trigger Test
if test_trigger_released
draw_sprite_ext(spr_X_32, 0, x - 128, y, 1, 1, 0, c_white, test_trigger_timer/room_speed);

// INFO TEXT
if !show_text exit;
//draw_self();
event_inherited();

var i, j, list, grid;

var getter_test_text = "Getter Tests:\n\n";

// instruction:
var instruction_text =	"Instructions:\n" + 
						"Q: set slider draw_value\n" + 
						"W: set slider auto speed\n" + 
						"E: set slider caption\n" +
						"R: set slider sprite\n" + 
						"T: set slider value\n" +
						"\n" +
						"A: set trigger caption\n" +
						"S: set trigger sprite\n" +
						"\n" +
						"G: set toggle caption\n" +
						"H: set toggle sprite\n";
getter_test_text += instruction_text + "\n";

// slider:
list = global.slider;
var slider_text = "Slider:\n";
for (i = 0; i < ds_list_size(list); i++)
	slider_text +=	"id | caption | value | draw value | auto spd:   "	+ 
					string(slider_get_id(i))				+ " | " +
					string(slider_get_caption(i))			+ " | " +
					string(slider_get_value(i))				+ " | " +
					string(slider_get_draw_value(i))		+ " | " +
					string(slider_get_automation_speed(i))	+ "\n";
getter_test_text += slider_text + "\n";

// trigger:
list = global.trigger;
var trigger_text = "Trigger:\n";
for (i = 0; i < ds_list_size(list); i++)
	trigger_text +=	"id | caption | pressed | released:   "	+ 
					string(trigger_get_id(i))		+ " | " +
					string(trigger_get_caption(i))	+ " | " +
					string(trigger_get_pressed(i))	+ " | " +
					string(trigger_get_released(i))	+ "\n";
getter_test_text += trigger_text + "\n";

// toggle:
grid = global.toggle;
var toggle_text = "Toggle:\n";
for(i = 0; i < ds_grid_width(grid); i++)
	for (j = 0; j < ds_grid_height(grid); j++)
		if (grid[# i,j] != noone)
			toggle_text += "id | caption | state | pressed | released:   " +
							string(toggle_get_id(i, j))			+ " | " +
							string(toggle_get_caption(i, j))	+ " | " +
							string(toggle_get_state(i, j))		+ " | " +
							string(toggle_get_pressed(i, j))	+ " | " +
							string(toggle_get_released(i, j))	+ "\n";
getter_test_text += toggle_text;

// draw:
var padding = 8; var xx = x + 48;
var str_h = string_height(getter_test_text); var str_w = string_width(getter_test_text);
draw_set_colour(c_black); draw_set_alpha(0.5);
draw_rectangle(xx, y - 0.5 * str_h - padding, xx + str_w + 2 * padding, y + 0.5 * str_h + padding, false);
draw_set_colour(c_white); draw_set_alpha(1);

draw_set_valign(fa_middle);
draw_text(xx + padding, y, getter_test_text);
draw_set_valign(fa_top);
