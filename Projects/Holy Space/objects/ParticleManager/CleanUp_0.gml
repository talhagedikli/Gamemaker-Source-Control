/// @description 
part_type_destroy(global.ptDirt);
part_type_destroy(global.ptDashPixels);
part_type_destroy(global.ptBasic);
part_type_destroy(global.ptDeathExplosion);
part_type_destroy(global.ptTrail);
part_type_destroy(global.ptGhostDash);
part_type_destroy(objPlayer.ptExhaust);

part_system_clear(global.partSystem);

part_system_destroy(global.partSystem);

