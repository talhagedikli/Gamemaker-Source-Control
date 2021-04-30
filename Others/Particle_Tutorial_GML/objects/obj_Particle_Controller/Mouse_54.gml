repeat(50)
{
var _mx = (random_range(mouse_x - 50, mouse_x + 50));
var _my = (random_range(mouse_y - 50, mouse_y + 50));
part_particles_create(global.P_System, _mx, _my, global.Particle1, 5);
}