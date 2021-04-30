/// @description frame, title & corner info
function scr_draw_module() {
	//	Can be used in any draw event but should be used in 
	//	the same event where the module sprite is drawn

	// frame:
	scr_draw_9slice_box(global.selected_module == id ? frame_sprite[true] : frame_sprite[false], x1_frame, y1_frame, x2_frame, y2_frame, frame_slice_size);

	// title:
	draw_text(x1_text, y1_text, title_text);

	// corner info:
	if (corner_text != "") scr_draw_corner_info(corner_text);



}
