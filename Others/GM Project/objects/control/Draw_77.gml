shader_set(shTempFlash);
shader_set_uniform_f(uniDur, flashDur);

if (flashDur > 0) flashDur--;
flashDur = clamp(flashDur, 0, 60);

draw_surface(application_surface, 0, 0);

shader_reset();