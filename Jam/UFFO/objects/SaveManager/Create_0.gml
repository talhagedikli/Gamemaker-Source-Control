fileName = "svHighscore"
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
	
	save_string(_json, fileName);
}

load = function()
{
	if (!file_exists(fileName)) return;
	
	// Load JSON
	var _json = load_string(fileName);
	var _rootstruct = json_parse(_json);
	
	global.highScore = _rootstruct.highScore;
}