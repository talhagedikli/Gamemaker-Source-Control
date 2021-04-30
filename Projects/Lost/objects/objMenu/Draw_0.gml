if (room == rmMenu)
{
	var i = 0;
	repeat (buttons)
	{
		draw_set_font(fntMenu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
	
		xx = menuX + room_width/2-buttonW/2;
		yy = menuY + (buttonH + buttonPadding) * i + room_height/5;
		draw_set_color(c_dkgray);
		draw_roundrect(xx, yy, xx+buttonW, yy+buttonH, false);
	
	
		draw_set_color(c_ltgray);
		if (menuIndex == i)
		{
			draw_set_color(c_red);
		}
	
		draw_text(xx+buttonW/2, yy+buttonH/2, button[i]);
		draw_set_color(c_white); 
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);	
		i++;
	}
	
}