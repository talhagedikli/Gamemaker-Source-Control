/// @description text box

// DRAW FRAME:
//-----------------------------------------------------------------------------
scr_draw_9slice_box(frame_sprite, x1_click, y1_click, x2_click, y2_click, frame_slice_size);


// DRAW TEXT:
//-----------------------------------------------------------------------------

// prepare surface:
if (!surface_exists(text_srf))
	text_srf = surface_create(text_srf_w, text_srf_h);
	
surface_set_target(text_srf);
draw_clear_alpha(c_black, 0);

// prepare gpu for alpha premultiplication:
shader_set(shd_premlpha);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);

// draw text -> surface -> application surface:
draw_text_ext(0, text_yoffset, info_text, -1, text_srf_w);
surface_reset_target();
draw_surface(text_srf, x1_click + text_padding, y1_click + text_padding);

// reset GPU:
shader_reset();
gpu_set_blendmode(bm_normal);


// DRAW SCROLL INDICATOR ARROWS:
//-----------------------------------------------------------------------------
if (text_yoffset < -text_padding)
	draw_sprite_ext(spr_arrow_down_7x13px, 0, x2_click - 2 * text_padding, y1_click + 2 * text_padding, 1, 1, 180, c_white, scroll_arrow_blink);
if ((text_height + text_yoffset) > (text_srf_h + text_padding))
	draw_sprite_ext(spr_arrow_down_7x13px, 0, x2_click - 2 * text_padding, y2_click - 2 * text_padding, 1, 1, 000, c_white, scroll_arrow_blink);
