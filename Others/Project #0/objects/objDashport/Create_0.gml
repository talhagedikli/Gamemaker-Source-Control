animation_init(); 
var _ownerX = objPlayer.x;
var _ownerY = objPlayer.y;
var _mX = display_mouse_get_x();
var _mY = display_mouse_get_y();
var _dir = point_direction(_ownerX, _ownerY, mouse_x, mouse_y);
direction = _dir;
speed = 3;
dSpeed = 0.1;
//misc variables
fadeOut = false;
sprite = sprDashport;

squash_stretch(1.7, 0.6);