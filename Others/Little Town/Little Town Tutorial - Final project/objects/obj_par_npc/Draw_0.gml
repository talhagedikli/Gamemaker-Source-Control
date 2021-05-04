/// @description Draw NPC and shadow

// Draw shadow
draw_sprite_ext(spr_shadow_npc,0,x,y,1,1,0,c_white,0.3);
draw_set_alpha(1);

// Draw player
draw_self(); 