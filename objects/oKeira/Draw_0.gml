/// @desc

//Squash and Squish
squishX = lerp(squishX, 0, sqiushElasticity);
squishY = lerp(squishY, 0, sqiushElasticity);
directionFacingSmooth -= (directionFacing - directionFacingSmooth) * turnSpeed;

var xsc = directionFacing * (1 + squishX);
var ysc = (1 + squishY);

var drawX = round(x);
var drawY = round(y);

draw_sprite_ext(sprite_index, image_index, drawX, drawY, xsc, ysc, 0, blend, alpha);

draw_text(x, y-30, "(" + string(x) + ", " + string(y) + ")")