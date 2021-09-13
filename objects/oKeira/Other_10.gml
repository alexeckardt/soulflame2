/// @desc State Effects + Visuals

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
	
		var giveControl = (true); //Replace When Cutscenes Appear
		inControl = giveControl;
	
	
	break;
	
	//
	//Base
	case state.combat_neutral:
	
		//Choose Sprs
		var spr, overlaySpr;
		if (useFront) {
			spr = sKeiraPunch0Front;
		} else {
			spr = sKeiraPunch0Back;	
		}
		
		//Set Sprite
		sprite_switch_to(spr);
		image_speed = 0.4;
		displayReadyPosForTime = room_speed;
		
		//Update Dire
		if (image_index < 1) {
			var h = Controller.horizontalStick;
			directionFacing = (h != 0) ? sign(h) : directionFacing;	
		}
		
		//
		//Set Attributes
		inControl = false;
		resetStateOnAnimationFinish = true;
	
	break;
	
	
}	

//Animation Complete Events
if (image_index + image_speed >= image_number - image_speed) {
	
	if (resetStateOnAnimationFinish) {
		STATE = state.base;
	}
}	
