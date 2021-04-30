global.P_System = part_system_create_layer(layer, 1);
global.Particle1 = part_type_create();

part_type_blend(global.Particle1, true);
part_type_shape(global.Particle1, pt_shape_flare);
part_type_size(global.Particle1, 0.01, 0.01, 0, 0.5);
part_type_colour3(global.Particle1, $FFFFFF00 & $FFFFFF, $FF00FF00 & $FFFFFF, $FF0000FF & $FFFFFF);
part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_speed(global.Particle1, 2, 5, -0.10, 0);
part_type_direction(global.Particle1, 0, 360, 0, 20);
part_type_life(global.Particle1, 30, 60);

global.Emitter1 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter1, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_invgaussian);
part_emitter_stream(global.P_System, global.Emitter1, global.Particle1, 10);

global.Emitter2 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter2, mouse_x - 50, mouse_x + 50, mouse_y - 25, mouse_y + 25, ps_shape_ellipse, ps_distr_gaussian);

alarm_set(0, room_speed);