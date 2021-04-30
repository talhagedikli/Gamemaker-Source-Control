if(keyboard_check(vk_lshift)){
    room_speed = 5;
}else{
    room_speed = 60;
}

if(keyboard_check_pressed(vk_escape)){
    game_end();
}

if(keyboard_check_pressed(ord("R"))){
    game_restart();
}

