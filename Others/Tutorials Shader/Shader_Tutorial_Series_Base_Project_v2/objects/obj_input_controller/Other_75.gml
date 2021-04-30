/// @description get pad connections
//	based on the yoyo games tech blog found at:
//	https://www.yoyogames.com/blog/75/how-to-setup-and-use-gamepads

show_debug_message("Event = " + async_load[? "event_type"]);        // Debug cocde so you can see which event has been
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   // triggered and the pad associated with it.

switch(async_load[? "event_type"])  {								// Parse the async_load map to see which event has been triggered
	case "gamepad discovered":										// A game pad has been discovered
	    var pad = async_load[? "pad_index"];						// Get the pad index value from the async_load map
	    gamepad_set_axis_deadzone(pad, stick_threshold);			// Set the "deadzone" for the axis
	    gamepad_set_button_threshold(pad, trigger_threshold);		// Set the "threshold" for the triggers
		var pad_desc = gamepad_get_description(pad);
		if	(pad_desc != "sec_touchkey") &&							// Android detects a new pad if back button is tapped or pressed for a while
			(pad_desc != "Virtual")									// They're called "sec_touchkey" and "Virtual" - ignore these
				global.gamepad_device = pad;
		break;
	
	case "gamepad lost":											// Gamepad has been removed or otherwise disabled
	    var pad = async_load[? "pad_index"];						// Get the pad index
	    if (pad == global.gamepad_device)							
			global.gamepad_device = -1;
	    break;
}
