/// @description 

// Inherit the parent event
event_inherited();

if myLight == noone
	myLight = instance_create_layer(x, y, "lighting", objCircularLight);
	
myLight.image_xscale = 2;
myLight.image_yscale = 2;
myLight.image_blend = c_aqua;