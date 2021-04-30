/// @description draw score
if (room!=r_menu) && (instance_exists(o_player)) && (global.kills > 0)
{
	killtextscale = max(killtextscale*0.95,1);
	draw_set_text(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(RES_W-8,12,string(global.kills) + " Pointless Murders :(", killtextscale,killtextscale,0);//shadow
	draw_set_color(c_white);
	draw_text_transformed(RES_W-10,10,string(global.kills) + " Pointless Murders :(",killtextscale,killtextscale,0);
	//birincisi shadow, ikincisi yazı
}