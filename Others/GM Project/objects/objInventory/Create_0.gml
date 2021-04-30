//
guiW = display_get_gui_width();
guiH = display_get_gui_height();


cellSize = guiH/9;

//inventory
invW = sprite_get_width(sprInventory);
invH = sprite_get_height(sprInventory);
invScale = 1;
invX = guiW/2 - invW/2;
invY = guiH/2 - invH/2;


//heart
hrtX = guiW/16/2;
hrtY = 8*guiH/9;
hrtScale = 2;

//hide/show hud
showHud = false;