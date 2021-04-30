/// @description Initialize

//Logging
//I reccomend turning this off before you release your game.
global.debug_logging = true;
global.debug_file = "logs/log";
sdm("Initializing...");

//Graphics
base_resolution_x = 320;
base_resolution_y = 240;
game_speed = 60;

//Graphical settings
//Load from an ini file
//You can change the default values here
config_file = "config.ini";
ini_open(config_file);
fullscreen = ini_read_real("graphics","fullscreen",false);
full_scale = ini_read_real("graphics","full_scale",false);
keep_ratio = ini_read_real("graphics","keep_ratio",true);
scale = ini_read_real("graphics","scale",2);
scale_max = ini_read_real("graphics","scale_max",4);
save_graphics = true;
ini_close();

//Hotkeys
key_ratio = vk_f8;
key_full_scale = vk_f9;
key_scaleup = vk_f10;
key_fullscreen = vk_f11;
key_restart = vk_f12;
key_quit = vk_escape;

//# of steps it takes to close game by holding key_quit
quit_full = 10;

//Resize the window according to starting scale
window_set_fullscreen(fullscreen);
if (!fullscreen)
    {
    window_resize();
    }

//Don't change these ones.
hud_surface = -1;
application_surface_draw_enable(false);
notification = "";
quit = quit_full;
dx = 0; dy = 0;
xs = 1; ys = 1;
//Continue to next room
alarm[0] = 1;

//Check to see if shaders are supported.
global.shaders = true;
if (!shaders_are_supported())
    {
    global.shaders = false;
    notify("ERROR: Shaders not supported! Please install DirectX End-User Runtime. Shaders are disabled.",room_speed*3);
    }

sdm("Game initialized! Launching...");

