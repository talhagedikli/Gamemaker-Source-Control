onGround = check_below();

if(onGround){
    ySpeed = 0;
}else{
    ySpeed += gSpeed;
}

