/// @description Init Item

sprite_index = choose(spr_Item_Apple, spr_Item_Bow, spr_Item_Key, spr_Item_Potion, spr_Item_Sword);

item = choose(item_food, item_bow, item_key, item_potion, item_sword);

switch(item)
{
case item_food:
    sprite_index = spr_Item_Apple;
    break;
case item_bow:
    sprite_index = spr_Item_Bow;
    break;
case item_key:
    sprite_index = spr_Item_Key;
    break;
case item_potion:
    sprite_index = spr_Item_Potion;
    break;
case item_sword:
    sprite_index = spr_Item_Sword;
    break;
}




