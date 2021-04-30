/// @description (de)Select & reset sliders
event_inherited();

if (trigger_get_released(0)) event_perform(ev_other, ev_user0);