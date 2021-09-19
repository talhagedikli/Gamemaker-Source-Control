///@func calculate_knockback(target_hp,damage,weight,scaling,base_knockback)
///@param target_hp
///@param damage
///@param weight
///@param scaling
///@param base_knockback
var p, d, w, s, b;
p = argument[0];
d = argument[1];
w = argument[2];
s = argument[3];
b = argument[4];

/* Target HP is the damage percent the target has after the attack hits*/
//Smash Bros Formula
//return ((((((p/10)+((p*d)/20))*w*1.4)+18)*s)+b);
//Rivals of Aether Formula
if (is_stamina_match())
	{
	return b * w;
	}
else
	{
	return b + (p + d) * s * knockback_scaling_multiplier * w;
	}