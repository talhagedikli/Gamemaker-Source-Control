save = function()
{
	var _highscore = max(global.score, global.highScore);
	
	// Root Struct
	var _rootstruct = 
	{
		highScore : _highscore
	};
	
	// Save to json
	var _json = json_stringify(_rootstruct);
	
	save_string(_json, "highscore_save");
}

load = function()
{
	if (!file_exists("highscore_save")) return;
	
	// Load JSON
	var _json = load_string("highscore_save");
	var _rootstruct = json_parse(_json);
	
	global.highScore = _rootstruct.highScore;
	
}