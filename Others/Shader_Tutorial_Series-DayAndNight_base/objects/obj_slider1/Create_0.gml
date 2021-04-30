/// @description Init
event_inherited();


global.slider1 = 0.5;
timer_sign = 1;
timer_step = 0.015; // This changes the oscillator speed
timer_type = 0; // 0, 1: back and forth, 2: cycle

dragging = false;

btn_offset = 8;
slider_width = sprite_width - 2 * btn_offset;


// create automation button:
with instance_create_layer(x - 64, y, layer, obj_automate) slider = other.id;
