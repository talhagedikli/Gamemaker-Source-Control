/// @description 
var vmove		= mgrInput.p.keyDownPressed - mgrInput.p.keyUpPressed;
var keyaccept	= keyboard_check_pressed(vk_space);
var menul		= array_length(menu[menuLevel])
var rm			= Control.Manager.Room;
var im			= Control.Manager.Input;

if (abs(im.p.verticalInput) or keyaccept) alphaxTimer.reset();
pos	+= vmove;
if (pos >= menul) { pos = 0 };
if (pos < 0) { pos = menul - 1 };

if (menuLevel != lastMenuLevel)
{
	writer.reset();
	lastMenuLevel = menuLevel;
}

alphaxTimer.on_timeout(function()
{
	alphaxTimer.reset();
});

if (menuLevel == menus.main) {
	if (pos == 0 && keyaccept) {
		menuLevel = menus.start;
	}
	
	if (pos == 1 && keyaccept) {
		menuLevel = menus.settings;
		pos = 0;
	}
	if (pos == 2 && keyaccept) {
		game_end();
	}
} 
else if (menuLevel == menus.settings) {
	if (pos == 0 && keyaccept) {
	}
	
	if (pos == 1 && keyaccept) {

	}
	if (pos == 2 && keyaccept) {
		menuLevel = menus.main;
		pos = 0;
	}
}
else if (menuLevel == menus.start) {
	if (pos == 0 && keyaccept) {
		rm.change(rWorld);
	}
	
	if (pos == 1 && keyaccept) {

	}
	if (pos == 2 && keyaccept) {
		menuLevel = menus.main;
		pos = 0;
	}
}