var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height);

if not instance_exists(o_skeleton) exit;
draw_hp = o_skeleton.hp;
draw_max_hp = o_skeleton.max_hp; 
draw_set_font(f_one);
 
audio_play_sound(a_music, 4, true);
