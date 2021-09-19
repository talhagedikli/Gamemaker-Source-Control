///Defines all of the values needed for things like the CSS, win screen, etc. for every character
function Character_Data() {
	global.all_character_data = 
		[
		Character_Data_Create
			(
			"Blocky",
			character0,
			spr_render0,
			spr_css0,
			spr_palette0,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			),
		Character_Data_Create
			(
			"Polygon",
			character1,
			spr_render0,
			spr_css1,
			spr_palette1,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			),
		Character_Data_Create
			(
			"Vertex",
			character2,
			spr_render0,
			spr_css2,
			spr_palette2,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			),
		Character_Data_Create
			(
			"Random",
			-1,
			spr_render0,
			spr_css_random,
			spr_palette_random,
			palette_colors_get_from_sprite(spr_palette0),
			spr_portrait0,
			spr_stock0,
			song_victory0,
			),
		];


}
