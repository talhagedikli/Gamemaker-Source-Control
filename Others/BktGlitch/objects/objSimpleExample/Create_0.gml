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

// You can init the shader here manually if you want, otherwise it will be done automatically the first
// time you run BktGlitch_activate(), which might take a few frames.
// BktGlitch_init()
application_surface_draw_enable(false); //disabling automatic redrawing of the application surface
display_set_gui_size(1280, 720); //making sure the GUI layer stays always the same size

ballTimestep = 0.0;
ballTime = 0.0;