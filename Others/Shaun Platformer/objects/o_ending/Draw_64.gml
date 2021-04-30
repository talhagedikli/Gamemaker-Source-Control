draw_set_color(c_black);										//siyah dikdörtgenle kapamak
draw_rectangle(0, 0, RES_W, 128, false);		
draw_rectangle(0, RES_H-128, RES_W, RES_H, false);

draw_set_text(c_black, f_sign, fa_center, fa_top);			//gölgesiyle beraber yazdık
//draw_text(RES_W/2 + 2, RES_H*0.3+2, text);
draw_set_color(c_white);
draw_text(RES_W*0.5, RES_W*0.3, text);