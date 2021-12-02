#macro vc0				view_camera[0]
#macro VIEW				view_camera[0]
#macro GUI				global.__gui
#macro WINDOW			global.__window
#macro DISPLAY			global.__display
#macro CAMERA			global.__camera
#macro GAME_RESOLUTION	new Vec2(320, 180)
#macro WINDOW_SCALE		4
global.__camera = 
{
	width : camera_get_view_width(VIEW),
	height : camera_get_view_height(VIEW),
	x : camera_get_view_x(VIEW), 
	y : camera_get_view_y(VIEW),
	GetPos : function()
	{
		return new Vec2(camera_get_view_x(VIEW), camera_get_view_y(VIEW));
	},
	GetSize : function()
	{
		return new Vec2(camera_get_view_width(VIEW), camera_get_view_height(VIEW));
	},
	SetPos : function(_x, _y)
	{
		camera_set_view_pos(VIEW, _x, _y);
		x = _x;
		y = _y;
	},
	SetSize : function(_w, _h)
	{
		camera_set_view_size(VIEW, _w, _h);
		width = _w;
		height = _h;
	}
}
global.__view = 
{
	x : 0,
	y : 0,
	width : CAMERA.GetSize().x,
	height : CAMERA.GetSize().y
}
global.__gui = 
{
	width : display_get_gui_width(),
	height : display_get_gui_height(),
	center : new Vec2(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5),
	GetCenter : function()
	{
		return new Vec2(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5);	
	},
	GetSize : function()
	{
		return new Vec2(display_get_gui_width(), display_get_gui_height());
	},
	SetSize : function(_w = GAME_RESOLUTION.x, _h = GAME_RESOLUTION.y)
	{
		display_set_gui_size(_w, _h);
		width = _w;
		height = _h;
		center = new Vec2(width * 0.5, height * 0.5);
	},
	ResetSize : function()
	{
		SetSize(GAME_RESOLUTION.x, GAME_RESOLUTION.y);	
	}
}
global.__window = 
{
	fullscreen : false,
	width : window_get_width(),
	height: window_get_height(),	
	center: new Vec2(window_get_width() * .5, window_get_height() * .5),
	GetCenter : function()
	{
		return new Vec2(window_get_width() * .5, window_get_height() * .5);
	},
	GetSize : function()
	{
		return new Vec2(window_get_width(), window_get_height());
	},
	SetSize : function(w,h)
	{
		if ( argument_count > 2 ) { fullscreen = argument[2]; }
		var ww, hh;
		ww = w;
		hh = h;
		
		if ( fullscreen )
		{
			ww = DISPLAY.width;
			hh = DISPLAY.height;
		}
		
		window_set_size(ww,hh);
		width	= ww;
		height	= hh;
		center	= { x : ww*.5, y: hh*.5 };
		
		window_set_position(
			DISPLAY.center.x - center.x,
			DISPLAY.center.y - center.y
		);		
	}
}
global.__display = 
{
	width	: display_get_width(),
	height	: display_get_height(),
	center	: { x : display_get_width()*.5, y : display_get_height()*.5 }
}