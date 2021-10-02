/// @desc State Events + Visuals

var time = Game.delta;
var resetStateOnAnimationFinish = false;

switch (STATE) {
	default:
	
		var running = onGround && controllerHorizontalMovementInput != 0;
			
		if (running) {
			
			displayReadyPosForTime = 0;
			sprite_switch_to(sKeiraRun);
			index_speed = 0.4;
			
		} else {
			
			displayReadyPosForTime -= time;
			var idleSpr = (displayReadyPosForTime > 0) ? readySprite : idleSprite;
			
			sprite_switch_to(idleSpr);
			index_speed = 0.2;
			
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
		index_speed = attackSpeed;
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
				
				keira_geneirc_damage_create();
				
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
		index_speed = attackSpeed;
		inControl = false;
		
		//Stay In Loop
		if (attackSprite = slideActivateSprite) {
			if (image_index + index_speed >= image_number - index_speed) {
				attackSprite = slideLoopSprite;
			}
		}
		
		//Create Damage
		if (!createdDamage) {
			createdDamage = true;
				
			keira_geneirc_damage_create();
			
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
		index_speed = attackSpeed;
		inControl = false;
		
		resetStateOnAnimationFinish = true;
	break;
	
	case state.combat_air_down:
	
		
		//Set Sprite
		sprite_switch_to(attackSprite);
		index_speed = attackSpeed;
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
				
				keira_geneirc_damage_create();
				
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
if (image_index + index_speed >= image_number - index_speed) {
	
	if (resetStateOnAnimationFinish) {
		STATE = state.base;
		forceHalfGravity = false;
		inControl = true;
	}
}

image_index += index_speed*time;
