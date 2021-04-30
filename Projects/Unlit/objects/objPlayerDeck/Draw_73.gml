///// @description 
//var c	= view_camera[0];
////var cx	= camera_get_view_x(c);
////var cy	= camera_get_view_y(c);
//var cw	= camera_get_view_width(c);
//var ch	= camera_get_view_height(c);

//var sx	= xMargin + cardW/2;
//var sy	= ch - cardH/2 + yBuffer;

//var i = 0; repeat (ds_list_size(deck)) {
	
//	var crd, cardX, cardY, sCrd;
//	crd			= deck[| i];
//	cardX		= sx + (i * (xBuffer + cardW));
//	cardY		= sy;
	
//	var cardX1, cardX2, cardY1, cardY2;
//	cardX1		= cardX-cardW/2;
//	cardX2		= cardX+cardW/2;
//	cardY1		= cardY-cardH/2;
//	cardY2		= cardY+cardH/2;
//	sCrd		= noone;

//	if (point_in_rectangle(mouse_x, mouse_y, cardX1, cardY1, cardX2, cardY2)) {
		
//		crd.color	= c_maroon;
//		sCrd		= deck[| i];
		
//		//crd.xScale	= lerp(crd.xScale, 1.2, 0.15);
//		//crd.yScale	= lerp(crd.yScale, 1.2, 0.15);
		
//		crd.goUp		= lerp(crd.goUp, yBuffer, 0.15);
//		crd.angle		= lerp(crd.angle, 360, 0.15);
		
//		if (crd.onCard == false) {
//			//play card switching sound
//			var aS = audio_play_sound(aSwitch, 4, false);
//			audio_sound_pitch(aS, random_range(0.8, 1.2));
//			crd.onCard = true;
//		}

//	} else {
//		crd.color	= c_white;
		
//		//crd.xScale	= lerp(crd.xScale, 1, 0.15);
//		//crd.yScale	= lerp(crd.yScale, 1, 0.15);
		
//		crd.goUp		= lerp(crd.goUp, 0, 0.2);
//		crd.angle		= lerp(crd.angle, 0, 0.15);

//		if (crd.onCard == true) {
//			crd.onCard = false;
//		}
		
//	}
//	if sCrd != noone
//	draw_sprite_ext(sCrd.sprite, sCrd.frame, cardX, cardY,
//						sCrd.xScale, sCrd.yScale, sCrd.angle,
//							sCrd.color, 1);

	
//	i++;
//}
	
	





