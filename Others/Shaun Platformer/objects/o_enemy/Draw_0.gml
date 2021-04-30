draw_self();

if (flash > 0)
{
	flash--;
	shader_set_uniform_color(1,16776960,1);
	draw_self();
	shader_reset();
}