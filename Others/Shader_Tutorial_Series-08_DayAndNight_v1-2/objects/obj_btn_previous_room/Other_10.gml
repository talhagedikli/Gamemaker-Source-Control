/// @description change room
var target_room = room - 1;
if (target_room > room_last) target_room = 1;
else if (target_room == 0)	 target_room = room_last;
room_goto(target_room);
