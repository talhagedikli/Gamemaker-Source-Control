// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
checkCollisions();
if (isTouching) game_restart();

//snowState.init();
state.step();

//horizontal and vertical collisions
isTouching = check_collisions_pixel_perfect();

xScale = approach(xScale, 1, 0.03);
yScale = approach(yScale, 1, 0.03);


//tracking position
xPos = x;
yPos = y;




