/// @description 
//var cx	= camera_get_view_x(c);
//var cy	= camera_get_view_y(c);
//Camera variables
var cw	= camera_get_view_width(VIEW);
var ch	= camera_get_view_height(VIEW);

//Switching margins
if (keyboard_check(ord("U"))) {
	xBuffer = lerp(xBuffer, 24, 0.15);
} else if (keyboard_check(ord("Y"))) {
	xBuffer = lerp(xBuffer, -8, 0.15);
} else {
	xBuffer = lerp(xBuffer, 4, 0.15);
}

//Cards first positions
var sx	= xMargin + cardW/2;
var sy	= ch - cardH/2 + yBuffer;

//To set what to switch
if (mouse_wheel_down()) {
	swCrd++;
} else if (mouse_wheel_up()) {
	swCrd--;
}

//Loop cards
swCrd = swCrd mod ds_list_size(swDeck);

var i = 0; repeat (ds_list_size(deck)) {
	//Cards positions variables
	var crd, cardX, cardY;
	crd			= deck[| i];
	cardX		= sx + (i * (xBuffer + cardW));
	cardY		= sy;
	
	//Cards edges's positions
	var cardX1, cardX2, cardY1, cardY2;
	cardX1		= cardX-cardW/2;
	cardX2		= cardX+cardW/2;
	cardY1		= cardY-cardH/2;
	cardY2		= cardY+cardH/2;
	
	
	
	if (point_in_rectangle(mouse_x, mouse_y, cardX1, cardY1, cardX2, cardY2)) {
		
		//Which card cursor on it: It's position and id
		selected.crd	= crd;
		selected.pos	= i;
		
		if (mouse_check_button_pressed(mb_left)) {
			ds_list_delete(deck, i);
		}
		
		//Using methods
		if (mouse_check_button_pressed(mb_middle)) {
			
			crd.info();
		}
		
		if (mouse_check_button_pressed(mb_right)) {
			if(selected.crd.index != swCrd) {
				ds_list_replace(deck, selected.pos, add_new_card(swCrd));
			}
		}
		
		
	}
	i++;
}



if (keyboard_check_pressed(ord("A")) and ds_list_size(deck) < 15) {
	ds_list_add(deck, choose(new Talk(), new Hit(), new Bless()));
}









