if (showHud and global.midTransition == false)
{
	//background rect
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0,0,guiW,guiH,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	//roundrect
	draw_set_alpha(0.6);
	draw_set_color(c_dkgray);
	draw_roundrect(invX,invY,invX+invW-1,invY+invH-2,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	//draw inventory
	draw_sprite_ext(sprInventory, 0, invX, invY, 
	invScale, invScale, 0, c_white, 1);

	//draw some items
	var i = 0; repeat(37)
	{
		var iX = i mod 10; 
		var iY = i div 10;
	
		draw_sprite_ext(sprDitherbox, 0, 
		invX + (iX*cellSize), invY + (cellSize*iY), 
		invScale, invScale, 0, c_white, 1);

		i ++;	
	}
}


var crdNum = 0; repeat(3) 
{
	draw_sprite_ext(sprHeart, 1, hrtX+(crdNum*cellSize), hrtY, 
	hrtScale, hrtScale, 0, c_white, 1);
	crdNum ++;
}








