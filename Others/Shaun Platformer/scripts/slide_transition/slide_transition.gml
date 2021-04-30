///@desc slide_transition(mode, targetroom)
///@arg switcmode		sets transition mode between next, restart and goto
///@arg targetroom	sets target room when using the goto mode
function slide_transition(switchmode,targetroom)
{
with (o_transition)
{
	mode = switchmode;
	if (argument_count > 1) target = targetroom; 
}
}