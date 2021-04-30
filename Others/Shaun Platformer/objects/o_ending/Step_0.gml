// move player towards center 
layer_x("Assets",min(layer_get_x("Assets")+0.75,RES_W*0.5-32));	//katmanını belirleme

// progress text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//next line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline+1 == array_length_1d(endtext))	//1d 2d array ???????????????????????????? galiba kaç tane olduğu
	{
		slide_transition(TRANS_MODE.RESTART);		//np
	}
	else
	{
		currentline ++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}

