/// @description free stuff

if !variable_instance_exists(id, "fps_ds") exit; // could also check for room = room_first -> exit
if ds_exists(fps_ds, ds_type_grid)		ds_grid_destroy(fps_ds);
if ds_exists(fps_real_ds, ds_type_grid)	ds_grid_destroy(fps_real_ds);

