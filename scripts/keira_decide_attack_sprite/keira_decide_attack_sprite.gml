//
//DESC:
//
//
//
function keira_decide_attack_sprite(_nextState){

	//switch (keira.weaponUsing) {
	
		keira_decide_attack_vars_no_weapon(_nextState);

	//}
	
	//Pre Fill Based On Sprite
		//Control Sprite
		allowControlOverIndex = (allowControlOverIndex == -1)
									? sprite_get_number(attackSprite)
									: allowControlOverIndex;
}

function keira_decide_attack_vars_no_weapon(_nextState) {
	
	var spr = 0;
	var spd = 0;
	var damageObjConsistants = [];
	
	switch (_nextState) {
		
		default:
		case state.combat_neutral:
			
			spr = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			spd = 0.65;
			damageObjConsistants = keira_damage_info_array_create(0, -32, 45, 15, 4, 0, -0.5);
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
			
			break;
		
		case state.combat_htilt:
		
			spr = sKeiraPunchHeavyFront;
			spd = 0.4;
			damageObjConsistants = keira_damage_info_array_create(-5, -40, 74, 30, 6, 0, -3);
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
			
			break;
		
		case state.combat_up:
		
			spr = sKeiraUppercut;
			spd = 0.4;
			damageObjConsistants = keira_damage_info_array_create(-10, -80, 50, 64, 1.5, 0, 9);
			
			adjustDirectionFacingPreDamage = false;
			allowControlOverIndex = 4;
			
			break;
		
		case state.combat_slide:
		
			spr = sKeiraSlideActivate;
			spd = 0.5;
			damageObjConsistants = keira_damage_info_array_create(-25, -20, 48, 30, 6, slidingInDirection*3, -3);

			adjustDirectionFacingPreDamage = false;
			allowControlOverIndex = -1;
			slidingInDirection = directionFacing;
			slideSpeed = slideMaxSpeed;
			slideExitSpeed = slideExitSpeedBase;
				
			break;
		
		
		//
		//AIR
		//
		
		case state.combat_air_neutral:
			
			spr = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			spd = 0.65;
			damageObjConsistants = keira_damage_info_array_create(0, -32, 45, 15, 4, 0, -0.5);
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = 2;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			
			break;
		
		case state.combat_air_up:
			
			spr = sKeiraUppercut;
			spd = 0.4;
			damageObjConsistants = keira_damage_info_array_create(-18, -80, 65, 64, 2, 0, -7);
			
			adjustDirectionFacingPreDamage = false;
			forceHalfGravity = true;
			allowControlOverIndex = 1;
			
			//Stay In Air Longer
			vSpeed = min(0, vSpeed) + jumpSpeed * combatInAirJumpCoefficient;
			if (vSpeed > 0) {
				vSpeed /= 2;}
			
			break;
			
		case state.combat_air_down:
			
			spr = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			spd = 0.65;
			
			var w = 30;
			damageObjConsistants = keira_damage_info_array_create(-w/2, -16, w, 32, 4, 0, 1);
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = 1;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			
			break;
			
		case state.combat_air_horizontal:
			
			spr = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			spd = 0.4;
			damageObjConsistants = keira_damage_info_array_create(-5, -40, 74,30, 8, 0, 0);
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			vSpeed += 1.5;
			
			break;
	}
	
	//Do The Setup
	keira_attacking_sprite_setup(spr, spd, damageObjConsistants);
	
}