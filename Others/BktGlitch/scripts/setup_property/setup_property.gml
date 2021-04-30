/// @description setup_property(id, value, name);
/// @function setup_property
/// @param	id
/// @param	value
/// @param	name
/// @param  setter
function setup_property(argument0, argument1, argument2, argument3, argument4, argument5) {
	attr[argument0] = argument1; 
	name[argument0] = argument2;
	valTo[argument0] = argument1; 
	uniformSetter[argument0] = argument3;
	property_limit(argument0, argument4, argument5);


}
