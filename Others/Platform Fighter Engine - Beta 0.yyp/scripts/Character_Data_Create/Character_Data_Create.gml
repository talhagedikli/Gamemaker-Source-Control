///@func Character_Data_Create(name,script,render,CSS,palette,portrait,sprite_sprite,music)
///@param name
///@param script
///@param render
///@param CSS
///@param palette
///@param portrait
///@param stock_sprite
///@param music
///@desc Creates all of the data needed for things outside of the game (CSS, win screen, etc.)
function Character_Data_Create() {
	var _new = [];
	_new[CHAR_DATA.name			] = argument[0];
	_new[CHAR_DATA.script		] = argument[1];
	_new[CHAR_DATA.render		] = argument[2];
	_new[CHAR_DATA.CSS			] = argument[3];
	_new[CHAR_DATA.palette		] = argument[4];
	_new[CHAR_DATA.palette_data	] = palette_colors_get_from_sprite(argument[4]);
	_new[CHAR_DATA.portrait		] = argument[5];
	_new[CHAR_DATA.stock_sprite	] = argument[6];
	_new[CHAR_DATA.music		] = argument[7];
	return _new;


}
