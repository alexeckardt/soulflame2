//
//DESC:
//
//
//
function keira_switch_visual_sprites(_weapon){

	switch (_weapon) {
		default:
		case weapon.none:
		case weapon.fire_meele:
			
			idleSprite = sKeiraIdle;
			readySprite = sKeiraIdleReady;
			runSprite = sKeiraRun;
			
			break;
			
		case weapon.sword:
		
			idleSprite = sKeiraIdleSword;
			readySprite = sKeiraIdleSword;
			runSprite = sKeiraRun;

			break;
		
	}

}