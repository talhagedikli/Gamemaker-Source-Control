/// @description 
var onCard = instance_place(mouse_x, mouse_y, objPlayer);


if (onCard) {
	image_xscale = lerp(image_xscale, 1.3, 0.6);
	image_yscale = lerp(image_yscale, 1.3, 0.6);
} else {
	image_xscale = lerp(image_xscale, 1, 0.6);
	image_yscale = lerp(image_yscale, 1, 0.6);
}