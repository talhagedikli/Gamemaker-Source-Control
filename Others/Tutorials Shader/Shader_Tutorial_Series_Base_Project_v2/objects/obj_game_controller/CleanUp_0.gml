/// @description free stuff

if (ds_exists(global.slider, ds_type_list))		ds_list_destroy(global.slider);
if (ds_exists(global.trigger, ds_type_list))	ds_list_destroy(global.trigger);
if (ds_exists(global.toggle, ds_type_grid))		ds_grid_destroy(global.toggle);

