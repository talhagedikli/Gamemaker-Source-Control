///@func ripple_effect_create(system_index,x,y,size1,size2,color1,color2,alpha1,alpha2,lifetime,attached)
///@args system_index,x,y,size1,size2,color1,color2,alpha1,alpha2,lifetime,attached
var _ripple = array_create(RIPPLE.Length,0);
_ripple[RIPPLE.X] = argument[1];
_ripple[RIPPLE.Y] = argument[2];
_ripple[RIPPLE.MinSize] = argument[3];
_ripple[RIPPLE.MaxSize] = argument[4];
_ripple[RIPPLE.MinColor] = argument[5];
_ripple[RIPPLE.MaxColor] = argument[6];
_ripple[RIPPLE.MinAlpha] = argument[7];
_ripple[RIPPLE.MaxAlpha] = argument[8];
_ripple[RIPPLE.Lifetime] = argument[9];
_ripple[RIPPLE.MaxLife] = argument[9];
_ripple[RIPPLE.Attached] = argument[10];
_ripple[RIPPLE.StartX] = x;
_ripple[RIPPLE.StartY] = y;
var _map = argument[0];
var _list = _map[? "List"];
ds_list_add(_list,_ripple);
return _ripple;