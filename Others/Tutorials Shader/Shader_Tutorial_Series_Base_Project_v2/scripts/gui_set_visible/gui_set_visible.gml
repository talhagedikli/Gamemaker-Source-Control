/// @description sets the text of the info text box
/// @param true/false
function gui_set_visible() {
	var toggle = clamp(round(argument[0]), 0, 1);

	with (par_btn)			visible = toggle;
	with (obj_room_name)	visible = toggle;
	with (obj_room_number)	visible = toggle;
	with (obj_fps)			visible = toggle;
	with (obj_darken)		visible = toggle;
	with (obj_mouse_xy)		visible = toggle;

	with (obj_btn_show_hide_gui) visible = true;


}
