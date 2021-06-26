/// @description
x = mouse_x;
y = mouse_y;

image_blend = tile_meeting(x,y,"Collision") ? c_red : c_green;

scale += (mouse_wheel_up()-mouse_wheel_down())*.1;
scale = clamp(scale,.1,3);
image_xscale = scale;
image_yscale = scale;

if(keyboard_check_pressed(vk_space)){
  sprite_index = sprite_index == spr_test ? spr_test_round : spr_test;
}