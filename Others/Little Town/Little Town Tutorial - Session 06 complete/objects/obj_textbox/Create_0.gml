/// @description Variables, setup

// Textbox variables
textToShow = "Put whatever text you like into this string!"
textWidth = 450;
lineHeight = 28;
global.playerControl = false;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;

// Play UI sound
audio_play_sound(snd_pop01,1,0);

// Dismiss any visible prompts
scr_dismissPrompt(obj_prompt,0);