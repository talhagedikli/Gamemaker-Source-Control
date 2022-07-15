function Class() constructor
{
	event_create			= undefined;
	event_step_begin		= undefined;
	event_step				= undefined;
	event_step_end			= undefined;
	event_destroy			= undefined;
	event_cleanup			= undefined;
	event_draw				= undefined;
	event_draw_end			= undefined;
	event_draw_gui_begin	= undefined;
	event_draw_gui_end		= undefined;
	event_pre_draw			= undefined;
	event_post_draw			= undefined;
	event_draw_gui			= undefined;
}

enum ObjectStates {
	Ally,
	Neutral,
	Enemy
}
