with (other)
{
	if (active)
	{
		event_perform(ev_other, ev_user0);
		if (time >= duration)
		{
			done = true;
			if (loop)	reset();
			//else		stop();
		}
		else
		{
			run();
		}
	}
}