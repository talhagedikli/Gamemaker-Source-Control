/// @description rotate/alpha
image_angle = (image_angle + 2) mod 360;
image_alpha = dsin(image_angle * 4) * 0.25 + 0.75;
