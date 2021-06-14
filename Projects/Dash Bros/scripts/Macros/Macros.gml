#region// Camera
#macro VIEW		view_camera[0]

#macro GUI_W	display_get_gui_width()
#macro GUI_H	display_get_gui_height()

#macro CAM_W	camera_get_view_width(VIEW)
#macro CAM_H	camera_get_view_height(VIEW)

#macro CAM_X	camera_get_view_x(VIEW)
#macro CAM_Y	camera_get_view_y(VIEW)

#macro APP_W	surface_get_width(application_surface)
#macro APP_H	surface_get_height(application_surface)

#macro WIN_W	window_get_width()							
#macro WIN_H	window_get_height()

#macro DIS_W	display_get_width()							// The actual width of the monitor
#macro DIS_H	display_get_height()						// The actual height of the monitor
#endregion

#region// Inputs
#macro RIGHT			keyboard_check(vk_right)
#macro UP				keyboard_check(vk_up)
#macro LEFT				keyboard_check(vk_left)
#macro DOWN				keyboard_check(vk_down)

#macro SPACE			keyboard_check(vk_space)
#macro ALT				keyboard_check(vk_alt)

#macro RIGHT_PRESSED	keyboard_check_pressed(vk_right)
#macro UP_PRESSED		keyboard_check_pressed(vk_up)
#macro LEFT_PRESSED		keyboard_check_pressed(vk_left)
#macro DOWN_PRESSED		keyboard_check_pressed(vk_down)

#macro SPACE_PRESSED	keyboard_check_pressed(vk_space)
#macro ALT_PRESSED		keyboard_check_pressed(vk_alt)
#endregion

#region// General 
#macro FLIP_COIN		choose(true, false)
#macro EPSILON			0.001

#macro log				show_debug_message
#macro show		 		show_message

#macro ignore			if (true) { } else

#macro defer			for (;; {
#macro after			; break; })

//defer {
//	show("second");
//} after {
//	show("first");	
//}

#macro loopi			var i = 0; repeat
#macro loopj			var i = 0; repeat
#macro loopk			var i = 0; repeat

#macro print                           \ // Multiline macro example
    for (var print_value;; {           \
      show_debug_message(print_value); \
      break;                           \
    }) print_value =

//#macro BUILTIN_SHOW_DEBUG_MESSAGE show_debug_message
//#macro show_debug_message overrides_show_debug_message

//function overrides_show_debug_message(_str) {
//  BUILTIN_SHOW_DEBUG_MESSAGE(_str); // call the original implementation
//  var file = file_text_open_append("game.log");
//  file_text_write_string(file, _str);
//  file_text_writeln(file);
//  file_text_close(file);
//}

#endregion

#region// Colours
#macro C_CRIMSON		make_color_rgb(184, 15, 10)
#macro C_LMCHIFFON		make_color_rgb(255, 249, 204)
#macro C_BARNRED		make_color_rgb(124, 10, 2)
#macro C_DARKCHARCOAL	make_color_rgb(51, 51, 51)
#macro C_ONYX			$0f0f0f
#macro C_SMOKY_BLACK	$080C10
#macro C_ANCHOR			$4c4241
#macro C_SHADOW			$373737
#macro C_LEAD			$4e3f3f
#macro C_RANDOM			make_colour_hsv(irandom(255), irandom(255), irandom(255))
// Generated from: http://web.archive.org/web/20210303185939/https://www.computerhope.com/htmcolor.htm
#macro c_black                          0x000000
#macro c_night                          0x0a090c
#macro c_gunmetal                       0x39352c
#macro c_midnight                       0x171b2b
#macro c_charcoal                       0x2c2834
#macro c_dark_slate_grey                0x3c3825
#macro c_oil                            0x31313b
#macro c_black_cat                      0x393841
#macro c_iridium                        0x3a3c3d
#macro c_black_eel                      0x3f3e46
#macro c_black_cow                      0x46464c
#macro c_gray_wolf                      0x4b4a50
#macro c_vampire_gray                   0x515056
#macro c_gray_dolphin                   0x58585c
#macro c_carbon_gray                    0x5d5d62
#macro c_ash_gray                       0x626366
#macro c_cloudy_gray                    0x68696d
#macro c_smokey_gray                    0x6d6e72
#macro c_gray                           0x6e6f73
#macro c_granite                        0x7c7e83
#macro c_battleship_gray                0x828484
#macro c_gray_cloud                     0xb4b6b6
#macro c_gray_goose                     0xced0d1
#macro c_platinum                       0xe2e4e5
#macro c_metallic_silver                0xccc6bc
#macro c_blue_gray                      0xc7af98
#macro c_light_slate_gray               0x8d7b6d
#macro c_slate_gray                     0x837365
#macro c_jet_gray                       0x7e6d61
#macro c_mist_blue                      0x7e6d64
#macro c_marble_blue                    0x7e6d56
#macro c_slate_blue                     0xa17c73
#macro c_steel_blue                     0xa06348
#macro c_blue_jay                       0x7e542b
#macro c_dark_slate_blue                0x56382b
#macro c_midnight_blue                  0x541b15
#macro c_navy_blue                      0x800000
#macro c_blue_whale                     0x7e2d34
#macro c_lapis_blue                     0x7e3115
#macro c_denim_dark_blue                0x8d1b15
#macro c_earth_blue                     0xa00000
#macro c_cobalt_blue                    0xc22000
#macro c_blueberry_blue                 0xc24100
#macro c_sapphire_blue                  0xc75425
#macro c_blue_eyes                      0xc76915
#macro c_royal_blue                     0xde602b
#macro c_blue_orchid                    0xfc451f
#macro c_blue_lotus                     0xec6069
#macro c_light_slate_blue               0xff6a73
#macro c_windows_blue                   0xc77e35
#macro c_glacial_blue_ice               0xc18b36
#macro c_silk_blue                      0xc78a48
#macro c_blue_ivy                       0xc79030
#macro c_blue_koi                       0xc79e65
#macro c_columbia_blue                  0xc7af87
#macro c_baby_blue                      0xc7b995
#macro c_light_steel_blue               0xce8f72
#macro c_ocean_blue                     0xec652b
#macro c_blue_ribbon                    0xff6e30
#macro c_blue_dress                     0xec7d15
#macro c_dodger_blue                    0xff8915
#macro c_cornflower_blue                0xed9564
#macro c_sky_blue                       0xff9866
#macro c_butterfly_blue                 0xecac38
#macro c_iceberg                        0xeca556
#macro c_crystal_blue                   0xffb35c
#macro c_deep_sky_blue                  0xffb93b
#macro c_denim_blue                     0xecba79
#macro c_light_sky_blue                 0xfaca82
#macro c_day_sky_blue                   0xffca82
#macro c_jeans_blue                     0xeccfa0
#macro c_blue_angel                     0xecceb7
#macro c_pastel_blue                    0xeccfb4
#macro c_sea_blue                       0xffdfc2
#macro c_powder_blue                    0xffdec6
#macro c_coral_blue                     0xecdcaf
#macro c_light_blue                     0xffdfad
#macro c_robin_egg_blue                 0xffedbd
#macro c_pale_blue_lily                 0xececcf
#macro c_light_cyan                     0xffffe0
#macro c_water                          0xfaf4eb
#macro c_aliceblue                      0xfff8f0
#macro c_azure                          0xfffff0
#macro c_light_slate                    0xffffcc
#macro c_light_aquamarine               0xe8ff93
#macro c_electric_blue                  0xfffe9a
#macro c_aquamarine                     0xd4ff7f
#macro c_cyan_or_aqua                   0xffff00
#macro c_tron_blue                      0xfefd7d
#macro c_blue_zircon                    0xfffe57
#macro c_blue_lagoon                    0xeceb8e
#macro c_celeste                        0xeceb50
#macro c_blue_diamond                   0xece24e
#macro c_tiffany_blue                   0xd0d881
#macro c_cyan_opaque                    0xc7c792
#macro c_blue_hosta                     0xc7bf77
#macro c_northern_lights_blue           0xc7c778
#macro c_medium_turquoise               0xcdcc48
#macro c_turquoise                      0xdbc643
#macro c_jellyfish                      0xc7c746
#macro c_blue_green                     0xb5cc7b
#macro c_macaw_blue_green               0xc7bf43
#macro c_light_sea_green                0x9fa93e
#macro c_dark_turquoise                 0x9c9c3b
#macro c_sea_turtle_green               0x808d43
#macro c_medium_aquamarine              0x818734
#macro c_greenish_blue                  0x7e7d30
#macro c_grayish_turquoise              0x7e7d5e
#macro c_beetle_green                   0x7e784c
#macro c_teal                           0x808000
#macro c_sea_green                      0x75894e
#macro c_camouflage_green               0x6b8678
#macro c_sage_green                     0x798b84
#macro c_hazel_green                    0x587c61
#macro c_venom_green                    0x008c72
#macro c_fern_green                     0x267c66
#macro c_dark_forest_green              0x174125
#macro c_medium_sea_green               0x546730
#macro c_medium_forest_green            0x357234
#macro c_seaweed_green                  0x177c43
#macro c_pine_green                     0x447c38
#macro c_jungle_green                   0x2c7c34
#macro c_shamrock_green                 0x177c34
#macro c_medium_spring_green            0x178034
#macro c_forest_green                   0x58924e
#macro c_green_onion                    0x21a16a
#macro c_spring_green                   0x2ca04a
#macro c_lime_green                     0x17a341
#macro c_clover_green                   0x55a03e
#macro c_green_snake                    0x3cbb6c
#macro c_alien_green                    0x17c46c
#macro c_green_apple                    0x17c44c
#macro c_yellow_green                   0x17d052
#macro c_kelly_green                    0x52c54c
#macro c_zombie_green                   0x71c554
#macro c_frog_green                     0x8ec699
#macro c_green_peas                     0x5cc389
#macro c_dollar_bill_green              0x65bb85
#macro c_dark_sea_green                 0x81b38b
#macro c_iguana_green                   0x71b09c
#macro c_avocado_green                  0x48c2b2
#macro c_pistachio_green                0x09c29d
#macro c_salad_green                    0x35c9a1
#macro c_hummingbird_green              0x17e87f
#macro c_nebula_green                   0x17e859
#macro c_stoplight_go_green             0x64e957
#macro c_algae_green                    0x86e964
#macro c_jade_green                     0x6efb5e
#macro c_green                          0x00ff00
#macro c_emerald_green                  0x17fb5f
#macro c_lawn_green                     0x17f787
#macro c_chartreuse                     0x17fb8a
#macro c_dragon_green                   0x92fb6a
#macro c_mint_green                     0x98ff98
#macro c_green_thumb                    0xaaeab5
#macro c_light_jade                     0xb8fdc3
#macro c_tea_green                      0x5dfbcc
#macro c_green_yellow                   0x17fbb1
#macro c_slime_green                    0x54e9bc
#macro c_goldenrod                      0x74daed
#macro c_harvest_gold                   0x75e2ed
#macro c_sun_yellow                     0x7ce8ff
#macro c_yellow                         0x00ffff
#macro c_corn_yellow                    0x80f3ff
#macro c_parchment                      0xc2ffff
#macro c_cream                          0xccffff
#macro c_lemon_chiffon                  0xc6f8ff
#macro c_cornsilk                       0xdcf8ff
#macro c_beige                          0xdcf5f5
#macro c_blonde                         0xd9f6fb
#macro c_antiquewhite                   0xd7ebfa
#macro c_champagne                      0xcee7f7
#macro c_blanchedalmond                 0xcdebff
#macro c_vanilla                        0xabe5f3
#macro c_tan_brown                      0xb6e5ec
#macro c_peach                          0xb4e5ff
#macro c_mustard                        0x58dbff
#macro c_rubber_ducky_yellow            0x01d8ff
#macro c_bright_gold                    0x17d0fd
#macro c_golden_brown                   0x17c1ea
#macro c_macaroni_and_cheese            0x66bbf2
#macro c_saffron                        0x17b9fb
#macro c_beer                           0x17b1fb
#macro c_cantaloupe                     0x2fa6ff
#macro c_bee_yellow                     0x17abe9
#macro c_brown_sugar                    0x6fa7e2
#macro c_burlywood                      0x87b8de
#macro c_deep_peach                     0xa4cbff
#macro c_ginger_brown                   0x62bec9
#macro c_school_bus_yellow              0x17a3e8
#macro c_sandy_brown                    0x4d9aee
#macro c_fall_leaf_brown                0x60b5c8
#macro c_orange_gold                    0x17a0d4
#macro c_sand                           0x80b2c2
#macro c_cookie_brown                   0x17a3c7
#macro c_caramel                        0x178ec6
#macro c_brass                          0x42a6b5
#macro c_khaki                          0x6ea9ad
#macro c_camel_brown                    0x6b9ac1
#macro c_bronze                         0x327fcd
#macro c_tiger_orange                   0x4181c8
#macro c_cinnamon                       0x1789c5
#macro c_bullet_shell                   0x609baf
#macro c_dark_goldenrod                 0x1778af
#macro c_copper                         0x3373b8
#macro c_wood                           0x336f96
#macro c_oak_brown                      0x176580
#macro c_moccasin                       0x397882
#macro c_army_brown                     0x607b82
#macro c_sandstone                      0x5f6d78
#macro c_mocha                          0x263d49
#macro c_taupe                          0x323c48
#macro c_coffee                         0x374e6f
#macro c_brown_bear                     0x3b5c83
#macro c_red_dirt                       0x17527f
#macro c_sepia                          0x2c467f
#macro c_orange_salmon                  0x5174c4
#macro c_rust                           0x4162c3
#macro c_red_fox                        0x1758c3
#macro c_chocolate                      0x175ac8
#macro c_sedona                         0x0066cc
#macro c_papaya_orange                  0x1767e5
#macro c_halloween_orange               0x2c6ce6
#macro c_pumpkin_orange                 0x1772f8
#macro c_construction_cone_orange       0x3174f8
#macro c_sunrise_orange                 0x5174e6
#macro c_mango_orange                   0x4080ff
#macro c_dark_orange                    0x1780f8
#macro c_coral                          0x507fff
#macro c_basket_ball_orange             0x5881f8
#macro c_light_salmon                   0x6b96f9
#macro c_tangerine                      0x618ae7
#macro c_dark_salmon                    0x6b8be1
#macro c_light_coral                    0x7174e7
#macro c_bean_red                       0x595df7
#macro c_valentine_red                  0x5154e5
#macro c_shocking_orange                0x3c5be5
#macro c_red                            0x0000ff
#macro c_scarlet                        0x0024ff
#macro c_ruby_red                       0x1722f6
#macro c_ferrari_red                    0x1a0df7
#macro c_fire_engine_red                0x1728f6
#macro c_lava_red                       0x1722e4
#macro c_love_red                       0x171be4
#macro c_grapefruit                     0x1f38dc
#macro c_chestnut_red                   0x2c4ac3
#macro c_cherry_red                     0x4146c2
#macro c_mahogany                       0x0040c0
#macro c_chilli_pepper                  0x171bc1
#macro c_cranberry                      0x0f009f
#macro c_red_wine                       0x120099
#macro c_burgundy                       0x1a008c
#macro c_chestnut                       0x354595
#macro c_blood_red                      0x17357e
#macro c_sienna                         0x17418a
#macro c_sangria                        0x17387e
#macro c_firebrick                      0x170580
#macro c_maroon                         0x410581
#macro c_plum_pie                       0x41057d
#macro c_velvet_maroon                  0x4d357e
#macro c_plum_velvet                    0x52057d
#macro c_rosy_finch                     0x524e7f
#macro c_puce                           0x585a7f
#macro c_dull_purple                    0x5d527f
#macro c_rosy_brown                     0x8184b3
#macro c_khaki_rose                     0x8e90c5
#macro c_pink_bow                       0x8981c4
#macro c_lipstick_pink                  0x9387c4
#macro c_rose                           0xaaade8
#macro c_rose_gold                      0xc0c5ec
#macro c_desert_sand                    0xafc9ed
#macro c_pig_pink                       0xe4d7fd
#macro c_cotton_candy                   0xffdffc
#macro c_pink_bubble_gum                0xdddfff
#macro c_misty_rose                     0xb9bbfb
#macro c_pink                           0xbeaffa
#macro c_light_pink                     0xbaaffa
#macro c_flamingo_pink                  0xb0a7f9
#macro c_pink_rose                      0xb0a1e7
#macro c_pink_daisy                     0xa399e7
#macro c_cadillac_pink                  0xae8ae3
#macro c_carnation_pink                 0xa178f7
#macro c_blush_red                      0x946ee5
#macro c_hot_pink                       0xab60f6
#macro c_watermelon_pink                0x856cfc
#macro c_violet_red                     0x8a35f6
#macro c_deep_pink                      0x8728f5
#macro c_pink_cupcake                   0x9d5ee4
#macro c_pink_lemonade                  0x7c28e4
#macro c_neon_pink                      0xaa35f5
#macro c_magenta                        0xff00ff
#macro c_dimorphotheca_magenta          0x9d31e3
#macro c_bright_neon_pink               0xff33f4
#macro c_pale_violet_red                0x8765d1
#macro c_tulip_pink                     0x7c5ac2
#macro c_medium_violet_red              0x6b22ca
#macro c_rogue_pink                     0x6928c1
#macro c_burnt_pink                     0x6722c1
#macro c_bashful_pink                   0x8352c2
#macro c_dark_carnation_pink            0x8322c1
#macro c_plum                           0x8f3bb9
#macro c_viola_purple                   0x7e587e
#macro c_purple_iris                    0x7e1b57
#macro c_plum_purple                    0x593758
#macro c_indigo                         0x82004b
#macro c_purple_monster                 0x7e1b46
#macro c_purple_haze                    0x7e384e
#macro c_eggplant                       0x514061
#macro c_grape                          0x805a5e
#macro c_purple_jam                     0x7e286a
#macro c_dark_orchid                    0x7e1b7d
#macro c_purple_flower                  0xc74aa7
#macro c_medium_orchid                  0xb548b0
#macro c_purple_amethyst                0xc72d6c
#macro c_dark_violet                    0xce2d84
#macro c_violet                         0xc9388d
#macro c_purple_sage_bush               0xc75d7a
#macro c_lovely_purple                  0xec387f
#macro c_purple                         0xef358e
#macro c_aztech_purple                  0xff3b89
#macro c_medium_purple                  0xd76784
#macro c_jasmine_purple                 0xec3ba2
#macro c_purple_daffodil                0xff41b0
#macro c_tyrian_purple                  0xec5ac4
#macro c_crocus_purple                  0xec7291
#macro c_purple_mimosa                  0xff7b9e
#macro c_heliotrope_purple              0xff62d4
#macro c_crimson                        0xec38e2
#macro c_purple_dragon                  0xc78ec3
#macro c_lilac                          0xc8a2c8
#macro c_blush_pink                     0xeca9e6
#macro c_mauve                          0xffb0e0
#macro c_wisteria_purple                0xc7aec6
#macro c_blossom_pink                   0xffb7f9
#macro c_thistle                        0xd3b9d2
#macro c_periwinkle                     0xeccfe9
#macro c_lavender_pinocchio             0xe2ddeb
#macro c_lavender_blue                  0xfae4e3
#macro c_pearl                          0xf4eefd
#macro c_seashell                       0xeef5ff
#macro c_milk_white                     0xfffcfe
#macro c_white                          0xffffff
#endregion


