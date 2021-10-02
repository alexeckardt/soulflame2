/// @desc Visuals and Accositated

var time = Game.delta;

//
//	TEMP SPRITES
//

var resetStateOnAnimationFinish = false;

switch (STATE) {

	default:
	case state.height:
	
		sprite_index = sBanditIdle;
		index_speed = 0.2;
	
	break;
	
	case state.base:
	
		if (onGround) {
			if (abs(controlHSpeed) > 0.3) { 
				sprite_switch_to(sKeiraRun);
				index_speed = 0.4;
			} else {
				sprite_index = sBanditIdle;
				index_speed = 0.2;	
			}
		}
	
	break;
	
	case state.combat_htilt:

		sprite_switch_to(attackSprite);
		index_speed = attackSpeed;
		displayReadyPosForTime = room_speed;
		
		//Update Direction Facing
		if (image_index < 1.5) {
			
			if (adjustDirectionFacingPreDamage) {
				directionFacing = sign(target.x - x + 0.002)
			}
			
		} else {
		
			//Create Damage
			if (!createdDamage) {
				createdDamage = true;
				
				//Create Damage
				var damageType = damage_type.impact;
				var damageValue = 5;
				var damageX = x + directionFacing * 16;
				var damageY = y - 48;
				var damageWidth = 20*sign(directionFacing+0.001);
				var damageHeight = 32
			
				damageObj = damage_create_ext(damageType, damageValue, damageX, damageY, damageWidth, damageHeight);
	
				//Add Vector
				damageObj.addToVSpeed = damageKnockbackAddVSpeed;
				if (damageKnockbackAddHspeedRelative) {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed*directionFacing;} else {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed;}
			}
		
		}
		
		//
		//Reset State
		if (image_index + index_speed > image_number - index_speed) {
			STATE = state.combat_recovery;	
			recoveryTimeLeft = recoveryTime;
			
			sprite_index = sBanditIdle;
			index_speed = 0.2;
		}

	break;
	
	case state.combat_recovery:
	
		//Sprite should be set on switch as this is a generic state
		
		//Causes Recovery to be based of time OR regular animation, whichever happens first
		resetStateOnAnimationFinish = recoveryAnimationFinishCancels;
		
		//Time
		recoveryTimeLeft -= time;
		if (recoveryTimeLeft < 0) {
			//Switch to Base State
			image_index = image_number;
			resetStateOnAnimationFinish = true;
		}
		
		
	
	break;
	
}

//Reset State
entity_state_reset_on_animation_finish(resetStateOnAnimationFinish);

//Animate
image_index += index_speed * time/2