/// @description 
var animlength	= 9;						//floor() alt tam sayıya yuvarlar
var framesize	= 64;
var animspeed	= 12;

if (moveX < 0) yframe = 9;
else if (moveX > 0)		yframe = 11;
else if (moveY < 0)		yframe = 8;
else if (moveY > 0)		yframe = 10;
else					xframe = 0;

var xx = x-x_offset;
var yy = y-y_offset;


//NOTE = ÜSTTE YAZDIĞIN ÜSTTE OLUR


//INCREMENT FRAME FOR ANIMATION
if((xframe + animspeed/60) < animlength)		{ xframe +=animspeed/60; }
else											{ xframe = 1; }
//DRAW CHARACTER BASE
draw_sprite_part(sprbase, 0, floor(xframe)*framesize, yframe*framesize, framesize, framesize, xx, yy);

//DRAW CHARACTER HAIR
draw_sprite_part(sprhair, 0, floor(xframe)*framesize, yframe*framesize, framesize, framesize, xx, yy);

//DRAW CHARACTER TORSO
draw_sprite_part(sprtorso, 0, floor(xframe)*framesize, yframe*framesize, framesize, framesize, xx, yy);

//DRAW CHARACTER LEGS
draw_sprite_part(sprlegs, 0, floor(xframe)*framesize, yframe*framesize, framesize, framesize, xx, yy);

//DRAW CHARACTER FEET
draw_sprite_part(sprfeet, 0, floor(xframe)*framesize, yframe*framesize, framesize, framesize, xx, yy);




draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);















