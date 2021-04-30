var _dir = (random_range(0, 360));
direction = _dir;
speed = 5;

system = part_system_create_layer("Particles", 1);
particle = part_type_create();

part_type_blend(particle, true);
part_type_shape(particle, pt_shape_smoke);
part_type_size(particle, 0.25, 0.5, 0.01, 0.1);
part_type_colour3(particle, $FFFF2600 & $FFFFFF, $FF00FFFF & $FFFFFF, $FF0000FF & $FFFFFF);
part_type_alpha3(particle, 0.5, 1, 0);
part_type_speed(particle, 0, 0, 0, 0);
part_type_direction(particle, 0, 360, 0, 0);
part_type_gravity(particle, 0.1, 90);
part_type_orientation(particle, 0, 360, 0.5, 5, 0);
part_type_life(particle, 30, 60);

emitter = part_emitter_create(system);
part_emitter_region(system, emitter, x - 25, x + 25, y - 25, y + 25, ps_shape_diamond, ps_distr_gaussian);
part_emitter_stream(system, emitter, particle, 5);