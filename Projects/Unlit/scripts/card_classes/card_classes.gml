function Card () constructor {
	name	= "";
	sprite	= sprDeck;
	frame	= 0;
	xScale	= 0.50;
	yScale	= 0.50;
	color	= c_white;
	alpha	= 1;
	angle	= 0;
	onCard	= false;
	
	goUp	= 0; 
}

enum cards 
{
	talk = 0,
	hit = 1,
	bless = 2
}

#region CARDS

function Talk() : Card() constructor {
	index	= cards.talk;
	name	= "one";
	frame	= 0;
	color	= c_white;
	alpha	= 1;
	
	info	= function() {
		show_message("its the first card in the world");
	}
}

function Hit() : Card() constructor {
	index	= cards.hit;
	name	= "two";
	frame	= 1;
	color	= c_white;
	alpha	= 1;
	
	info	= function() {
		show_message("its the second card in the world");
	}
}

function Bless() : Card() constructor {
	index	= cards.bless;
	name	= "bless";
	frame	= 2;
	color	= c_white;
	alpha	= 1;
	
	info	= function() {
		show_message("there is no god to bless you so, i bless you");
	}
	
	
}
#endregion

function add_new_card(index) {
	do {
		if (index == cards.talk) {
			return new Talk();
			break;
		}
		if (index ==  cards.hit) {
			return new Hit();
			break;
		}
		if (index == cards.bless) {
			return new Bless();
			break;
		}
	}
	until (index == noone) { 
		return noone;
	}
}




