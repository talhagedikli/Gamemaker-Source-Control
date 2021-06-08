/// @description 
if (room == rTitle) { // TITLE ROOM
	
}
else if (room == rWorld) { // WORLD ROOM
	randomize();
	while (!place_meeting(x, y, objBlock) && !place_meeting(x, y, objPlayer) 
											&& instance_number(objBlock) < 50 ) {
		var bl = instance_create_layer(irandom(room_width div 32) * 32, 
										irandom(room_height div 32) * 32, "Collisions", objBlock);
	
		bl.image_xscale = irandom_range(1, 4);
		bl.image_yscale = irandom_range(1, 4);
	}	
	if (!place_meeting(x, y, objBlock) && !instance_exists(objPlayer)) {
		instance_create_layer(irandom(room_width), irandom(room_height), "Player", objPlayer);
		
	}
	
}