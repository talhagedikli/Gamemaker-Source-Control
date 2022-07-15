function CoreInstance() : Class() constructor
{
	event_create = function()
	{
		log("-----------------------------------", "Game Started");
		// Make sure i am created firs
		if (instance_number(self.object_index) > 1)
		{
			show("ERROR: MULTIPLE CONTROL OBJECT EXISTS");
			instance_destroy();
			exit;
		}



		cm			= instance_create_layer(x, y, layer, objManager, new Camera());
		in			= instance_create_layer(x, y, layer, objManager, new Input());



		//var i = 0 repeat(TweenType.Length-1)
		//{
		//	var ins = instance_create_layer(16, 16+i*16, layer, objTweener);
		//	ins.type = i;
		//	i++;
		//}
		instance_create_layer(x, y, layer, objPlayer, new TweenerGuy());


		// Methods
		function GameEnd()
		{
			log("-----------------------------------", "Game Ended");
			game_end();
		}

		function GameRestart()
		{
			log("-----------------------------------", "Game Restarted");
			game_restart();
		}
		
		event_step = function()
		{
			if (in.p1.keyQuit)
			{
				GameEnd();	
			}
			
			if (in.p1.keyRestart)
			{
				GameRestart();	
			}
		}
	}
	
}

function Camera() : Class() constructor
{
	// View
	static viewGetSize = function()
	{
		return new Vector2(camera_get_view_width(VIEW), camera_get_view_height(VIEW));	
	}
	
	static viewGetPosition = function()
	{
		return new Vector2(camera_get_view_x(VIEW), camera_get_view_y(VIEW));	
	}
	
	static viewSetPosition = function(_x, _y)
	{
		camera_set_view_pos(VIEW, _x, _y);
	}
	
	static viewSetSize = function(_w, _h)
	{
		camera_set_view_size(VIEW, _w, _h);
	}
	
	// GUI
	static guiGetSize = function()
	{
		return new Vector2(display_get_gui_width(), display_get_gui_height());	
	}
	
	static guiGetCenter = function()
	{
		return new Vector2(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5);
	}
	
	static guiGetSize = function(_w, _h)
	{
		display_set_gui_size(_w, _h);
	}
	
	static guiResetSize = function()
	{
		display_set_gui_size(DATA_VIEW.guiResolution.x, DATA_VIEW.guiResolution.y);
	}
	// Display
	static displayGetSize = function()
	{
		return new Vector2(display_get_width(), display_get_height());
	}
	
	static displayGetCenter = function()
	{
		return new Vector2(display_get_width()*.5, display_get_height()*.5);
	}
	// Window
	static windowGetSize = function()
	{
		return new Vector2(window_get_width(), window_get_height());
	}
	
	static windowGetCenter = function()
	{
		return new Vector2(window_get_width() * .5, window_get_height() * .5);
	}
	
	static windowSetSize = function(_w, _h)
	{
		if ( argument_count > 2 ) { fullscreen = argument[2]; }
		var ww, hh;
		ww = _w;
		hh = _h;
		
		if ( fullscreen )
		{
			var ds = display.getSize();
			ww = ds.x;
			hh = ds.y;
		}
		
		window_set_size(ww,hh);
		var cc = display.getCenter();
		var dc = display.getCenter();
		window_set_position(
			dc.x - cc.x,
			dc.y - cc.y
		);	
	}
	
	static data =
	{
		gameResolution:		new Vector2(640, 360),
		guiResolution:		new Vector2(1280, 720),
		gridSize:			new Vector2(32),
		windowScale:		2
	}
// Create
	event_create = function()
	{
		#region INITIALIZATION
		enum CamStates {
			normal,
			zoom,
		}
		state = CamStates.normal;
		persistent = true;
		// Center the window after a frame
		var _center_window = function()
		{
			window_center();	
		}
		var t = time_source_create(time_source_game, 1, time_source_units_frames, _center_window);
		time_source_start(t);
		
		application_surface_enable(false);
		// viewWidth, viewHeight are your base resolution (ideally constants)
		following = noone;

		width	= DATA_VIEW.gameResolution.x;
		height	= DATA_VIEW.gameResolution.y;
		scale	= DATA_VIEW.windowScale;
		//camera_set_view_size(VIEW, viewWidth, viewHeight);
		//surface_resize(application_surface, viewWidth, viewHeight);
		camera.setSize(width + 1, height + 1);
		window.setSize(width * scale, height * scale);
		gui.setSize(width, height);

		// View surface
		surView = -1;

		// Screenshake
		shake			= false;
		shakeTime		= 0;
		shakeMagnitude	= 0;
		shakeFade		= 0;
		#endregion

		#region METHODS
		stateChange = function(_state, _method)
		{
			if (_method!=undefined) _method();
			state = _state;
		}
		applyScreenShake = function()
		{
			if (shake)
			{
				//reduce shake time by 1(every event_step)
				shakeTime -= 1;
			
				//calculate shake magnitude
				var _xval = random_range(-shakeMagnitude, shakeMagnitude); 
				var _yval = random_range(-shakeMagnitude, shakeMagnitude);
			
				//apply the shake
				x += _xval;
				y += _yval;
			
				if (self.shakeTime <= 0) 
				{
					//if shake time is zero, shake fade
					shakeMagnitude -= shakeFade; 

					if (shakeMagnitude <= 0) 
					{
						//if shake fade is zero, turn shake of
					    shake = false; 
					} 
				}
			}
		}
		shake = function(_time, _magnitude, _fade = _magnitude)
		{
			shakeTime		= _time;
			shakeMagnitude	= _magnitude;
			shakeFade		= _fade;
			shake			= true;
		}
		#endregion
	}
	
// EndStep
	event_step_end = function()
	{
		if (state == CamStates.normal)
		{
			var xTo, yTo;
			if (instance_exists(self.following))
			{
					
				xTo = round(following.x) - (self.width / 2);
				yTo = round(following.y) - (self.height / 2);
			}
			else
			{
				xTo = x;
				yTo = y;
			}
			x = lerp(x, xTo, 0.1);
			y = lerp(y, yTo, 0.1);
			applyScreenShake();
			camera.setPosition(floor(x), floor(y));
			if (!surface_exists(self.surView)) {
				surView = surface_create(width + 1, height + 1);
			}
			view_surface_id[0] = surView;				
		}
	}
	
// Draw Gui Begin
	event_draw_gui_begin = function()
	{
		if (surface_exists(surView)) {
		    //draw_surface_part(view_surf, frac(x), frac(y), viewWidth, viewHeight, 0, 0);
			//draw_surface_part(view_surf, frac(x), frac(y), viewWidth, viewHeight, 0, 0);
			//var ax = camera_get_view_x(VIEW) - x;
			//var ay = camera_get_view_y(VIEW) - y;
			//draw_surface(view_surf, ax, ay);
			// draw_surface(view_surf, 0, 0);
			draw_surface(surView, -frac(x), -frac(y));
			 //draw_surface_part(surView, frac(x), frac(y), width, height, 0, 0);
		}	
	}
	
// CleanUp
	event_cleanup = function()
	{
		if (surface_exists(surView)) {
		    surface_free(surView);
		    surView = -1;
		}	
	}
}

function Input() : Class() constructor
{
// Create
	event_create = function()
	{
		persistent	= true;
		// Defaults
		active = true;
		// These values will be used in event_step event for all other objects
		horizontalInput		= false;
		verticalInput		= false;
							
		keyRight			= false;
		keyLeft				= false;
		keyDown				= false;
		keyUp				= false;
							
		keyJump 			= false;
		keyJumpPressed 		= false;
							
		keyDashPressed		= false;
		keyRun				= false;
							
		keyRightPressed 	= false;
		keyLeftPressed		= false;
		keyDownPressed		= false;
		keyUpPressed		= false;
							
		keyQuit				= false;
		keyRestart			= false;
	}
	
// Step
	event_step_begin = function()
	{
		if (active) 
		{
			horizontalInput		= (keyboard_check(vk_right) - keyboard_check(vk_left));		// Will be -1, 0 or 1
			verticalInput		= (keyboard_check(vk_down) - keyboard_check(vk_up));		// Will be -1, 0 or 1

			keyRight			= keyboard_check(vk_right);
			keyLeft				= keyboard_check(vk_left);
			keyDown				= keyboard_check(vk_down);
			keyUp				= keyboard_check(vk_up);
		
			keyJump 			= keyboard_check(vk_space);	
			keyJumpPressed 		= keyboard_check_pressed(vk_space);	
			keyDashPressed		= keyboard_check_pressed(ord("Z"));
			keyRun				= keyboard_check(ord("B"));

			keyRightPressed 	= keyboard_check_pressed(vk_right);
			keyLeftPressed		= keyboard_check_pressed(vk_left);
			keyDownPressed		= keyboard_check_pressed(vk_down);
			keyUpPressed		= keyboard_check_pressed(vk_up);
				
			keyQuit				= keyboard_check_pressed(vk_escape);
			keyRestart			= keyboard_check_pressed(ord("R"));
		} 		
	}
}
