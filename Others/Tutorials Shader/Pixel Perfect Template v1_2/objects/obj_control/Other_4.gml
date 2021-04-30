/// @description Double-check the room speed

if (room_speed != game_speed)
    {
    room_speed = game_speed;
    sdm("Warning: New room does not match game speed. Adjusted.");
    }


