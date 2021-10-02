/// @desc

mask_index = sprite_index;

//Get Universal Variables
event_inherited();

//Update Attributes
weight = 1

//Generate Hitbox
enemy_hitbox_add(x, y-24, 15, 30, false);
enemy_hitbox_add(x, y-43, 20, 20, false);


//Self Variables
airFrictionValue = 0.005;
runSpeed = 2.2;

//Sprites

//State
STATE = state.height;

//Movement
hspdGoal = 0;

//Attack Variaibles
attackDistanceGoal = 48;
recoveryTime = room_speed/2;
recoveryAnimationFinishCancels = false;

//Visuals
blend = c_black; //(for testing so i dont need an anim)