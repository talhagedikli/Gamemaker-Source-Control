///@func Match_End([room])
///@param [room]
function Match_End() {
	part_particles_clear(global.part_sys);
	room_goto(argument_count > 0 ? argument[0] : rm_Win_Screen);


}
