event_inherited();
state = "chase";
hp = 1;
max_hp = hp;
image_speed = 0.5;
hspeed = random_range(1, 2);

if (instance_exists(o_skeleton)) {
    hspeed *= sign(o_skeleton.x - x);
}
image_xscale = sign(hspeed);
_damage = 5;
attacked = false;
experience = 2;
_knockback = 4;


 