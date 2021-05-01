/// @description 
width	= 64;
height	= 104;

opBorder	= 8;
opSpace		= 16;

pos		= 0;

#macro MAIN		0
#macro SETTINGS 1
#macro START	2

global.dsmSettings = ds_map_create();
#macro set		global.dsmSettings

ds_map_add(set, "sound", 5);

option[MAIN][0] = "Start Game";
option[MAIN][1] = "Settings";
option[MAIN][2] = "Quit Game";

//Start Game menu
option[START][0] = "World";
option[START][1] = "Deck";
option[START][2] = "Back";

//Settings menu
option[SETTINGS][0] = "Window Size";
option[SETTINGS][1] = "Resolution";
option[SETTINGS][2] = "Brightness";
option[SETTINGS][3] = "Back";

opLength	= 0;
menuLevel	= 0;







