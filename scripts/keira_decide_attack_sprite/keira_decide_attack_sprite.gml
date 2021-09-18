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
			
			damageCreateXoffset	= 12;
			damageCreateYoffset	= -32;
			damageCreateWidth	= 28;
			damageCreateHeight	= 15;
			damageKnockbackMulti = 4;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -0.5;
			
			adjustDirectionFacingPreDamage = true;
			
			break;
		
		case state.combat_htilt:
		
			attackSprite = (useFront) ? sKeiraPunchHeavyFront : sKeiraPunchHeavyFront;
			attackSpeed = 0.4;
			
			damageCreateXoffset	= 10;
			damageCreateYoffset	= -40;
			damageCreateWidth	= 64;
			damageCreateHeight	= 30;
			damageKnockbackMulti = 6;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -3;
			
			adjustDirectionFacingPreDamage = true;

			break;
		
		case state.combat_up:
		
			attackSprite = sKeiraUppercut;
			attackSpeed = 0.4;
			
			damageCreateXoffset	= 5;
			damageCreateYoffset	= -80;
			damageCreateWidth	= 40;
			damageCreateHeight	= 64;
			damageKnockbackMulti = 2;
			damageKnockbackAddHSpeed = 0;
			damageKnockbackAddVSpeed = -7;
			
			adjustDirectionFacingPreDamage = false;
		
			break;
		
		//case state.combat_down:
			
		//	attackSprite = sKeiraKickHeavy;
		//	attackSpeed = 0.35;
		
		//	break;
		
		/*
		case state.combat_air_neutral:
			break;
		
		case state.combat_air_horizontal:
			break;
		
		case state.combat_air_up:
			break;
		
		case state.combat_air_down:
			break;
		
	*/
	
	}


	//}
}