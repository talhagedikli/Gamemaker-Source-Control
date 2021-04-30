if(bbox_left < 0)
{
hspeed = hspeed * -1;
}

if(bbox_right > room_width)
{
hspeed = hspeed * -1;
}

if(bbox_top < 0)
{
vspeed = vspeed * -1;
}

if(bbox_bottom > room_height)
{
vspeed = vspeed * -1;
}

part_emitter_region(system, emitter, x - 25, x + 25, y - 25, y + 25, ps_shape_diamond, ps_distr_invgaussian);