/// @desc Decide Visuals

switch (STATE) {
	default:
	
		var running = onGround && controllerHorizontalMovementInput != 0;
		
		if (running) {
			
			sprite_switch_to(sKeiraRun);
			image_speed = 0.4;
			
		} else {
			
			sprite_switch_to(sKeiraIdle);
			image_speed = 0.2;
			
		}
	
	
	break;
}	