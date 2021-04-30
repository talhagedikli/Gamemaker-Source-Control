if !(item_array[item_pos][item_type] == item_none)
    {
    var _type = item_array[item_pos][item_type];
    var _sprite = item_array[item_pos][item_sprite];
    item_array[item_pos][item_amount] += -1;
    var _inst = instance_create_layer(mouse_x, mouse_y, "Instances", obj_Item);
    with(_inst)
        {
        item = _type;
        sprite_index = _sprite;
        }
    if (item_array[item_pos][item_amount] < 1)
        {
        item_array[item_pos][item_type] = item_none;
        }
    }