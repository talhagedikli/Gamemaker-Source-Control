part_emitter_region(global.P_System, global.Emitter2, mouse_x - 50, mouse_x + 50, mouse_y - 25, mouse_y + 25, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(global.P_System, global.Emitter2, global.Particle1, 250);
alarm_set(0, room_speed);