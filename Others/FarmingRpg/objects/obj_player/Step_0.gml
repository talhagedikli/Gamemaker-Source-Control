/// @description 
//-------------------INPUTS
input_right		= keyboard_check(vk_right);
input_left		= keyboard_check(vk_left);
input_up		= keyboard_check(vk_up);
input_down		= keyboard_check(vk_down);
input_walk		= keyboard_check(vk_control);
input_run		= keyboard_check(vk_shift);

//-----------------ALTER SPEED
if(input_walk or input_run)
{
	spd = abs((input_walk*walkspd) - (input_run*runspd))									// input_walk doğruysa 1 sayılıyor.
}
else { spd = normalspd }

//----------------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//----------------INTENDED MOVEMENT
moveY = (input_down - input_up) * spd;
if(moveY == 0) { moveX = (input_right - input_left) * spd; }

//----------------COLLISION CHECKS
//Horizontal
if(moveX != 0)																				//boşuna check yapmasın diye	
{
	if(place_meeting(x+moveX, y, obj_collision))
	{
		repeat(abs(moveX))
		{
			if(!place_meeting(x+sign(moveX), y, obj_collision)) { x += sign(moveX); }		//1 frame kalana kadar yaklaşır
			else { break; }
		}
		moveX = 0;
	}
}

//Vertical	
if(moveY != 0)																				//boşuna check yapmasın diye
{
	if(place_meeting(x, y+moveY, obj_collision))
	{
		repeat(abs(moveY))
		{
			if(!place_meeting(x, y+moveY, obj_collision)) { y += sign(moveY); }				//1 frame kalana kadar yaklaşır
			else { break; }
		}
		moveY = 0;
	}
}

//-------------------APPLY MOVEMENT
x += moveX;
y += moveY;	























