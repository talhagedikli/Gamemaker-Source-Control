//buttons
player_buttons();

xx = approach(0,1000,0.1); 
//animation
frame += frameSpeed;

//state switch
switch currentState {
    case states.normal:
        normal_state();
    break;

    case states.crouch:
        crouch_state();
    break;

    case states.attack:
        attack_state();
    break;
}

