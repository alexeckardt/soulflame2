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

//Goal
if (instance_exists(target)) {	
	if (target != noone) {
		
		x = lerp(x, target.x+targetXoffset, trackingSpeed);
		y = lerp(y, target.y+targetYoffset, trackingSpeed);
		
	} else {

		var bS = 0.1;
		var lerpP = bS + (1-bS)*(!panCameraToLock)
		x = lerp(x, lockX, lerpP);
		y = lerp(y, lockY, lerpP);
			
	}
}