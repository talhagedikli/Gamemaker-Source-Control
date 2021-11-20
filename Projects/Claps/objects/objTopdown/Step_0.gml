state.step();
spd.x = lengthdir_x(motion.x, dir);
spd.y = lengthdir_y(motion.y, dir);
check_collisions_pixel_perfect(objBlock, spd);
