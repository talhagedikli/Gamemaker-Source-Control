/// @description set up camera
cam = view_camera[0];
follow = o_player;
view_w_half = camera_get_view_width(cam)/2;
view_h_half = camera_get_view_height(cam)/2;
x_to = x;
y_to = y;

shake_length = 0;		//süre
shake_magnitude = 0;	//kaç frame
shake_remain = 0;			
buff = 32;
