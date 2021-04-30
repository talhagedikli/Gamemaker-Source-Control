/// @description Init
//-----------------------------------------------------------------------------
//	This object draws the mouse coordinates on GUIand in room to the screen.
//-----------------------------------------------------------------------------

// Apply kill modifier - optional:
//-----------------------------------------------------------------------------
if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}


// TEXT & COORINATES:
//-----------------------------------------------------------------------------
xx			= x - sprite_width  * 0.5;
yy			= y - sprite_height  * 0.5;
caption		= "GUI:\nRoom:";
xoffset		= string_width(caption) + 4;
mouse_text	= "";

