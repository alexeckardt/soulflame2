/// @desc

var time = Game.delta;

//Take Damage 
enemy_take_damage();

//Collision
generic_collide_solid();

//Gravity
vSpeed += myGrav;

//Draw
var ff = hitboxes[| 0];
ff.x += 1;