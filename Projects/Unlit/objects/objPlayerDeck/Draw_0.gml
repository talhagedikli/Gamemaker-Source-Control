/// @description 
//var cx	= camera_get_view_x(c);
//var cy	= camera_get_view_y(c);
var cw	= camera_get_view_width(VIEW);
var ch	= camera_get_view_height(VIEW);

//Cards positions
var sx	= xMargin + cardW/2;
var sy	= ch - cardH/2 + yBuffer;

//Draw what to switch on top left of the screen
draw_set_alpha(0.6);
draw_set_color(c_dkgray);
draw_roundrect(0, sy-cardH/2-yMargin , cw-2, sy+cardH/2+yMargin-2, false);
draw_set_alpha(1);
draw_set_color(c_white);

var i = 0; repeat (ds_list_size(deck)) {
	//Cards positions
	var crd, cardX, cardY, sCrd;
	crd			= deck[| i];
	cardX		= sx + (i * (xBuffer + cardW));
	cardY		= sy;
	sCrd		= noone;
	
	var cardX1, cardX2, cardY1, cardY2;
	cardX1		= cardX-cardW/2;
	cardX2		= cardX+cardW/2;
	cardY1		= cardY-cardH/2;
	cardY2		= cardY+cardH/2;

	if (point_in_rectangle(mouse_x, mouse_y, cardX1, cardY1, cardX2, cardY2)) {
		
		crd.color	= c_maroon;
		sCrd		= deck[| i];
		
		//crd.xScale	= lerp(crd.xScale, 1.2, 0.15);
		//crd.yScale	= lerp(crd.yScale, 1.2, 0.15);
		
		crd.goUp		= lerp(crd.goUp, yBuffer, 0.15);
		crd.angle		= lerp(crd.angle, 360, 0.15);
		
		if (crd.onCard == false) {
			//play card switching sound
			var aS = audio_play_sound(aSwitch, 4, false);
			audio_sound_pitch(aS, random_range(0.8, 1.2));
			crd.onCard = true;
		}

	} else {
		crd.color	= c_white;
		
		//crd.xScale	= lerp(crd.xScale, 1, 0.15);
		//crd.yScale	= lerp(crd.yScale, 1, 0.15);
		
		crd.goUp		= lerp(crd.goUp, 0, 0.2);
		crd.angle		= lerp(crd.angle, 0, 0.15);

		if (crd.onCard == true) {
			crd.onCard = false;
		}
		
	}
	draw_sprite_ext(crd.sprite, crd.frame, cardX, cardY + crd.goUp,
				crd.xScale, crd.yScale, crd.angle, crd.color, crd.alpha);
	
	//if (sCrd != noone) { //draw selected card over other cards
	//	draw_sprite_ext(sCrd.sprite, sCrd.frame, cardX, cardY + sCrd.goUp,
	//			sCrd.xScale, sCrd.yScale, sCrd.angle, sCrd.color, sCrd.alpha);
	//}
	i++;
}
	
//Switch card
var sc =  add_new_card(swCrd);
draw_sprite_ext(sc.sprite, sc.frame, cw - xMargin - sprite_get_width(sc.sprite)/2,
					yMargin + sprite_get_height(sc.sprite)/2, sc.xScale, sc.yScale,
						0, c_white, 1);




