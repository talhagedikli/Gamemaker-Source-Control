/// @description
//Input Buffer DEBUG
if (debug)
	{
	var start_x = player_number * (ds_list_size(input_buffer) * 5);
	var c = c_white;
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		c = make_color_hsv((i mod INPUT.length) * INPUT.length * 3, 255, 255);
		draw_rectangle_color(start_x + i * 5, 0, start_x + 4 + i * 5, input_buffer[| i] * 2, c, c, c, c, false);
		draw_rectangle_color(start_x + i * 5, input_buffer[| i] * 2, start_x + 4 + i * 5, 3 + input_buffer[| i] * 2, c_black, c_black, c_black, c_black, false);
		} 
	}