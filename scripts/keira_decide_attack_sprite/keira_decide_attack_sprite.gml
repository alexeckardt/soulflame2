//
//DESC:
//
//
//
function keira_decide_attack_sprite(_nextState){

	switch (Player.weaponUsing) {
	
		case weapon.none:
		default:
			keira_decide_attack_vars_no_weapon(_nextState);break;
			
		case weapon.fists:
			keira_decide_attack_vars_no_weapon(_nextState);break;

	}
	
	//Pre Fill Based On Sprite
		//Control Sprite
		allowControlOverIndex = (allowControlOverIndex == -1)
									? sprite_get_number(attackSprite)
									: allowControlOverIndex;
}

