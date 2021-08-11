if (fadeOut)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0) instance_destroy();
}
state.step();
image_xscale = approach(image_xscale, 1, 0.03);
image_yscale = approach(image_yscale, 1, 0.03);


//Try this instead
//if (owner.object_index == objAllyParent) sprite_index = sprAllyBullets;
//else if (owner.object_index == objEnemyParent) sprite_index = sprEnemyBullets;
