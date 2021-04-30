/// @description set alarm
//-----------------------------------------------------------------------------
//	This object is a modifier.
//	Every instance of 
//		- toggle buttons
//		- trigger buttons
//		- sliders
//		- sliders automation buttons
//		- maybe more, check the manual
//	colliding with this in the room editor will be destroyed right away.
//
//	More objects can be added. Just place this code to their create event
//	(create event, not in an inherited event and not in a script):
//		if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}
//-----------------------------------------------------------------------------

alarm[0] = 1;

