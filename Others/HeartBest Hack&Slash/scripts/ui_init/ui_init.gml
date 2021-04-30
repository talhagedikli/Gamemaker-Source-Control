function ui_init() {
	enum prop {
	    lineSpeed,
	    lineShift,
	    lineResolution,
	    lineVertShift,
	    lineDrift,
	    jumbleSpeed,
	    jumbleShift,
	    jumbleResolution,
	    jumbleness,
	    dispersion,
	    channelShift,
	    noiseLevel, 
	    shakiness,
	    rngSeed,
	    intensity
	};
	setup_property(prop.intensity, 1, "intensity", BktGlitch_set_intensity, 0, 5);
	setup_property(prop.lineShift, 0.004, "lineShift", BktGlitch_set_line_shift, 0, .05);
	setup_property(prop.lineResolution, 1,  "lineResolution", BktGlitch_set_line_resolution, 0, 3);
	setup_property(prop.lineVertShift, 0, "lineVertShift", BktGlitch_set_line_vertical_shift, 0, 1);
	setup_property(prop.lineSpeed, 0.01, "lineSpeed", BktGlitch_set_line_speed, 0, .5);
	setup_property(prop.jumbleness, 0.2, "jumbleness", BktGlitch_set_jumbleness, 0, 1);
	setup_property(prop.jumbleResolution, .2, "jumbleResolution", BktGlitch_set_jumble_resolution, 0, 1);
	setup_property(prop.jumbleShift, 0.15, "jumbleShift", BktGlitch_set_jumble_shift, 0, 1);
	setup_property(prop.jumbleSpeed, 1.0, "jumbleSpeed", BktGlitch_set_jumble_speed, 0, 25);
	setup_property(prop.channelShift, 0.004, "channelShift", BktGlitch_set_channel_shift, 0, .05);
	setup_property(prop.dispersion, 0.0025, "dispersion", BktGlitch_set_channel_dispersion, 0, .5);
	setup_property(prop.noiseLevel,  0.5, "noiseLevel", BktGlitch_set_noise_level, 0, 1);
	setup_property(prop.lineDrift, 0.1,  "lineDrift", BktGlitch_set_line_drift, 0, 1);
	setup_property(prop.shakiness, 0.5,  "shakiness", BktGlitch_set_shakiness, 0, 10);
	setup_property(prop.rngSeed, 0,  "rngSeed", BktGlitch_set_rng_seed, 0, 1);

	logoSeed = random(1);
	headerIntensity = 0;
	alarm[0] = random_range(10, 30);
	surGlitch = -1;
	global.holdingSlider = -1;


}
