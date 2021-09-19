///MACROS
#macro version "Beta 0.6.1"
#region Game Constants
#macro debug							false
#macro show_hitboxes					false
#macro show_hurtboxes					false
#macro show_collision_boxes				false
#macro show_launch_trajectories			false

//Max Number of Players
#macro max_players						8

//Game Types
#macro airdodge_type					AIRDODGE.melee
#macro shield_type						SHIELD.ultimate
#macro wall_jump_type					WALL_JUMP.rivals

//Window
#macro window_width						1984 //1984
#macro window_height					1300 //1300

//Camera
#macro camera_width						960 //960
#macro camera_height					544 //544
#macro camera_boundary					120
#macro camera_move_speed				0.1
#macro camera_y_offset					-16

//Camera Zoom
#macro camera_enable_zoom				false
#macro camera_ratio						(camera_width / camera_height)
#macro camera_zoom_pad_scale			1.7
#macro camera_zoom_pad_xscale			0.0
#macro camera_zoom_pad_yscale			0.1
#macro camera_max_width					(room_width)
#macro camera_max_height				(room_width / camera_ratio)
#macro camera_min_width					480
#macro camera_min_height				272
#macro camera_zoom_speed_out			0.02
#macro camera_zoom_speed_in				0.05

//Finishing Blow Zoom
#macro camera_enable_special_zoom		false
#macro camera_special_zoom_speed_out	0.15
#macro camera_special_zoom_speed_in		0.4
#macro camera_special_zoom_width		480
#macro camera_special_zoom_height		272

//Player status
#macro player_status_padding_bottom		54

//Game surface
#macro game_surface_enable				true //Allows you to use screen effects, such as the daynight cycle

//Outlines
#macro player_outline					true
#macro projectile_outline				false
#macro entity_outline					true

//Backgrounds
#macro back_clear						-1

//Savefiles
#macro profiles_save					"profiles.sav"

//Replays
#macro replay_sync_mode					true //whether to save extra data in replays to catch desyncs or not

//Countdown Time
#macro count_time						50

//End Time
#macro end_time							180

//Pausing
#macro allow_pausing					true

//VFX
#macro knockback_cloud_trails_enable	true

//Profile Names
#macro profile_name_max_length			12

#endregion
#region Player Macros
	#region Controls + Input
	
	//Custom Controls
	#macro number_of_buttons				12

	//Input buffer length
	#macro buff								6
	#macro max_buffer_length				60
	#macro tech_buffer_time					20
	#macro tech_lockout_time				40
	#macro tech_buffer_before_hitstun		true //Controls if the tech buffer is cleared when hitstun starts or not
	
	//Number of gamepads supported
	#macro number_of_devices				14
	
	//Number of keyboards supported (you need an extension to support more than 1!)
	#macro number_of_keyboards				1
	
	//Stick checking type (default)
	#macro stick_check_type					STICK_CHECK_TYPE.current
	
	//Input thresholds
	#macro stick_check_frames				3	//To check the stick speed, there has to be a value a certain number of frames before to compare with

	//Control stick general
	#macro Lstick							0
	#macro Rstick							1
	
	//Left Stick
	#macro stick_tilt_amount				0.4
	#macro stick_flick_speed				0.50
	#macro stick_flick_amount				0.75
	#macro stick_flick_buff					6
	#macro stick_flick_cooldown				1
	#macro stick_direction_sensitivity		65
	
	//Right stick
	#macro rstick_tilt_amount				0.4
	#macro rstick_flick_speed				0.4
	#macro rstick_flick_amount				0.7

	//Menu Buttons
	#macro menu_confirm_button				gp_face2
	#macro menu_cancel_button				gp_face1
	#macro menu_delete_button				gp_face4
	#macro menu_option_button				gp_face3
	#macro menu_ready_button				gp_start
	#macro menu_frame_advance_step_button	gp_start
	#macro menu_frame_advance_cancel_button	gp_select

	#macro menu_confirm_key					vk_enter
	#macro menu_cancel_key					vk_backspace
	#macro menu_delete_key					vk_control
	#macro menu_option_key					vk_shift
	#macro menu_left_key					vk_left
	#macro menu_right_key					vk_right
	#macro menu_up_key						vk_up
	#macro menu_down_key					vk_down
	#macro menu_ready_key					vk_space
	#macro menu_frame_advance_step_key		vk_enter
	#macro menu_frame_advance_cancel_key	vk_backspace 
	
	//Fastfalling
	#macro fastfall_buffer						12
	
	#endregion
	#region Attacking
	
	//Knockback
	#macro knockback_scaling_multiplier		0.12
	
	//Hitstun / Hitlag
	#macro hitstun_multiplier				0.85 //0.85
	#macro hitstun_base_multiplier			4 //4
	#macro hitstun_weight_multiplier		0.6
	#macro hitstun_damage_multiplier		0.24 //0.24
	#macro hitstun_knockback_multiplier		4 //4
	#macro hitlag_multiplier				0.7
	#macro hitlag_damage_multiplier			0.02
	#macro maximum_hitlag					120

	//Crouch cancel
	#macro crouch_cancel_multiplier			0.65
	
	//Damage
	#macro max_damage						999
	#macro show_damage_numbers				false
	
	//DI
	#macro default_knockback_angle			90
	#macro ASDI								4
	#macro DI_max							15
	#macro DI_correction_max				10
	#macro drift_DI_accel					0.15 //0.15
	#macro drift_DI_max						1
	
	//Sakurai angle
	#macro s_angle_knockback_threshold		10
	#macro s_angle_low_angle				0
	#macro s_angle_high_angle				40
	#macro s_angle_aerial_angle				45
	
	//Autolink
	#macro autolink_speed_multiplier		3
	
	//Landing
	#macro hard_landing_lag					20
	#macro default_attack_landing_lag		5
	#macro knockdown_lag_multiplier			0.5
	
	//Hitboxes
	#macro hitbox_groups					4
	
	//Smash Attack
	#macro smash_attack_max_charge			100
	#macro smash_attack_multiplier			0.65
	
	//Hitlag Increasing for super strong hits
	#macro finishing_blow_hitlag_increase	40
	
	//Hit turnaround - Makes it so players face whoever hits them
	#macro hit_turnaround					true
	
	//Magnetboxes
	#macro magnetbox_snap_speed				10
	
	//Grabbing
	#macro base_grab_time					30
	#macro grab_time_multiplier				0.5
	#macro grab_snap_speed					20
	
	//Grab releases
	#macro grab_release_hsp					4
	#macro grab_release_vsp					-8
	#macro grab_release_hitstun				20
	#macro grab_release_damage				3
	
	//Sounds
	#macro hit_sound_default				snd_hit_weak
	#macro hit_sound_pitch_variance			0.2
	
	//Balloon Knockback
	#macro balloon_speed_threshold			13
	#macro balloon_lower_frame				28
	#macro balloon_upper_frame				4
	#macro balloon_end_speed_multiplier		0.75
	
	//Debug
	#macro show_true_combos					false
	
	#endregion
	#region Collisions

	//Platform Collision checking type
	#macro platform_check_type				1
	
	//Platform snap threshold
	#macro platform_snap_threshold			24 //Allows characters to snap to platforms with a waveland
	
	//Bouncing
	#macro bounce_minimum_speed				12 //characters only bounce while in hitstun if they have enough speed
	#macro bounce_speed_multiplier			0.6
	
	//Slopes
	#macro slope_change_speed				true
	#macro slope_horizontal_pushes_down		false
	
	//Jostle
	#macro jostle_default_type				JOSTLE_TYPE.gradual
	#macro jostle_default_strength			1 //Default for Instant: 0.3
	#macro jostle_states					[PLAYER_STATE.idle, PLAYER_STATE.walking, PLAYER_STATE.walk_turnaround, PLAYER_STATE.crouching, PLAYER_STATE.run_stop, PLAYER_STATE.shielding, PLAYER_STATE.jumpsquat, PLAYER_STATE.shield_break]	
	//Default for Instant:
	//#macro jostle_states					[PLAYER_STATE.idle, PLAYER_STATE.walking, PLAYER_STATE.walk_turnaround, PLAYER_STATE.crouching, PLAYER_STATE.run_stop, PLAYER_STATE.shielding, PLAYER_STATE.jumpsquat, PLAYER_STATE.running, PLAYER_STATE.run_turnaround, PLAYER_STATE.dashing, PLAYER_STATE.knockdown, PLAYER_STATE.parry_stun, PLAYER_STATE.parry_stun, PLAYER_STATE.shield_break, PLAYER_STATE.wavelanding]
	#endregion
	#region General
	
	//Shielding
	#macro shield_min_time						3
	#macro shield_into_wavedash					true //QoL; allows you to wavedash out of shield startup frames
	#macro shield_break_base_time				300
	#macro shield_break_multiplier				0.2
	#macro shield_plat_drop_speed				0.3
	#macro shield_plat_drop_amount				0.7
	#macro default_shieldstun_multiplier		1.0 //1.0
	#macro base_shieldstun						3
	#macro shield_pushback_enable				true
	#macro shield_pushback_multiplier			0.4
	#macro shield_hitlag_multiplier				0.75
	
	//Parrying - This is for Rivals parrying, not Ultimate parrying!
	#macro parry_grabs							true
	#macro parry_default_stun_time				40
	#macro parry_hitlag							10
	#macro parry_invincible_time				30
	#macro parry_reflect_speed_multiplier		1.5
	
	//Ledges
	#macro ledge_grab_timeout_standard			60
	#macro ledge_snap_speed						16
	#macro ledge_grab_distance					28
	#macro ledge_snap_time						3
	#macro ledge_hang_min_time					10
	#macro ledge_hang_max_time					180
	#macro ledge_invincible_time				60
	#macro ledge_tether_snap_speed				15
	#macro ledge_tether_snap_time				20
	#macro ledge_trump_enable					true
	#macro ledge_trump_stun_time				25
	#macro ledge_trump_hsp						-6
	#macro ledge_trump_vsp						-11
	#macro ledge_getup_check_collision			false
	
	//Wall Jumps
	#macro wall_cling_max_time					60
	#macro wall_cling_normal_timeout			120
	#macro wall_jump_normal_timeout				15
	#macro wall_jump_check_distance				1
	#macro wall_cling_check_distance			1
	
	//Air Dodges
	#macro airdodge_adjust_endlag				true //Whether the Ultimate type airdodge should scale endlag based on the direction or not
	#macro airdodge_adjust_speed				true //Whether the Ultimate type airdodge should scale speed based on the direction or not
	#macro airdodge_direction_limit			-1 //Set to -1 for no limit on the direction
	#macro airdodge_restore_in_hitlag			false //Whether the player's airdodges are restored when they go into hitlag or not

	//Knockouts
	#macro ko_base_time							90
	#macro star_ko_base_time					180
	#macro star_ko_chance						5
	#macro star_ko_distance						(room_height div 2)
	#macro screen_ko_base_time					100
	#macro screen_ko_chance						6
	#macro screen_ko_scale_multiplier			3
	#macro respawn_platform_max_time			300
	#macro respawning_inv_time			90
	#macro respawn_platform_change_facing		true
	
	//Landing
	#macro landing_buffer_jumpsquat				true //Whether players start jumpsquat before landing lag finishes
	
	//Hitbox drawing
	#macro melee_draw_color						c_red
	#macro magnetbox_draw_color					c_blue
	#macro projectile_draw_color				c_yellow
	#macro hurtbox_draw_color					c_lime
	#macro collision_box_draw_color				c_purple
	#macro grab_draw_color						c_blue
	#macro windbox_draw_color					c_teal
	#macro hitbox_draw_angle_multiplier			8
	
	//Animation
	#macro anim_multiplier						0.3
	#macro anim_speed_normal					1
	#macro anim_state_normal					"Idle"
	#macro anim_frame_normal					0
	#macro anim_angle_normal					0
	#macro anim_alpha_normal					1.0
	#macro anim_scale_normal					1
	#macro anim_offset_normal					0
	#macro anim_loop_normal						true
	#macro anim_finish_normal					-1
	#macro anim_color_normal					c_white
	
	//Camera Shake
	#macro death_cam_shake						15
	
	//Aerial State
	#macro aerial_state_use_momentum_drift		false	//Whether the aerial state uses clamped speed drift or momentum based drift
														//Momentum based drift allows players to go over the max drift speed from external forces such as windboxes
	#macro aerial_restrict_speed_instantly		false	//Whether the aerial state instantly clamps the speed when switched to
														//This should be true if aerial_state_use_momentum_drift is also true
	
	//HUD
	#macro show_hud								true
	
	//Events (don't change)
	#macro user_event_step						0
	#macro user_event_paused					1
	#macro user_event_draw						2
	
	#endregion
#endregion
#region UI
#macro UI_radius					15
#macro UI_window_color				$262320
#macro UI_accent_color				$90d460
#macro UI_text_color				$eeeeee

#macro UI_pause_menu_size			350

#macro CSS_cursor_speed				8

#macro VB_inital_time				13
#macro VB_loop_time					5

#endregion
#region Utility
#macro TIMER_BEGIN \
if (!variable_global_exists("timerstack")) {\
	global.timerstack = ds_stack_create();\
}\
ds_stack_push(global.timerstack,get_timer())
#macro TIMER_END \
show_debug_message("Time: " + string((get_timer() - ds_stack_pop(global.timerstack))))// / 1000))
#endregion
#region Enums
enum GAME_STATE
	{
	startup,
	normal,
	paused,
	ending,
	}
//State Machine for Players
enum PLAYER_STATE
	{
	idle,
	crouching,
	walking,
	walk_turnaround,
	dashing,
	running,
	run_turnaround,
	run_stop,
	
	jumpsquat,
	aerial,
	
	airdodging,
	wavelanding,
	rolling,
	shielding,
	shield_release,
	shield_break,
	parrying,
	parry_stun,
	spot_dodging,
	
	in_hitlag,
	in_hitstun,
	in_tumble,
	helpless,
	magnetized,
	in_flinch,
	in_balloon,
	in_lag,
	knockdown,
	
	techrolling,
	teching,
	tech_wall_jump,
	
	ledge_snap,
	ledge_hang,
	ledge_getup,
	ledge_jump,
	ledge_roll,
	ledge_attack,
	ledge_tether,
	ledge_trump,
	wall_cling,
	wall_jump,
	
	knocked_out,
	star_ko,
	screen_ko,
	respawning,
	
	attacking,
	grabbing,
	is_grabbed,
	in_grab_release,
	
	lost,
	entrance,
	}
//Enum for gameplay inputs
enum INPUT
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	pause,
	
	length,
	}
//Enum for custom control inputs for the different device types
enum CC_INPUT_CONTROLLER
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	pause,
	
	short_hop,
	run,
	length,
	}
enum CC_INPUT_KEYBOARD
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	pause,
	
	short_hop,
	run,
	LR,
	LL,
	LU,
	LD,
	RR,
	RL,
	RU,
	RD,
	length,
	}
//Enum for buttons on a controller (Xbox layout)
enum CONTROLLER
	{
	A,
	B,
	X,
	Y,
	LB,
	RB,
	LT,
	RT,
	START,
	SELECT,
	DPAD,
	}
//Enum for directions
enum DIR
	{
	//Cardinal
	right,
	left,
	up,
	down,
	//Diagonal
	up_right,
	up_left,
	down_right,
	down_left,
	//Axis
	horizontal,
	vertical,
	any,
	none,
	}
//Enum for invulnerability
enum INV
	{
	normal,
	invincible,
	superarmor,
	shielding,
	powershielding,
	parry,
	parry_ult,
	counter,
	}
//Enum for air dodge type
enum AIRDODGE
	{
	melee,
	brawl,
	ultimate,
	}
//Enum for wall jump type
enum WALL_JUMP
	{
	rivals,
	smash,
	}
//Enum for shield
enum SHIELD
	{
	melee,
	ultimate,
	rivals,
	}
//Enums for hitbox properties
enum HITBOX_PROPERTY
	{
	shape,
	sprite_angle,
	lifetime,
	owner,
	overlay_sprite,
	overlay_frame,
	overlay_speed,
	has_hit,
	knockback_state,
	base_hitlag,
	hitlag_scaling,
	hitstun_scaling,
	custom_hitstun,
	di_angle,
	asdi_multiplier,
	drift_di_multiplier,
	priority,
	angle,
	grounded_angle,
	hit_fx_style,
	hit_sfx,
	extra_hitlag,
	techable,
	shieldstun_scaling,
	can_be_parried,
	}
enum HITBOX_SHAPE
	{
	square = -1,
	circle = -2,
	rotation = -3,
	}
//Enum for angle flippers --> apply_angle_flipper()
enum FLIPPER
	{
	fixed,
	standard,
	from_player_center,
	toward_player_center,
	from_player_center_horizontal,
	toward_player_center_horizontal,
	from_hitbox_center,
	toward_hitbox_center,
	from_hitbox_center_horizontal,
	toward_hitbox_center_horizontal,
	sakurai,
	sakurai_reverse,
	autolink,
	autolink_center,
	}
//Enum for special attack script calls
enum PHASE
	{
	//init = -1,
	start = -2,
	//stop = -3,
	//interrupt = -4,
	//on_hit = -5,
	parry = -6,
	detection = -7,
	counter = -8,
	}
//Enum for background layers
enum BACK
	{
	sprite,
	x,
	y,
	scale,
	parallax_x,
	parallax_y,
	xspd,
	yspd,
	frame,
	length,
	absolute,
	imgspeed,
	script,
	}
//Enum for profile settings
enum PROFILE
	{
	name,
	wins,
	games_played,
	custom_controls,
	favorite_skins,
	color,
	autogenerated,
	}
//Enum for on-hit effects
enum HIT_FX
	{
	//Hit FX
	normal_weak,
	normal_medium,
	normal_strong,
	special,
	slash,
	slash2,
	grab,
	explosion,
	splash,
	shield,
	shield_projectile,
	//Single effects
	spin,
	lines,
	emphasis,
	none,
	//Enum end
	length,
	}
//Enum for AI types
enum CPU_TYPE
	{
	idle,
	attack,
	shield_grab,
	shield_attack,
	di_in,
	di_out,
	di_random,
	parry_ult,
	airdodge,
	}
//Enum for player data
enum PLAYER_DATA
	{
	character,
	color,
	device,
	device_type,
	profile,
	is_random,
	is_cpu,
	cpu_type,
	}
//Enum for character data
enum CHAR_DATA
	{
	name,
	script,
	render,
	CSS,
	palette,
	palette_data,
	portrait,
	stock_sprite,
	music,
	}
//Enum for control stick
enum CONTROL_STICK
	{
	xval,
	yval,
	dir,
	spd,
	dist,
	}
//Enum for stick check types
enum STICK_CHECK_TYPE
	{
	current,
	backwards,
	}
//Enum for input device types
enum DEVICE
	{
	controller,
	keyboard,
	none,
	}
//Enum for character select players
enum CSS_PLAYER
	{
	index,
	device,
	device_type,
	character,
	color,
	profile,
	is_cpu,
	cpu_type,
	ready,
	}
//Enum for character select cursors
enum CSS_CURSOR
	{
	index,
	device,
	device_type,
	holding,
	is_cpu,
	active,
	}
//Enum for character select tokens
enum CSS_TOKEN 
	{
	index,
	x,
	y,
	is_cpu,
	}
//Enum for general UI cursors
enum UI_CURSOR
	{
	index,
	x,
	y,
	clicked,
	held_time,
	}
//Enum for character select state
enum CSS_STATE
	{
	normal,
	match_settings,
	replays,
	start_match,
	cpu_settings,
	}
//Enum for player windows on the character select screen
enum CSS_PLAYER_WINDOW_STATE
	{
	select_character,
	select_profile,
	create_profile,
	controls,
	control_set,
	playtesting,
	ready,
	}
//Enum for predefined animations
enum ANIMATION
	{
	_FLAG_,
	sprite,
	frame,
	speed,
	scale,
	angle,
	color,
	alpha,
	offsetx,
	offsety,
	loop,
	finish,
	}
//Enum for menu virtual buttons
enum VB
	{
	confirm,
	cancel,
	erase,
	option,
	sticklh,
	sticklv,
	length,
	}
//Enum for collidable flags
enum FLAG
	{
	block,
	solid,
	plat,
	moving,
	slope,
	}
//Enum for possible tech outcomes
enum TECH_RESULT
	{
	success,
	slide,
	bounce,
	}
//Enum for jostle movement types
enum JOSTLE_TYPE
	{
	gradual,
	instant,
	}
#endregion
//--> Game_Init
//--> Player_Init_Start
//--> Player_Init_End