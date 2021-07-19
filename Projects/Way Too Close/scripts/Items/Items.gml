function Item() constructor
{
    name        = "";
    type        = ITEM.ZERO;
	sprite		= undefined;
	index		= 0;
	color		= c_white;
	alpha		= 1;
	sound		= aPick;
	
	static blend = function(_color, _alpha)
	{
		color	= _color;
		alpha	= _alpha;
	}
}

function Sword() : Item() constructor 
{
    name    = "Sword";
    type    = ITEM.WEPON;
	sprite	= sprSword;
	sound	= aSword;
	
}

function Bow() : Item() constructor 
{
    name    = "Bow";
    type    = ITEM.WEPON;
	sprite	= sprBow;
	sound	= aBow;
}

function Key() : Item() constructor
{
	name	= "Key"
	type	= ITEM.KEY;
	sprite	= sprKey;
}

function Meat() : Item() constructor
{
	name	= "Meat";
	type	= ITEM.FOOD;
	sprite	= sprMeat;
	sound	= aBite;
}

enum ITEM 
{
    ZERO,
    WEPON,
    POTION,
    KEY,
	FOOD
}