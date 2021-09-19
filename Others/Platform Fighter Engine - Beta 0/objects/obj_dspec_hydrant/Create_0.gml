/// @description

event_inherited();

max_fall_speed = 12;
grav = 0.6;
hsp = 0;
vsp = 1;
owner = noone;
self_hitlag_frame = 0;
destroy_on_blocks = false;

hp = 10;
planted = false;
launched = false;
lifetime = 360;
water_time = 0;
angle = 0;

image_xscale = 2;
image_yscale = 2;
y = round(y);

//Drop hitbox object
drop_hitbox = create_melee(0, 0, 0.5, 1, 8, 8, 1, 10, 45, 360, HITBOX_SHAPE.square, 0, FLIPPER.from_hitbox_center_horizontal);

//Launch hitbox object
launch_hitbox = noone;

//Water hitboxes
water_hitbox_right = noone;
water_hitbox_top = noone;
water_hitbox_left = noone;

//Hurtbox object
hurtbox = noone;