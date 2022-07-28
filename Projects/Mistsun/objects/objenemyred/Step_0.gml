if (state == EnemyStates.idle)
{
	spd = approach(spd, 0, 5);
	var _xv = lengthdir_x(spd, image_angle);
	var _yv = lengthdir_y(spd, image_angle);
	checkCollisions(objSolidParent, _xv, _yv);
}
else if (state == EnemyStates.knockback)
{
	if (knockbackTween.getState() == time_source_state_initial)
	{
		knockbackTween.start(0, knockbackPower, knocbackTime);	
	}
	else
	{
		if (knockbackTween.isFinished())
		{
			knockbackTween.reset();
			state = EnemyStates.idle;
		}
		else
		{
			spd = knockbackTween.getValue();
			var _xv = lengthdir_x(spd, knockbackDir);
			var _yv = lengthdir_y(spd, knockbackDir);
			//x += _xv;
			//y += _yv;	
			checkCollisions(objSolidParent, _xv, _yv);
		}
	}
}
