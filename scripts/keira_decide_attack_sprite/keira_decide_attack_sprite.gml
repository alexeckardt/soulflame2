//
//DESC:
//
//
//
function keira_decide_attack_sprite(_nextState){

	//switch (keira.weaponUsing) {
	
	switch (_nextState) {
		
		default:
		case state.combat_neutral:
			
			attackSprite = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			attackSpeed = 0.65;
			
			damageCreateXoffset	= 0;
			damageCreateYoffset	= -32;
			damageCreateWidth	= 45;
			damageCreateHeight	= 15;
			damageKnockbackMulti = 4;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -0.5;
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
			
			break;
		
		case state.combat_htilt:
		
			attackSprite = (useFront) ? sKeiraPunchHeavyFront : sKeiraPunchHeavyFront;
			attackSpeed = 0.4;
			
			damageCreateXoffset	= -5;
			damageCreateYoffset	= -40;
			damageCreateWidth	= 74;
			damageCreateHeight	= 30;
			damageKnockbackMulti = 6;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -3;
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
			
			break;
		
		case state.combat_up:
		
			attackSprite = sKeiraUppercut;
			attackSpeed = 0.4;
			
			damageCreateXoffset	= -10;
			damageCreateYoffset	= -80;
			damageCreateWidth	= 50;
			damageCreateHeight	= 64;
			damageKnockbackMulti = 1.5;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -9;
			
			adjustDirectionFacingPreDamage = false;
			allowControlOverIndex = 4;
			
			break;
		
		case state.combat_slide:
		
			attackSprite = sKeiraSlideActivate;
			attackSpeed = 0.5;
			
			adjustDirectionFacingPreDamage = false;
			slidingInDirection = directionFacing;
			slideSpeed = slideMaxSpeed;
			slideExitSpeed = slideExitSpeedBase;
			
			damageCreateXoffset	= -25;
			damageCreateYoffset	= -20;
			damageCreateWidth	= 48;
			damageCreateHeight	= 30;
			damageKnockbackMulti = 6;
			damageKnockbackAddHSpeed = slidingInDirection*3;
			damageKnockbackAddVSpeed = -3;
			allowControlOverIndex = -1;
				
			break;
		
		
		//
		//AIR
		//
		
		case state.combat_air_neutral:
			
			attackSprite = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			attackSpeed = 0.65;
			
			damageCreateXoffset	= 0;
			damageCreateYoffset	= -32;
			damageCreateWidth	= 45;
			damageCreateHeight	= 15;
			damageKnockbackMulti = 4;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -0.5;
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = 2;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			
			break;
		
		case state.combat_air_up:
			
			attackSprite = sKeiraUppercut;
			attackSpeed = 0.4;
			
			damageCreateXoffset	= -18;
			damageCreateYoffset	= -80;
			damageCreateWidth	= 65;
			damageCreateHeight	= 64;
			damageKnockbackMulti = 2;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -7;
			
			adjustDirectionFacingPreDamage = false;
			forceHalfGravity = true;
			allowControlOverIndex = 1;
			
			//Stay In Air Longer
			vSpeed = min(0, vSpeed) + jumpSpeed * combatInAirJumpCoefficient;
			if (vSpeed > 0) {
				vSpeed /= 2;}
			
			break;
			
		case state.combat_air_down:
			
			attackSprite = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			attackSpeed = 0.65;
			
			var w = 30;
			
			damageCreateXoffset	= -w/2;
			damageCreateYoffset	= -16;
			damageCreateWidth	= w;
			damageCreateHeight	= 32;
			damageKnockbackMulti = 4;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = +1;
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = 1;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			
			break;
			
		case state.combat_air_horizontal:
			
			attackSprite = (useFront) ? sKeiraPunch0Front : sKeiraPunch0Back;
			attackSpeed = 0.4;
			
			var w = 30;
			
			damageCreateXoffset	= -5;
			damageCreateYoffset	= -40;
			damageCreateWidth	= 74;
			damageCreateHeight	= 30;
			damageKnockbackMulti = 8;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = 0;
			
			adjustDirectionFacingPreDamage = true;
			allowControlOverIndex = -1;
		
			//Stay In Air Longer
			forceHalfGravity = true;
			vSpeed += 1.5;
			
				
			break;

	
	}

	//Pre Fill Based On Sprite
		//Control Sprite
		allowControlOverIndex = (allowControlOverIndex == -1)
									? sprite_get_number(attackSprite)
									: allowControlOverIndex;



	//}
}