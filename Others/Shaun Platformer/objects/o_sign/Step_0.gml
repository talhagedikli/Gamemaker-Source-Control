/// @description global right pressed istediğin yerde bas normalde sadece üstüne basardın
if (point_in_circle(o_player.x,o_player.y,x,y,64)) //64 daire içinde bu if true
{
	nearby = true;
	if (keyboard_check_pressed(ord("W")))
	{
		with (instance_create_layer(x,y-64,layer,o_text))
		{
			text = other.text;		//bundaki texte eşitledik
			length = string_length(text);
		}
	
		with (o_camera) follow = other.id;		//id = bu obje
	}	
} 
else nearby = false;
