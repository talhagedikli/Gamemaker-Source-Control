///@func draw_text_sprite(x, y, string, sprite, [pad], [randomx], [randomy], [scale], [color], [alpha])
///@param x
///@param y
///@param string
///@param sprite
///@param [pad]
///@param [randomx]
///@param [randomy]
///@param [scale]
///@param [color]
///@param [alpha]
function draw_text_sprite() {
	var _x = argument[0];
	var _y = argument[1];
	var _str = argument[2];
	var _spr = argument[3];
	var _pad = argument_count > 4 ? argument[4] : sprite_get_width(_spr);
	var _ranx = argument_count > 5 ? argument[5] : 0;
	var _rany = argument_count > 6 ? argument[6] : 0;
	var _scale = argument_count > 7 ? argument[7] : 1;
	var _col = argument_count > 8 ? argument[8] : c_white;
	var _alpha = argument_count > 9 ? argument[9] : 1;

	//Loop through the string and draw corresponding subimages
	for(var i = 0; i < string_length(_str); i++)
		{
		var _char = string_char_at(_str, i + 1);
		if (_char == "-") then continue;
		var _digit = real(_char);
		draw_sprite_ext
			(
			_spr,
			_digit,
			_x + _ranx,
			_y + _rany,
			_scale,
			_scale,
			0,
			_col,
			_alpha
			);
		_x += _pad;
		}

	//Percentage
	draw_sprite_ext
		(
		spr_percent_font,
		0,
		_x + _ranx,
		_y + _rany,
		_scale,
		_scale,
		0,
		_col,
		_alpha
		);


}
