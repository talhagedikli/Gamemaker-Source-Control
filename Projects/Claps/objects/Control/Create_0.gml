global.gameplayClock = new iota_clock();
global.gameplayClock.set_update_frequency(60);

global.uiClock	= new iota_clock();
global.uiClock.set_update_frequency(60);

#region Create Default Objects
instance_create_layer(x, y, layer, Camera);
instance_create_layer(x, y, layer, BackgroundManager);
instance_create_layer(x, y, layer, InputManager);
instance_create_layer(x, y, layer, RoomManager);

instance_create_layer(x, y, layer, test);
#endregion

global.psTest = part_system_create_layer(layer, true);
ptTest = new xParticle(global.psTest);
ptTest.Shape(pt_shape_pixel);
ptTest.Gravity(0.1, 270);
ptTest.Life(60);

time = 0;
timer = new xTimer();
timer.start(200);
