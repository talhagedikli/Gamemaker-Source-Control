/// @description
//Move
x += hsp;
y += vsp;

//Friction
hsp *= 0.65;
vsp *= 0.65;
	
//Shrinking
if (shrink != 0)
	{
	fx_xs *= shrink;
	fx_ys *= shrink;
	}
	
//Fading
if (lifetime <= 10)
	{
	image_alpha = lifetime / 10;
	}

//lifetime / Time
if (--lifetime < 0)
	{
	instance_destroy();
	}