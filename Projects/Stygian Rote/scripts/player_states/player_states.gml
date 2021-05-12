/// @description player normal state
function player_state_normal() {
    #region //Movement phase
    if (InputManager.keyLeft) {
        dir = lerp(dir, 1.5, 0.05);
    } else if (InputManager.keyRight) {
		dir = lerp(dir, -1.5, 0.05);
    } else {
        dir = lerp(dir, 0, 0.05);
	}

	
	image_angle += dir;

	
	if (InputManager.keyAlt) {
		//spd = approach(spd, 2, 0.01);
		if (InputManager.keyUp) {
			enginePower = approach(enginePower, maxEnginePower, 0.005);
		} else if (InputManager.keyDown) {
			enginePower = approach(enginePower, 0, 0.005);
		} 
	}
	//else {
	//	spd = approach(spd, 0, 0.001);
	//}
	spd = approach(spd, spd + enginePower, 0.1);
	
	spd = clamp(spd, -5, 5);
	
    //calculating aSpeed and dSpeed
	xSpeed = lengthdir_x(enginePower, image_angle);
	ySpeed = lengthdir_y(enginePower, image_angle);
	
	//if (place_meeting(x - 10, y - 10, objBlock)) {
	//	spd = approach(spd, -spd / 2, 0.5);
	//} else {
	//	x += xSpeed;
	//	y += ySpeed;
	//}

	x += xSpeed;
	y += ySpeed;
	
	
	


    #endregion



}


/// @description quick and dynamic guibar setup

function makeGuiBar() constructor { #macro GuiBar makeGuiBar()
	
	static create = function(x1, y1, barw, barh){
		xone = x1;
		yone = y1;
		
		rate = 1;
		smtRate = rate;
	
		width = barw;
		height = barh;
	};
	
	static step = function(val, valMax) {
		rate = val / valMax;
		smtRate = lerp(smtRate, rate, 0.1);
	}
		
	static drawGui = function(type, alpha, color, bottomline) {
		draw_set_alpha(alpha);
		draw_set_color(color);
		if (type == "vertical")
			draw_roundrect(xone, yone, xone + width, 
							yone + height * smtRate + (bottomline ? sign(height) : 0), false);
		else if (type == "horizontal")
			draw_roundrect(xone, yone, 
							xone + width * smtRate + (bottomline ? sign(width) : 0), yone + height, false);

		draw_set_alpha(1);
		draw_set_color(c_white);
		
	};	
	
};

function drawBar(x1, y1, width, height, rate, type, rounded, color, alpha, bottomline, lrp, lrp_rate) {
	static setRate = 1;
	if (rate != noone) {
		setRate = lrp ? lerp(setRate, rate, lrp_rate) : rate;	
	}
	
	draw_set_alpha(alpha);
	draw_set_color(color);
	if (type == "vertical") {
		if (rounded) {
		draw_roundrect(x1, y1, x1 + width, 
			y1 + height * (rate == noone ? 1 : setRate) + (bottomline ? sign(height) : 0), false);
		} else { draw_rectangle(x1, y1, x1 + width, 
			y1 + height * (rate == noone ? 1 : setRate) + (bottomline ? sign(height) : 0), false);
		}
	} else if (type == "horizontal") {
		if (rounded) {
		draw_roundrect(x1, y1, 
			x1 + width * (rate == noone ? 1 : setRate) + (bottomline ? sign(width) : 0), y1 + height, false);
		} else { draw_rectangle(x1, y1, 
			x1 + width * (rate == noone ? 1 : setRate) + (bottomline ? sign(width) : 0), y1 + height, false);
		}	
		
	}
	draw_set_alpha(1);
	draw_set_color(c_white);		
	
	
	
};
	




//function TestVar() constructor {
//	static create = function(key, value) {
//		key = value;	
//	}
	
//	static step = function() {
//		static newvalue = undefined;
//		var value = global.test[$ key];
//		if (value == "undefined") value = undefined;

//		newvalue = newvalue != value ? value : variable;
	
//		if (global.test[$ key] != undefined)
//			return newvalue;
//		else 
//			return variable;	
//	}
	
//}

