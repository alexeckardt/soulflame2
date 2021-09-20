/// @description Camera Movement


//Simple Movement (REPLACE!!)
/*
var kx = (keyboard_check(vk_right) - keyboard_check(vk_left));
var ky = (keyboard_check(vk_down) - keyboard_check(vk_up));
var kd = point_distance(0, 0, kx, ky);
if (kd > 1) { kx /= kd; ky /= kd; }
friction = 0.3;
var acc = 0.5;
hspeed += kx * acc;
vspeed += ky * acc;
speed = min(speed, 2.5);

// sloow pan
if (keyboard_check(vk_shift)) { x += 0.1; y += 0.05; }
*/

var halfCamW = game_width div 2;
var halfCamH = game_height div 2;

//Fullscreen
if (keyboard_check_pressed(vk_f11)) {
	fullscreen = !fullscreen;
	
	scale = (fullscreen) ? 6 : 4;
	display_reset(0, false);
	//window_set_fullscreen(fullscreen);
}


//Goal
var goalX = x;
var goalY = y;
if (instance_exists(target)) {	
	if (target != noone) {
		
		goalX = lerp(goalX, target.x+targetXoffset, trackingSpeed);
		goalY = lerp(goalY, target.y+targetYoffset, trackingSpeed);
		
	} else {

		var bS = 0.1;
		var lerpP = bS + (1-bS)*(!panCameraToLock)
		goalX = lerp(goalX, lockX, lerpP);
		goalY = lerp(goalY, lockY, lerpP);
			
	}
}

goalX = clamp(goalX, roomEdgeBuffer+halfCamW, room_width-roomEdgeBuffer-halfCamW);
goalY = clamp(goalY, roomEdgeBuffer+halfCamH, room_height-roomEdgeBuffer-halfCamH);

x = goalX;
y = goalY;