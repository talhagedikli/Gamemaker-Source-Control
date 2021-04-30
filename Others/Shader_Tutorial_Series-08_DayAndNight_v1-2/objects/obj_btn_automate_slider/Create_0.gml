/// @description Init
//-----------------------------------------------------------------------------
//	This object toggles the automation type of a slider instance.
//
//	IMPORTANT:
//	Do not place an instance of this object yourself. It will be created by the
//	slider object. to the left or right of the slider depending on where the 
//	centre of the slider is:
//		- slider center < GUI center -> automation button right of slider
//		- slider center > GUI center -> automation button left of slider
//	If you don't want the automation button, place a kill modifier over the  
//	area where the automation button would appear.
//-----------------------------------------------------------------------------

event_inherited();

slider_id = -1; // will be set by the slider

sprite[2] = spr_btn_automate_0101;
sprite[1] = spr_btn_automate_0110;
sprite[0] = spr_btn_automate_off;

current_sprite = 0;
max_sprites = array_length_1d(sprite);

if (instance_place(x, y, mod_KILL) != noone) instance_deactivate_object(id);
