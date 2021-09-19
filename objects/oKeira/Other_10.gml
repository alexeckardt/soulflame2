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
	case state.combat_up:
	case state.combat_air_up:
	case state.combat_air_neutral:
	case state.combat_air_horizontal:
	
		
		//Set Sprite
		sprite_switch_to(attackSprite);
		image_speed = attackSpeed;
		displayReadyPosForTime = room_speed;
		
		//Update Direction Facing
		if (image_index < 1.5) {
			
			if (adjustDirectionFacingPreDamage) {
				var h = Controller.horizontalStick;
				directionFacing = (h != 0) ? sign(h) : directionFacing;	
			}
			
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
				damageObj.knockbackAmount = damageKnockbackMulti;
				damageObj.knockbackFromX = x;
				damageObj.knockbackFromY = y - 4;
				
				//Add Vector
				damageObj.addToVSpeed = damageKnockbackAddVSpeed;
				if (damageKnockbackAddHspeedRelative) {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed*directionFacing;} else {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed;}
			}
		
		}
		
		//
		//Set Attributes
		inControl = image_index > allowControlOverIndex;
		resetStateOnAnimationFinish = true;
	
	break;
	
	case state.combat_slide:
	
		sprite_switch_to(attackSprite);
		image_speed = attackSpeed;
		inControl = false;
		
		//Stay In Loop
		if (attackSprite = slideActivateSprite) {
			if (image_index + image_speed >= image_number - image_speed) {
				attackSprite = slideLoopSprite;
			}
		}
		
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
			damageObj.knockbackAmount = damageKnockbackMulti;
			damageObj.knockbackFromX = x;
			damageObj.knockbackFromY = y - 4;
			
			damageObj.addToHSpeed = damageKnockbackAddHSpeed;
			damageObj.addToVSpeed = damageKnockbackAddVSpeed;
			damageObj.allowLifeDecay = false;
			damageObj.followCreator = true;
		
		} else {
		
			//If Hit Enemy, Cut Speed
			if (damageObj.hasHitEnemyAllowUpdate) {
				damageObj.hasHitEnemyAllowUpdate = false;
				slideSpeed = lerp(slideSpeed, 0, 0.5);
				
				slideExitSpeed += 0.2;
	
			}	
		
		}
	
		//Reduce Speed
		slideSpeed = lerp(slideSpeed, 0, slideSpeedReduction);
	
		//Set State To Recovery State
		if (slideSpeed < slideExitSpeed) {
			STATE = state.combat_slide_recover;
			damageObj.allowLifeDecay = true;
			damageObj.life = -1;
		}
	
	break;
	
	//Recovery Animation States
	case state.combat_slide_recover:
		sprite_switch_to(slideRecoverSprite);
		image_speed = attackSpeed;
		inControl = false;
		
		resetStateOnAnimationFinish = true;
	break;
	
	case state.combat_air_down:
	
		
		//Set Sprite
		sprite_switch_to(attackSprite);
		image_speed = attackSpeed;
		displayReadyPosForTime = room_speed;
		
		//Update Direction Facing
		if (image_index < 1.5) {
			
			if (adjustDirectionFacingPreDamage) {
				var h = Controller.horizontalStick;
				directionFacing = (h != 0) ? sign(h) : directionFacing;	
			}
			
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
				damageObj.knockbackAmount = damageKnockbackMulti;
				damageObj.knockbackFromX = x;
				damageObj.knockbackFromY = y - 4;
				
				//Add Vector
				damageObj.addToVSpeed = damageKnockbackAddVSpeed;
				if (damageKnockbackAddHspeedRelative) {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed*directionFacing;} else {
					damageObj.addToHSpeed = damageKnockbackAddHSpeed;}
			} else {
				
				//Check If Damage Connected, If So, Jump and Transition to Base State
				//(Use Cool Animation Though)
				if (instance_exists(damageObj)) {
					if (damageObj.hasHitEnemyAllowUpdate) {
					
						//Bounce Complete
						allowControlOverIndex = -1;
						image_index = image_number;
					
						//Roccognize Jumo
						forceJump = true;
						bouncingOffEnemy = true;
					
						//Resend Dmg
						damageObj.hasHitEnemyAllowUpdate = false;
					
					}
				}
			
			}
		
		}
		
		//
		//Set Attributes
		inControl = image_index > allowControlOverIndex;
		resetStateOnAnimationFinish = true;
	
	break;
	
}	

//Animation Complete Events
if (image_index + image_speed >= image_number - image_speed) {
	
	if (resetStateOnAnimationFinish) {
		STATE = state.base;
		forceHalfGravity = false;
		inControl = true;
	}
}	
