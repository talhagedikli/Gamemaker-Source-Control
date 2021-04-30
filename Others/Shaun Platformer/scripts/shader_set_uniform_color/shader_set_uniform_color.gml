// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_set_uniform_color(){
	{
    shader_set_uniform_f(argument0,
                         argument1 / 255,
                         argument2 / 255,
                         argument3 / 255,
                         argument4);
    return 0;
}
}