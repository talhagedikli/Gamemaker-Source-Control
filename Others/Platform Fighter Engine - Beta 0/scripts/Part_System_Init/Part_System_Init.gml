part_system_depth(global.part_sys, -100);
part_system_automatic_update(global.part_sys, false);
part_system_automatic_draw(global.part_sys, false);

//Zero - Gravity Particles
global.p1 = part_type_create();
part_type_sprite(global.p1, spr_hit_fx_part, false, false, false);
part_type_size(global.p1, 1, 2, -0.05, 0);
part_type_scale(global.p1, 1, 1);
part_type_colour1(global.p1, c_white);
part_type_alpha1(global.p1, 1);
part_type_orientation(global.p1, 0, 0, 0, 0, 1);
part_type_life(global.p1, 10, 20);

//Confetti Particles
global.p2 = part_type_create();
part_type_sprite(global.p2, spr_confetti, true, true, true);
part_type_size(global.p2, 1, 2, -0.04, 0);
part_type_scale(global.p2, 1, 1);
part_type_life(global.p2, 90, 140);

//Snow Particles
global.p3 = part_type_create();
part_type_sprite(global.p3, back_peak_snow, false, false, true);
part_type_size(global.p3, 0.1, 2, -0.01, 0.01);
part_type_life(global.p3, 600, 800);
part_type_alpha2(global.p3, 1, 0);