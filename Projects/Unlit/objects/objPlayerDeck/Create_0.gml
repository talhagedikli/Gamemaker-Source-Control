/// @description 
xMargin = 6;
yMargin = 6;
xBuffer = 6;
yBuffer = -6;
selected = noone;


selected	= {
	crd		: noone,
	pos		: undefined
}

var test = new Card();


cardW	= sprite_get_width(sprDeck)*test.xScale;
cardH	= sprite_get_height(sprDeck)*test.yScale;


deck = ds_list_create();

repeat (7) {
	ds_list_add(deck, choose(new Talk(), new Hit(), new Bless()));
}

swCrd = 0;
swDeck = ds_list_create();
ds_list_add(swDeck, new Talk());
ds_list_add(swDeck, new Hit());
ds_list_add(swDeck, new Bless());







