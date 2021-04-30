/// @description Read room name
//-----------------------------------------------------------------------------
//	This object draws the room name to the gui.
//
//	The width available to the text is determined by the place hodler sprite in the
//	room editor. You can change the size by dragging its sides. If the text won't
//	fit, the tail is cut off.
//
//	The name of the room as shown in the program is:
//	- the rooms asset name minus the first 3 charaters (i.e. minus "rm_")
//	- every "_" is replaced by " "
//	- every "xxv" is replaced by "|" -> vertical line
//	- every "xxh" is replaced by "-" -> horizontal line
//	- every "xxd" is replaced by "." -> dot
//	- every "xxc" is replaced by "," -> comma
//	- every "xxa" is replaced by "&" -> and
//	- every "xxs" is replaced by "/" -> slash

//-----------------------------------------------------------------------------


font = fnt_medium;

// get name without first three characters:
text = string_delete(room_get_name(room), 1, 3);

// replace under score with space and xx with vertical line:
repeat (string_count("_", text))   text = string_replace_all(text, "_", " ");
repeat (string_count("xxv", text)) text = string_replace_all(text, "xxv", "|");
repeat (string_count("xxh", text)) text = string_replace_all(text, "xxh", "-");
repeat (string_count("xxd", text)) text = string_replace_all(text, "xxd", ".");
repeat (string_count("xxc", text)) text = string_replace_all(text, "xxc", ",");
repeat (string_count("xxa", text)) text = string_replace_all(text, "xxa", "&");
repeat (string_count("xxs", text)) text = string_replace_all(text, "xxs", "/");

// cut string to image width:
draw_set_font(font)
while (string_width(text) > abs(sprite_width))
	text = string_delete(text, string_length(text), 1);
draw_set_font(fnt_standard);

