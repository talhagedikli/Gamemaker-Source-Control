/// @desc CLASSES

#region Player
function TweenerGuy() : Class() constructor
{

// Create
	create = function()
	{
		x = 64; 
		y = 64;
		type = TweenType.BackEaseOut;
		tween = new Tween(type, x, x+64, 60);
		tween.start();
		fsm = new SnowState("walk");
	
		fsm.add("walk", {
			enter: function()
			{
			
			},
			stepp: function()
			{
				x = tween.getValue();
				if (tween.isFinished())
				{
					tween.start(x, x+32);
					show(self.id);
				}		
			},
			draww: function()
			{
				draw_sprite(sprSkeleton, 0, x, y);	
			}
		});	
	}
// Step	
	step = function()
	{
		fsm.stepp();
	}

// Draw
	draw = function()
	{
		fsm.draww();
	}
}
#endregion

#region Managers
function Camera() : Class() constructor
{
// Create
	create = function()
	{
		#region INITIALIZATION
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

		#region STATE MACHINE
		ffsm = new SnowState("normal");
		
		ffsm.add("normal", {
			enter : function()
			{
				
			},
			step_end : function()
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
				ApplyScreenShake();
				camera.setPosition(floor(x), floor(y));
				if (!surface_exists(self.surView)) {
					surView = surface_create(width + 1, height + 1);
				}
				view_surface_id[0] = surView;		
			}
		});
		#endregion

		#region METHODS
		ApplyScreenShake = function()
		{
			if (shake)
			{
				//reduce shake time by 1(every step)
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
		/// @param {real} _time
		/// @param {real} _magnitude
		/// @param {real} _fade
		function Shake(_time, _magnitude, _fade = _magnitude)
		{
			shakeTime		= _time;
			shakeMagnitude	= _magnitude;
			shakeFade		= _fade;
			shake			= true;
		}
		/// @param {ID.Instance} _id
		function Follow(_id)
		{
			following = _id;
		}
		#endregion
	}
	
// EndStep
	endStep = function()
	{
		//fsm.StepEnd();
		ffsm.step_end();
	}
	
// Draw Gui Begin
	drawGuiBegin = function()
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
	cleanUp = function()
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
	create = function()
	{
		persistent	= true;
		// Defaults

		// These values will be used in step event for all other objects
		p1 = {
			horizontalInput		: false,
			verticalInput		: false,
	
			keyRight			: false,
			keyLeft				: false,
			keyDown				: false,
			keyUp				: false,
	
			keyJump 			: false,
			keyJumpPressed 		: false,

			keyDashPressed		: false,
			keyRun				: false,
	
			keyRightPressed 	: false,
			keyLeftPressed		: false,
			keyDownPressed		: false,
			keyUpPressed		: false,	
		}		
	}
	
// Step
	beginStep = function()
	{
		if (active) 
		{
			with (p1)
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
			}
		} 		
	}
}
#endregion

#region Class Core
function Class() constructor
{
	create			= undefined;
	stepBegin		= undefined;
	step			= undefined;
	stepEnd			= undefined;
	destroy			= undefined;
	cleanUp			= undefined;
	draw			= undefined;
	drawGuiBegin	= undefined;
}
function class_create_layer(_x, _y, _layer, _class)
{
	instance_create_layer(_x, _y, _layer, objClass, _class);	
}
function class_create_depth(_x, _y, _depth, _class)
{
	instance_create_depth(_x, _y, _depth, objClass, _class);	
}
#endregion

