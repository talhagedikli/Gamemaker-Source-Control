/// @description 
global.hasgun = true;
instance_create_layer(o_player.x,o_player.y,"Gun",o_gun);
audio_play_sound(gun_handling,7,false);
instance_destroy();