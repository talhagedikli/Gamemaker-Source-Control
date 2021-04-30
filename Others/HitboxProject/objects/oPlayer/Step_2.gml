xPos = x;
yPos = y;

animation_control();

//animation
frame_reset();

//hurtbox
with(hurtbox){
    x = other.x + xOffset;
    y = other.y + yOffset;
}

//hitbox
if(hitbox != -1){
    with(hitbox){
        x = other.x + xOffset;
        y = other.y + yOffset;
        
        //collision check  
        //checking the collision from the hurtbox object
        with(oHurtbox){
            if(place_meeting(x,y,other) && other.owner != owner){
                //ignore check
                //checking collision from the hitbox object
                with(other){
                    //check to see if your target is on the ignore list
                    //if it is on the ignore list, dont hit it again
                    for(i = 0; i < ds_list_size(ignoreList); i ++){
                        if(ignoreList[|i] = other.owner){
                            ignore = true;
                            break;
                        }
                    }
                    //if it is NOT on the ignore list, hit it, and add it to
                    //the ignore list
                    if(!ignore){
                        other.owner.hit = true;
                        other.owner.hitBy = id;
                        ds_list_add(ignoreList,other.owner);
                    }
                }
            }
        }
    }
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

