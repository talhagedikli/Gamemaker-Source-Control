function PlayerClass() constructor 
{
	id			= other.id;
    sprite		= other.sprite_index;
    frame		= other.image_index;
    x			= other.x;
    y			= other.y;
    xScale		= other.image_xscale;
    yScale		= other.image_yscale;
    rotation	= other.image_angle;
    color		= other.image_blend;
    alpha		= other.image_alpha;
    
    state = new SnowState("normal");
    
    static enter = function()
    {
		
    }
	
    static update = function()
    {
        
    }
    
    static draw = function()
    {
        draw_sprite_ext(sprite, frame, x, y, xScale, yScale, rotation, color, alpha);
    }
    
}