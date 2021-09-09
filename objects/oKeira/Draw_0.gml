/// @desc

//Squash and Squish
squishX = lerp(squishX, 1, sqiushElasticity);
squishY = lerp(squishY, 1, sqiushElasticity);
directionFacingSmooth -= (directionFacing - directionFacingSmooth) * turnSpeed;

var xsc = directionFacing * squishX;
var ysc = squishY;
draw_sprite_ext(sprite_index, image_index, x, y, xsc, ysc, 0, blend, alpha);

draw_text(x, y-30, "(" + string(x) + ", " + string(y) + ")")