function Item() constructor
{
    name        = "";
    type        = ITEM.ZERO;
	sprite		= noone;
}
enum ITEM 
{
    ZERO,
    WEPON,
    POTION,
    KEY
}

function Sword() : Item() constructor 
{
    name    = "Sword";
    type    = ITEM.WEPON;
	sprite	= sprSword;
}

function Bow() : Item() constructor 
{
    name    = "Bow";
    type    = ITEM.WEPON;
	sprite	= sprBow;
}

function Key() : Item() constructor
{
	name	= "Key"
	type	= ITEM.KEY;
	sprite	= sprKey;
}