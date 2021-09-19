///@func hurtbox_setup(melee, magnetbox, grab, targetbox, detectbox, windbox, projectile)
///@param melee
///@param magnetbox
///@param grab
///@param targetbox
///@param detectbox
///@param windbox
///@param projectile
///@desc Sets up the on-hit scripts of a hurtbox for each type of hitbox

melee_hit =			script_exists(argument0) ? argument0 : hurtbox_hit_script_template;
magnetbox_hit =		script_exists(argument1) ? argument1 : hurtbox_hit_script_template;
grab_hit =			script_exists(argument2) ? argument2 : hurtbox_hit_script_template;
targetbox_hit =		script_exists(argument3) ? argument3 : hurtbox_hit_script_template;
detectbox_hit =		script_exists(argument4) ? argument4 : hurtbox_hit_script_template;
windbox_hit =		script_exists(argument5) ? argument5 : hurtbox_hit_script_template;
projectile_hit =	script_exists(argument6) ? argument6 : hurtbox_hit_script_template;