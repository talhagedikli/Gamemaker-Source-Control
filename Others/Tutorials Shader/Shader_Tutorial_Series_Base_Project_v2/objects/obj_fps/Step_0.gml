/// @description Add fps / get fps mean

if (fps_counter == fps_count_to) {
	fps_counter = 0;
	fps_text	=	"fps: "			+ string_format(round(ds_grid_get_mean(fps_ds, 0, 0, 0, fps_count_to)), 6, 0) +
					" | " +
					"fps real: "	+ string_format(round(ds_grid_get_mean(fps_real_ds, 0, 0, 0, fps_count_to)), 6, 0);
} else {
	fps_ds[# 0,fps_counter] = fps;
	fps_real_ds[# 0,fps_counter] = fps_real;
	fps_counter++;
}

