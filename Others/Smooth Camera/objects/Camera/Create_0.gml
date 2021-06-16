//width and height 480*270
viewWidth		=	480
viewHeight		=	270
windowScale		=	2;

camX	= 0;
camY	= 0;

// this will be target game resolution:
game_width = viewWidth;
game_height = viewHeight;

// prevent default scaling behaviour:
window_set_size(viewWidth*windowScale, viewHeight*windowScale);
alarm[0] = 1;
surface_resize(application_surface, viewWidth * windowScale, viewHeight * windowScale);
display_set_gui_size(viewWidth * windowScale, viewHeight * windowScale);

smooth = false;
view_surf = -1;
