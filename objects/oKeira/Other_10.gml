/// @desc State Events + Visuals

var time = Game.delta;
var resetStateOnAnimationFinish = false;

switch (STATE) {
	default:
	
		var running = onGround && controllerHorizontalMovementInput != 0;
			
		if (running) {
			
			displayReadyPosForTime = 0;
			sprite_switch_to(sKeiraRun);
			image_speed = 0.4;
			
		} else {
			
			displayReadyPosForTime -= time;
			var idleSpr = (displayReadyPosForTime > 0) ? readySprite : idleSprite;
			
			sprite_switch_to(idleSpr);
			image_speed = 0.2;
			
		}
	
		var giveControl = (true); //Replace When Cutscenes Appear
		inControl = giveControl;
	
	
	break;
	
	//
	//Base
	case state.combat_neutral:
	case state.combat_running:
	case state.combat_htilt:
	
		
		//Set Sprite
		sprite_switch_to(attackSprite);
		image_speed = attackSpeed;
		displayReadyPosForTime = room_speed;
		
		//Update Direction Facing
		if (image_index < 1.5) {
			var h = Controller.horizontalStick;
			directionFacing = (h != 0) ? sign(h) : directionFacing;	
		} else {
		
			//Create Damage
			if (!createdDamage) {
				createdDamage = true;
				
				var temp_damageVal = 10;
				var dxx = x + damageCreateXoffset*directionFacing;
				var dyy = y + damageCreateYoffset;
				
				damageObj = damage_create(-1, temp_damageVal, dxx, dyy);
				damageObj.image_xscale = damageCreateWidth * sign(directionFacing+0.001);
				damageObj.image_yscale = damageCreateHeight;
				
				//Knockback Comes From Center Of Keira's Mass
				damageObj.knockbackFromX = x;
				damageObj.knockbackFromY = y - 32;
			}
		
		}
		
		//
		//Set Attributes
		inControl = false;
		resetStateOnAnimationFinish = true;
	
	break;
	
}	

//Animation Complete Events
if (image_index + image_speed >= image_number - image_speed) {
	
	if (resetStateOnAnimationFinish) {
		STATE = state.base;
	}
}	
