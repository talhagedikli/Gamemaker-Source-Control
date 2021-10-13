surPS = -1;

#region Systems
global.PS = part_system_create();
part_system_depth(global.PS, -100002);
part_system_automatic_update(global.PS, true);
#endregion


global.Particles = {};

with (global.Particles)
{
	upper		= new xParticle(global.PS).Shape(pt_shape_flare).Alpha3(0.3, 1, 0.2).Life(30, 50).Gravity(0.03, 90).Scale(0.05).Blend(true).Direction(80, 110, 0, false);
	ghostDash	= new xParticle(global.PS).Alpha3(0.3, 1, 0.2).Life(20, 50).Death(1, upper.Type());
}