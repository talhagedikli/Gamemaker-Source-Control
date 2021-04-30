/// @description scroll

// SCROLL INPUT/TOGGLE:
//-----------------------------------------------------------------------------

// start scrolling on pressed:
if (mouse_pressed) {
	scroll = true;
	delta_y = mouse_y - text_yoffset;
}

// stop scrolling on released:
if (mouse_check_button_released(mb_left))
	scroll = false;

// scroll:
if (scroll)
	text_yoffset = mouse_y - delta_y;

// scroll with wheel:
if (mouse_over) {
	if (mouse_wheel_up())
		text_yoffset += 32;
	else if (mouse_wheel_down())
		text_yoffset -= 32;
}


// TEXT & SCROLL INDICATOR ARROWS:
//-----------------------------------------------------------------------------

var selected		= global.selected_module;
info_text			= (selected == noone) ? instruction_text : selected.info_text;
text_height			= string_height_ext(info_text, -1, text_srf_w);
text_yoffset		= clamp(text_yoffset, -text_height + text_srf_h, 0);
scroll_arrow_blink	= 0.95 + 0.5 * sin(current_time / 200);