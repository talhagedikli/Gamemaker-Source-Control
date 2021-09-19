///@func Profile_Load_All()
///@desc Opens up the standard save file and loads the profile list
var _file = file_exists(profiles_save) ? profiles_save : "default_profile.sav";

var _save_map = json_decode(load_string_file(_file));
if (ds_map_exists(_save_map, "PROFILES"))
	{
	if (ds_exists(global.profiles, ds_type_list)) then ds_list_destroy(global.profiles);
	global.profiles = ds_list_deepcopy(_save_map[? "PROFILES"]);
	}
	
ds_map_destroy(_save_map);