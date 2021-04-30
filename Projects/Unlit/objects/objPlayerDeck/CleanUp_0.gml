/// @description 

//To clean all of the structs in the players deck
var i = 0; repeat (ds_list_size(deck)) {
	delete deck[| i];
}

//To clean all the lists
ds_list_destroy(deck);
ds_list_destroy(swDeck);


