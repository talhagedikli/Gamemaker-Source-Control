if not instance_exists(other) exit;

audio_play_sound(a_expr, 1, false);

with (other) {
	experience +=1
	if (experience >= max_experience) {
	    level += 1;
		experience = experience - max_experience;
		max_experience += max_experience
		max_hp += 5;
		hp = max_hp
		strength += 5;
	}
}
instance_destroy();