if (state == EnemyStates.idle)
{
	
}
else if (state == EnemyStates.knockback)
{
	if (damageTween.getState() == time_source_state_initial)
	{
		damageTween.start(0, knockbackPower, knocbackTime);	
	}
	else
	{
		if (damageTween.isFinished())
		{
			damageTween.reset();
			state = EnemyStates.idle;
		}
		else
		{
			var _xv = lengthdir_x(damageTween.getValue(), knockbackDir);
			var _yv = lengthdir_y(damageTween.getValue(), knockbackDir);
			x += _xv;
			y += _yv;			
		}
	}
}