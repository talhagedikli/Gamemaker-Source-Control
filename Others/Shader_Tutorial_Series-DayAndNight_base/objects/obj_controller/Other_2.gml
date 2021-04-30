/// @description OS specifics

if (os_type == os_windows || os_type == os_linux || os_type == os_macosx) {
	display_reset(4, true);
} else {
	display_reset(0, false);
	os_powersave_enable(true);
}

