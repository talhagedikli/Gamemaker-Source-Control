///The custom script for adding a limit gauge
function custom_limit_gauge() {
	//This is not the ideal implementation of a limit gauge, but is the easiest to implement
	if (!variable_instance_exists(id, "limit_gauge") || !variable_instance_exists(id, "limit_gauge_max"))
		{
		limit_gauge = 0;
		limit_gauge_max = 500;
		}
	//Handles the limit gauge
	if (state == PLAYER_STATE.in_hitlag && state_frame == 1)	
		{
		limit_gauge = min(limit_gauge_max, limit_gauge + stored_hitstun);
		}
	if (state == PLAYER_STATE.attacking && attack_has_hit())
		{
		limit_gauge = min(limit_gauge_max, limit_gauge + 1);
		}
	if (limit_gauge == limit_gauge_max)
		{
		my_attacks[? "Fspec"] = fspec_cross_slash;
		if (state == PLAYER_STATE.attacking && attack_script == fspec_cross_slash)
			{
			limit_gauge = 0;
			my_attacks[? "Fspec"] = fspec_eiha;
			}
		}
	else
		{
		my_attacks[? "Fspec"] = fspec_eiha;
		}
	if (is_dead())
		{
		limit_gauge = 0;
		}
	return;


}
