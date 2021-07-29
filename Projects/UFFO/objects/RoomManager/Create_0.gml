/// @description 
switched = false;
currentRoom = rTitle;
//checkRoom = function()
//{
//	if (currentRoom != room) {
//		currentRoom = room;
//		return true;
//	}
//	return false;
//};

state	= "rTitle";
changed	= true;

checkRoom = function()
{
	if (room_get_name(room) != state)
	{
		state_change(room_get_name(room));
	}
}
maxStarCount = 100;

infoText = [
	"Press Q to cycle wepons",
	"Press Z to shoot",
	"Press X to dash"
];
info		= noone;
infoTimer	= new Timer();
infoIndex	= 0;
infoAlpha	= new Timer();

obstacleTimer	= new Timer();




