///@func stage_peak_snow()
part_type_direction(global.p3, 235, 315, 0, 1);
part_type_speed(global.p3, 2, 4, 0, 0.1);
part_type_orientation(global.p3, 0, 360, 0, 0, 0);
part_particles_create(global.part_sys, random(room_width), obj_game.cam_y, global.p3, 4);