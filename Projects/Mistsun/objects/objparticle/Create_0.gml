partTypes = [];

addPartType = function(_parttype)
{
	array_push(partTypes, _parttype)
}


global.PSEffects = part_system_create_layer("ParticleEffects", true);

var _p = part_type_create();

part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 20, 40);
part_type_alpha2(_p, 1, 0.6);

// going to edit
part_type_direction(_p, 0, 0, 0, 0);
part_type_speed(_p, 0, 0, 0, 0);


global.PTPixel = _p;

addPartType(global.PTPixel);

// enum PartType
// {
// 	pixel,
// }

// type = PartType.pixel;

// switch (type)
// {
// 	case PartType.pixel:
// 		sprite_index = sprPixel;
// 	break;
// }

// spd = 1;
// decel = 0.05;