if (state == EnemyStates.idle)
{
	
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
			var _xv = lengthdir_x(knockbackTween.getValue(), knockbackDir);
			var _yv = lengthdir_y(knockbackTween.getValue(), knockbackDir);
			x += _xv;
			y += _yv;			
		}
	}
}