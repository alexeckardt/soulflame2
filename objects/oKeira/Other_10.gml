/// @desc Decide Visuals

var time = Controller.delta;
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
	
	
	break;
	
	//
	//Base
	case state.light_neutral:
	
		//Choose Sprs
		var spr, overlaySpr;
		if (useFront) {
			spr = sKeiraPunch0Front;
		} else {
			spr = sKeiraPunch0Back;	
		}
		
		
		
		sprite_switch_to(spr);
		image_speed = 0.4;
		displayReadyPosForTime = room_speed;
		
		
		resetStateOnAnimationFinish = true;
	
	break;
	
	
}	

//Reset Check F
if (resetStateOnAnimationFinish) {
	if (image_index + image_speed >= image_number - image_speed) {
		STATE = state.base;
	}	
}