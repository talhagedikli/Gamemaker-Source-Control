#region// Camera
#macro VIEW		view_camera[0]

#macro GUI_W	display_get_gui_width()
#macro GUI_H	display_get_gui_height()

#macro CAM_W	camera_get_view_width(VIEW)
#macro CAM_H	camera_get_view_height(VIEW)

#macro CAM_X	camera_get_view_x(VIEW)
#macro CAM_Y	camera_get_view_y(VIEW)

#macro APP_W	surface_get_width(application_surface)
#macro APP_H	surface_get_height(application_surface)

#macro WIN_W	window_get_width()							
#macro WIN_H	window_get_height()

#macro DIS_W	display_get_width()							// The actual width of the monitor
#macro DIS_H	display_get_height()						// The actual height of the monitor
#endregion

#region// General 
#macro FLIP_COIN		choose(true, false)
#macro EPSILON			0.0001

#macro log				debug_message
#macro show		 		screen_message
#macro here				show("here")

#macro ignore			if (true) { } else
#macro defer			for (;; {
#macro after			; break; })	  
//#macro func				function()

#macro SHOW_COLLISIONS		true
#macro ACTIVATE_COLLISIONS	true

//defer {
//	show("second");
//} after {
//	show("first");	
//}

//#macro BUILTIN_SHOW_DEBUG_MESSAGE show_debug_message
//#macro show_debug_message overrides_show_debug_message

//function overrides_show_debug_message(_str) {
//  BUILTIN_SHOW_DEBUG_MESSAGE(_str); // call the original implementation
//  var file = file_text_open_append("game.log");
//  file_text_write_string(file, _str);
//  file_text_writeln(file);
//  file_text_close(file);
//}

#endregion

#region Vectors
#macro VECTOR2_ZERO		new Vector2(0, 0)
#macro VECTOR2_RANDOM	new Vector2(lengthdir_x(1, random(360), lengthdir_y(1, random(360))

#endregion

#region// Colours
#macro C_CRIMSON		make_color_rgb(184, 15, 10)
#macro C_LMCHIFFON		make_color_rgb(255, 249, 204)
#macro C_BARNRED		make_color_rgb(124, 10, 2)
#macro C_DARKCHARCOAL	make_color_rgb(51, 51, 51)
#macro C_ONYX			$0f0f0f
#macro C_SMOKY_BLACK	$080C10
#macro C_ANCHOR			$4c4241
#macro C_SHADOW			$373737
#macro C_LEAD			$4e3f3f
#macro C_DAISY			$fafafa
#macro C_CHIFFON		$faf2fb
#macro C_RANDOM			make_colour_hsv(irandom(255), irandom(255), irandom(255))
#macro C_SPACE_BLUE		make_color_rgb(0.2*255, 0.3*255, 0.5*255);
#endregion