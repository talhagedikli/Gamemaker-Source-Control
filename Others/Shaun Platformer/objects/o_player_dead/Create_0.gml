hsp = 3;
vsp = -4;
grv = 0.1;
done = 0;

image_speed = 0;
image_index = 0;
screen_shake(6,60);
audio_play_sound(a_die,10,false);
game_set_speed(30,gamespeed_fps);
with (o_camera) follow = other.id;