gunsprite = layer_sprite_get_id("Assets","g_gun");
if (global.hasgun) && (global.kills > 0)
{
	endtext[0] = "And on this day our hero had slain " + string(global.kills) + " people.";
	if (global.kills == 1) endtext[0] = "And on this day our hero killed a guy for no reason";
	endtext[1] = "But some of those people had guns too, so...";
	endtext[2] = "He was probably saving the world, or sth.";
	endtext[3] = "Regardless, he was arrested two days later spent the rest of his life in prison";
	endtext[4] = "The defense team tried to argue that the sexy recoil effects and hit flashes were to blame,\nbut to no avail.";
	endtext[5] = "The park ranger would later state she was \"not angry, just disappointed.\"";
	endtext[6] = "The end.";
}
else
{
	layer_sprite_destroy(gunsprite);
	endtext[0] = "On this day our hero had a wonderful walk through an millet bahçesi \nand he didnt even murder anyone.";
	endtext[1] = "They reported a discarded firearm to local authorities\nand were thanked profusely for assisting in an ongoing criminal.";
	endtext[2] = "And all it took was behavior that outside of a video game context\none would hope is completely normal.";
	endtext[3] = "Who would have thought?";
	endtext[4] = "The end.";
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";