//////////////////////////////////
//                              //
//   bktGlitch 1.3.1            //
//    Written by Jan Vorisek    //
//     @blokatt | blokatt.net   //
//      jan@blokatt.net         //
//       18/07/2020             //
//                              //
//  "It's been a long time..."  //
//								//
//////////////////////////////////

/*
    See Draw GUI for setup instructions.
    
    Easier example available in objSimpleExample, change the room order to see it in action.
*/

// You can init the shader here manually if you want, otherwise it will be done automatically the first
// time you run BktGlitch_activate(), which might take a few frames.
// BktGlitch_init()
application_surface_draw_enable(false); //disabling automatic redrawing of the application surface
display_set_gui_size(1280, 720);//hard-setting GUI size to HD

ui_init();