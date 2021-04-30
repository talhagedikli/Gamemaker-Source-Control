function ui_step() {
	if (keyboard_check_pressed(ord("R"))){
	    for (var i = 0; i < array_length_1d(attr); i++){
	        if (i != prop.intensity){
	            valTo[i]  = random_range(limit[i, 0], limit[i, 1]); 
	        }
	    }   
	}

	for (var i = 0; i < array_length_1d(attr); i++){
	    attr[i] += (valTo[i] - attr[i]) * .25;
	}  

	if (keyboard_check_pressed(ord("C"))) {
	    var _str = @"
	BktGlitch_set_intensity(" + string_format(attr[prop.intensity], 0, 6)  + ");" + @"
	BktGlitch_set_line_shift(" + string_format(attr[prop.lineShift], 0, 6)  + ");" + @"
	BktGlitch_set_line_speed(" + string_format(attr[prop.lineSpeed], 0, 6)  + ");" + @"
	BktGlitch_set_line_resolution(" + string_format(attr[prop.lineResolution], 0, 6)  + ");" + @"
	BktGlitch_set_line_drift(" + string_format(attr[prop.lineDrift], 0, 6)  + ");" + @"
	BktGlitch_set_line_vertical_shift(" + string_format(attr[prop.lineVertShift], 0, 6)  + ");" + @"
	BktGlitch_set_noise_level(" + string_format(attr[prop.noiseLevel], 0, 6)  + ");" + @"
	BktGlitch_set_jumbleness(" + string_format(attr[prop.jumbleness], 0, 6)  + ");" + @"
	BktGlitch_set_jumble_speed(" + string_format(attr[prop.jumbleSpeed], 0, 6)  + ");" + @"
	BktGlitch_set_jumble_resolution(" + string_format(attr[prop.jumbleResolution], 0, 6)  + ");" + @"
	BktGlitch_set_jumble_shift(" + string_format(attr[prop.jumbleShift], 0, 6)  + ");" + @"
	BktGlitch_set_channel_shift(" + string_format(attr[prop.channelShift], 0, 6)  + ");" + @"
	BktGlitch_set_channel_dispersion(" + string_format(attr[prop.dispersion], 0, 6)  + ");" + @"
	BktGlitch_set_shakiness(" + string_format(attr[prop.shakiness], 0, 6)  + ");" + @"
	BktGlitch_set_rng_seed(" + string_format(attr[prop.rngSeed], 0, 6)  + @");
	//////
	Alternatively:
	BktGlitch_config(" + string_format(attr[prop.lineShift], 0, 6) + ", " + string_format(attr[prop.lineSpeed], 0, 6) + ", " + string_format(attr[prop.lineResolution], 0, 6) + ", " + string_format(attr[prop.lineDrift], 0, 6) + ", " +  string_format(attr[prop.lineVertShift], 0, 6) + ", " + string_format(attr[prop.jumbleness], 0, 6) + ", " + string_format(attr[prop.jumbleSpeed], 0, 6) + ", " + string_format(attr[prop.jumbleResolution], 0, 6) + ", " + string_format(attr[prop.jumbleShift], 0, 6) + ", " + string_format(attr[prop.noiseLevel], 0, 6) + ", " + string_format(attr[prop.channelShift], 0, 6) + ", " + string_format(attr[prop.dispersion], 0, 6) + ", " + string_format(attr[prop.shakiness], 0, 6) + ", " + string_format(attr[prop.intensity], 0, 6) + ", " + string_format(attr[prop.rngSeed], 0, 6) + ");";     

	    if (os_browser == browser_not_a_browser){
	        clipboard_set_text(_str);
	        show_message("The current configuration has been copied into your clipboard.");
	    }else{
	        get_string("Copy and paste this into your code.", _str);
	    }
	}







}
