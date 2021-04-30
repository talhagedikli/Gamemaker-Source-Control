xPos = x;
yPos = y;

animation_control_enemy();

//animation
frame_reset();

//hurtbox
with(hurtbox){
    x = other.x + xOffset;
    y = other.y + yOffset;
}

//get hit
if(hit){
    squash_stretch(1.3,1.3);
    xSpeed  = hitBy.xHit;
    hitStun = hitBy.hitStun;
    facing  = hitBy.owner.facing * -1;
    hit     = false;
    currentState = states.hit;
}

///collision
var h, v;

// Handle sub-pixel movement
xCounter += xSpeed;
yCounter += ySpeed;
h = round(xCounter);
v = round(yCounter);
xCounter -= h;
yCounter -= v;

repeat(abs(v)){
    if(ySpeed <= 0){
        if(place_meeting(x,y+sign(v),oBlocker)){
            ySpeed = 0;
            break;
        }else{
            y += sign(v);
        }
    }else if (check_below()){
        ySpeed = 0;
        break;
    }else{
        y += sign(v);
    }
}

repeat(abs(h)){
    if(place_meeting(x+sign(h),y,oBlocker)){
            xSpeed = 0;
        break;
    }else{
        x += sign(h);
    }
}

