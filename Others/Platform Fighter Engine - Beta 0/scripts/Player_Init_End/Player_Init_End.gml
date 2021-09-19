///Initializes Player variables
//Called by obj_game after the device is assigned to the player

//Set up character specific variables
script_execute(character_script);

//Name
name = get_char_data(character, CHAR_DATA.name);

//Palette
palette_sprite = get_char_data(character, CHAR_DATA.palette);
palette = palette_slice(get_char_data(character, CHAR_DATA.palette_data), player_color);

//Sprites
portrait = get_char_data(character, CHAR_DATA.portrait);
render = get_char_data(character, CHAR_DATA.render);
stock_sprite = get_char_data(character, CHAR_DATA.stock_sprite);

//Animation base
set_anim_reset();

//Entrance state
set_state(PLAYER_STATE.entrance);

//Collision box
collision_box_change();

//Move to the front
Player_Move_To_Back();