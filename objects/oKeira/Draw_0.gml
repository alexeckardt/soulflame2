/// @desc

//Squash and Squish
squishX = lerp(squishX, 0, sqiushElasticity);
squishY = lerp(squishY, 0, sqiushElasticity);
var scX = round(squishX * 100) / 100;
var scY = round(squishY * 100) / 100;

directionFacingSmooth -= (directionFacing - directionFacingSmooth) * turnSpeed;

var xsc = directionFacing * (1 + scX);
var ysc = (1 + scY);



var drawX = (x);
var drawY = (y);

draw_sprite_ext(sprite_index, image_index, drawX, drawY, xsc, ysc, 0, blend, alpha);

draw_text(x, y- 60, Player.weaponUsing);