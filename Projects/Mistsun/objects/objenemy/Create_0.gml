enum EnemyStates
{
	idle,
	knockback
}

damageTween		= new Tween(TweenType.QuartEaseIn, 0, 0, 5);
knockbackDir	= 0;
knockbackPower	= 0;
knocbackTime	= 5;


state = EnemyStates.idle;




