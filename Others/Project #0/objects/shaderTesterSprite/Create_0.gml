global.slider0 = 0;
global.slider1 = 0;
global.slider2 = 0;


sprite			= sprShaderTest2;
shader			= shSinCity;

uniBlurSteps	= shader_get_uniform(shader, "blur_steps");
uniSigma		= shader_get_uniform(shader, "sigma");
uniTexelSize	= shader_get_uniform(shader, "texel_size");
uniUVs			= shader_get_uniform(shader, "uvs");


var uvsAll		= sprite_get_uvs(sprite, 0);
uvs				= [uvsAll[0],uvsAll[1],uvsAll[2],uvsAll[3]];

imageWidth		= sprite_get_width(sprite);
imageHeight		= sprite_get_height(sprite);	

texelWidth		= (uvsAll[2] - uvsAll[0]) / imageWidth;
texelHeight		= (uvsAll[3] - uvsAll[1]) / imageHeight;



#region colours and con_sat_brt:
//add_keytime(010, 070, 200, 0.7, 0.6, 0.00);	// mid night
//add_keytime(010, 080, 220, 0.8, 0.9, 0.00);	// late night
//add_keytime(220, 200, 175, 1.1, 1.3, 0.05);	// dawn
//add_keytime(245, 235, 190, 1.1, 1.1, 0.10);	// morning
//add_keytime(255, 250, 230, 1.3, 0.9, 0.15);	// noon
//add_keytime(250, 240, 200, 1.4, 1.1, 0.15);	// late after-noon
//add_keytime(215, 150, 165, 1.4, 1.3, 0.20);	// dusk
//add_keytime(010, 080, 220, 0.9, 0.9, 0.00);	// early night
#endregion

#region colours, con_Sat_brt & pop-values:
//add_keytime(010, 070, 200, 0.7, 0.6, 0.00, 2.50, 0.67);	// mid night
//add_keytime(010, 080, 220, 0.8, 0.9, 0.00, 2.00, 0.75);	// late night
//add_keytime(220, 200, 175, 1.1, 1.3, 0.05, 0.80, 0.80);	// dawn
//add_keytime(250, 235, 200, 1.2, 1.1, 0.10, 0.00, 1.00);	// morning
//add_keytime(255, 250, 230, 1.3, 0.9, 0.15, 0.00, 1.00);	// noon
//add_keytime(250, 240, 200, 1.4, 1.1, 0.15, 0.00, 1.00);	// late after-noon
//add_keytime(215, 150, 165, 1.5, 1.4, 0.25, 0.80, 0.80);	// dusk
//add_keytime(010, 080, 220, 0.9, 0.9, 0.00, 2.00, 0.75);	// early night
#endregion

#region Overlay Sytem:
//add_keytime(030,	120,	225,	0.60,	1.00,  -0.20,	0.80,	0.65);	// 00h
//add_keytime(040,	125,	215,	0.65,	0.90,  -0.20,	0.70,	0.65);	// 02h
//add_keytime(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 04h
//add_keytime(125,	070,	175,	1.00,	0.85,  -0.10,  -0.50,	0.60);	// 06h
//add_keytime(160,	145,	100,	1.20,	0.65,  -0.03,	0.00,	1.00);	// 08h
//add_keytime(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 10h
//add_keytime(128,	128,	128,	1.20,	0.85,	0.05,	0.00,	1.00);	// 12h
//add_keytime(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 14h
//add_keytime(140,	130,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 16h
//add_keytime(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 18h
//add_keytime(150,	060,	190,	1.25,	0.70,  -0.05,  -0.50,	0.60);	// 20h
//add_keytime(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 22h
#endregion





