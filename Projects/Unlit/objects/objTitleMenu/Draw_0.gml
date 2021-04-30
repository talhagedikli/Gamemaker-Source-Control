//Dynamicly get width and height
var newW = 0;
var i = 0; repeat (opLength) {
	var opW = string_width(option[menuLevel, i]);
	newW = max(newW, opW);
	
	i++;	
}
height	= opBorder*2 + string_height(option[0, 0]) + (opLength-1) * opSpace;
width	= newW + opBorder*2;

//Center the menu
x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2 - width/2;
y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2 - height/2;



//Menu background
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_roundrect(x, y, x+width, y+height, false);
draw_set_color(c_white);
draw_set_alpha(1);


//Draw options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var i = 0; repeat (opLength) {
	var c = c_white;
	if (pos == i) { c = c_yellow };
	draw_set_font(fntMenu);
	draw_text_colour(x+opBorder, y+opBorder+opSpace*i, option[menuLevel, i], c, c, c, c, 1);
	
	
	i++;	
}




