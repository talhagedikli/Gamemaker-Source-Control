  /// @description update camera

//update destination
if (instance_exists(o_player))
{
x =  lerp(x,follow.x, 0.2);
y =  lerp(y,follow.y, 0.3);
	if (follow.object_index == o_player_dead)
	{
		x = follow.x;
		y = follow.y;
	}
	
}

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff); //???? clamp
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));



camera_set_view_pos(view_camera[0], x-view_w_half, y-view_h_half);

if (room != r_menu) && (room != r_ending)
{
	if (layer_exists("Mountains"))
	{
		layer_x("Mountains",x/2);
	}

	if (layer_exists("Trees"))
	{
		layer_x("Trees",x/4);
	}
}
