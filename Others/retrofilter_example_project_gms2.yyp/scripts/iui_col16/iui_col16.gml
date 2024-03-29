/// @description iui_col16( RRGGBB_HEX )
/// @param  RRGGBB_HEX 
function iui_col16(argument0) {
	/**
	    Converts big-endian hex colour to little-endian for GM to use.
    
    
	    ======================================
    
	    RRGGBB_HEX - The hexadecimal colour coded in : $RRGGBB
	**/

	return ((argument0&$0000FF)<<16) | (argument0&$00FF00) | ((argument0&$FF0000)>>16);



}
