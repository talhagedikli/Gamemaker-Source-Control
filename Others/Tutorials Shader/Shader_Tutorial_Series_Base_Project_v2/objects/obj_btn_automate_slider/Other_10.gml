/// @description toggle animation

// toggle sliders automation type:
with (slider_id) automation_type = (automation_type + 1 ) mod 3;

// toggle automation button sprite:
current_sprite = (current_sprite + 1) mod max_sprites;
sprite_index = sprite[current_sprite];