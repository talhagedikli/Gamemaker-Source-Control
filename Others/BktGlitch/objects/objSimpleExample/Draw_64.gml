// Activating the shader
BktGlitch_activate();

// Quickly setting all parameters at once using a preset
BktGlitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
BktGlitch_set_jumbleness(0.5);
BktGlitch_set_jumble_speed(2.5);
BktGlitch_set_jumble_resolution(random_range(0.2, 0.4));
BktGlitch_set_jumble_shift(random_range(0.2, 0.4));
BktGlitch_set_channel_shift(0.01);
BktGlitch_set_channel_dispersion(.05);

// Setting the overall intensity of the effect, adding a bit when the ball bounces.
BktGlitch_set_intensity(0.025 + bounceIntensity);

// Drawing the application surface
draw_surface(application_surface, 0, 0);

// Done with the shader (this is really just shader_reset)!
BktGlitch_deactivate();