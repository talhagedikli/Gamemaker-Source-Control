/// @description Context-sensitive actions

var _text;

// Create a textbox if NPC is nearby
if (nearbyNPC && global.playerControl == true) {
	_text = nearbyNPC.myText;
	if (!instance_exists(obj_textbox)) {
		iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
		iii.textToShow = _text;
		}
	}