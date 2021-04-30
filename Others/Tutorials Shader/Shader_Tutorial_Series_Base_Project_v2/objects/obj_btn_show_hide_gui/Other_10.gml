/// @description toggle visibility

// with: no need to check if any instance exists
with (par_btn)			visible = !visible;
with (obj_room_name)	visible = !visible;
with (obj_room_number)	visible = !visible;
with (obj_fps)			visible = !visible;
with (obj_darken)		visible = !visible;
with (obj_mouse_xy)		visible = !visible;

visible = true;

// if new objects are added to this list: also change the script gui_set_visible