///@func calculate_shieldstun(damage,multiplier)
///@param damage
///@param multiplier
var _dmg = argument[0];
var _multi = argument[1];
return max(0, (_dmg * default_shieldstun_multiplier * _multi) + base_shieldstun);