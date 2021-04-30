/// @description sdm(string)
/// @param string
function sdm(argument0) {
	//Shows a debug message.

	//Get date, time and the string to display.
	var d, date, time, final_string;
	d = date_current_datetime();
	date = string(date_get_month(d))+"_"+string(date_get_day(d))+"_"+string(date_get_year(d));
	time = "["+string(date_get_hour(d))+":"+string(date_get_minute(d))+":"+string(date_get_second(d))+"] ";
	final_string = time+string(argument0);

	//Show debug
	show_debug_message(final_string);

	//Log it to a file
	if (global.debug_logging)
	    {
	    var file;
	    file = file_text_open_append(global.debug_file+date+".txt");
	    if (file != -1)
	        {
	        file_text_write_string(file,final_string);
	        file_text_writeln(file);
	        file_text_close(file);
	        } else {
	        show_debug_message("ERROR: Cannot open log file for writing. Logging has been disabled.");
	        global.debug_logging = false;
	        }
	    }




}
