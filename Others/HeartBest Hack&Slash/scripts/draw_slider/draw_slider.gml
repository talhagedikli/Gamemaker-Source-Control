/// @description draw_slider(caption, x, y, min, max, id)
/// @function draw_slider
/// @param caption
/// @param  x
/// @param  y
/// @param  min
/// @param  max
/// @param  id
function draw_slider(argument0, argument1, argument2, argument3, argument4, argument5) {
	var _caption = argument0;
	var _x = floor(argument1);
	var _y = floor(argument2);
	var _min = argument3;
	var _max = argument4;
	var _id = argument5;
	var _val = string_copy(string_format(attr[_id], 0, 4), 1, 6);

	var _cursorVal = attr[_id] / limit[_id, 1];
	var _cursorX = _x + _cursorVal * 150;

	draw_set_font(fntMain);

	draw_set_valign(fa_middle);
	gpu_set_blendmode(bm_add);
	draw_set_alpha(.5);
	draw_set_colour(c_purple);
	draw_set_halign(fa_right);
	draw_text(_x - 7, _y, string_hash_to_newline(_caption));
	draw_set_halign(fa_left);

	draw_set_font(fntValue);
	draw_text(_x + 158, _y, string_hash_to_newline(_val));
	draw_set_font(fntMain); 

	draw_line_width(_x - 2, _y - 2, _x + 150, _y - 2, 2);
	draw_line_width(_cursorX - 2, _y - 4 - 2, _cursorX - 2, _y + 4 - 2, 4);

	draw_set_alpha(.8);
	draw_set_colour(c_white);
	draw_set_halign(fa_right);
	draw_text(_x - 5, _y, string_hash_to_newline(_caption));

	draw_set_halign(fa_left);
	draw_set_font(fntValue);
	draw_text(_x + 160, _y, string_hash_to_newline(_val));
	draw_set_font(fntMain); 

	draw_line_width(_x, _y - 2, _x + 150, _y - 2, 2);
	draw_line_width(_cursorX, _y - 4 - 2, _cursorX, _y + 4 - 2, 4);

	if (mouse_check_button(mb_left)){
	    if (global.holdingSlider == -1){
	        if (mouse_x >= _x &&  mouse_x <= _x + 150 && mouse_y >= _y - 6 && mouse_y <= _y + 6){
	            global.holdingSlider = _id;           
	        }
	    }
    
	    if (global.holdingSlider == _id){
	        _cursorVal = (clamp(_x, mouse_x, _x + 150) - _x) / 150;
	        _cursorVal = min(1, _cursorVal);
	        valTo[_id] = limit[_id, 0] + (limit[_id, 1] - limit[_id, 0]) * _cursorVal;  
	        attr[_id] = valTo[_id];
	    }
	}

	draw_set_alpha(1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	gpu_set_blendmode(bm_normal);


}
