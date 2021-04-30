/// @description


// draw box
draw_sprite_ext(spr_slider_box, 0, x, y, 1, 1, 0, blend_color, 1);

// draw bar:
event_inherited();

var slider = global.slider1;

// draw button:
draw_sprite_ext(spr_slider_btn, 1, x + slider * slider_width, y, 1, 1, 0, blend_color, 1);
