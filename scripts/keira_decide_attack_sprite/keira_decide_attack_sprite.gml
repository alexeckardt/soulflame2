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
			attackSpeed = 0.5;
			
			break;
		
		case state.combat_htilt:
		
			attackSprite = (useFront) ? sKeiraPunchHeavyFront : sKeiraPunchHeavyFront;
			attackSpeed = 0.4;
		
			break;
		
		case state.combat_up:
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