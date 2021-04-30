draw_self();
var _item_x = item_pos * 22;
var _xx = bbox_left + 13 ;
var _yy = bbox_top + 13;
draw_sprite(spr_Inventory_Selected, item_pos_index, _xx + _item_x, _yy);

item_pos_index += 0.2;
for(var i = 0; i < 5; i += 1)
    {
    if !(item_array[i, item_type] == item_none)
        {
        draw_sprite(item_array[i, item_sprite], 0, _xx, _yy);
        draw_text(_xx + 8, _yy + 9,  + string(item_array[i, item_amount]));
        }
    _xx += 22;
}