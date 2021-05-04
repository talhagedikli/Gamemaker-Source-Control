/// @param leftVerb
/// @param rightVerb
/// @param upVerb
/// @param downVerb
/// @param [playerIndex]

function input_distance()
{
    var _verb_l       = argument[0];
    var _verb_r       = argument[1];
    var _verb_u       = argument[2];
    var _verb_d       = argument[3];
    var _player_index = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : undefined;
    
    var _result = input_xy(_verb_l, _verb_r, _verb_u, _verb_d, _player_index);
    return point_distance(0, 0, _result.x, _result.y);
}