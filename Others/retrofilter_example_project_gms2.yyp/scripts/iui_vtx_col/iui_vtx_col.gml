/// @description iui_vtx_col(x, y, colour, alpha)
/// @param x
/// @param  y
/// @param  colour
/// @param  alpha
function iui_vtx_col(argument0, argument1, argument2, argument3) {

	vertex_position(iui_VB, argument0, argument1);
	vertex_colour(iui_VB, argument2, argument3);



}
