/// @description Init
//-----------------------------------------------------------------------------
//	This object handles input and drawing of all buttons.
//	Some children might override this objects code.
//	Specific buttons can use user event 0 as action
//	Generic buttons like sliders, triggers and toggles use getter and setter
//	scripts instead
//-----------------------------------------------------------------------------

mouse_over		= false;
mouse_down		= false;
mouse_pressed	= false;
mouse_released	= false;

caption		= "";

button_sys_set_dimensions();