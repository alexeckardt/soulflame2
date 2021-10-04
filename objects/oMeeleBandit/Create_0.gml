/// @desc

mask_index = sprite_index;

//Get Universal Variables
event_inherited();

//Update Attributes
weight = 1

//Generate Hitbox
enemy_hitbox_add(x, y-24, 15, 30, false);
enemy_hitbox_add(x, y-43, 20, 20, false);

//Attributes
hp = 5;

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
attackSprite = sprite_index;
attackSpeed = 0.3; //Player is approx 0.4;
adjustDirectionFacingPreDamage = false; //Should Aim Assist 
recoveryTime = room_speed/2;
recoveryTimeLeft = 0;
	
//Recovery
recoveryAnimationFinishCancels = true;
timeLayingOnGroundBeforePop = room_speed/2;

//Visuals
blend = c_black; //(for testing so i dont need an anim)