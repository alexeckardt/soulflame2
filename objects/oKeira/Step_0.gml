/// @desc

//Use time Time
var time = Controller.delta;


//Gravity
if (timeSinceOnGround > -1) {
	
	//if (timeSinceOnGround > 6) {
	
	//}
	
	//Gives Hang Time If Jump is Still Held
	var mult = (abs(vSpeed) < halfGravityThreshold && Controller.jumpHeld && allowHalfGravity) ? 0.5 : 1;
	
	//Add Gravity
	vSpeed = vSpeed + myGrav*mult*time;
	
	//Short Jump
	if (!Controller.jumpHeld && vSpeed < -halfGravityThreshold && !cutVspd) {
		vSpeed /= 1.6;	
		cutVspd = true;
	}
}


//
//Horizontal Movement

//Get Input
var hController = Controller.right - Controller.left;
var mx = hController;

//Get Friction Values
var slideValBase = airFrictionValue;
var inAir = !onGround;
if (!inAir) {
	slideValBase = (groundBelow != noone) ? groundBelow.traction : 0.3;
}

//Movement Multpliers


//Goal
var hSpeedGoal = mx * minRunSpeed * time * power(0.99, time);
var originalHSpeedGoal = hSpeedGoal;

if (inAir) {

	//In Air Speed Changes
	var holdingOppositeInAir = (sign(mx) == -sign(hSpeedGoal) && mx != 0 && inAirTime > room_speed/2) * airFrictionValue*5;
	
	//Smooth Friction Amount
	airFrictionMultiplierLerp = lerp(airFrictionMultiplierLerp, doAirFriction, airFrictionValue/2);
	
	
	if (!doAirFriction) {
		//Zero Air Friction
		airFrictionMultiplierLerp = 0;
	} else {
		
		//Smoothly Change Horizontal Speed
		hSpeed = lerp(hSpeed + hMomentum, hSpeedGoal, (airFrictionValue + holdingOppositeInAir)*airFrictionMultiplierLerp);
	
	}

//On Ground
} else {
	
	//Normal Air Friction on next jump
	airFrictionMultiplierLerp = 1;
	
	//Use Ground Friction
	hSpeed = lerp(hSpeed, hSpeedGoal*inControl, slideValBase);
	allowHalfGravity = true;
	cutVspd = false;
	
}
//Round Out
hSpeed = sign(hSpeed) * floor(abs(hSpeed) * 100) / 100;
directionFacing = (hSpeed != 0) ? sign(hSpeed) : directionFacing;


//Collide and Move
var moveX = (hSpeed)*time
if (place_meeting(x + moveX, y, pSolid)) {
	while(!place_meeting(x+sign(moveX), y, pSolid)) {
		x += sign(moveX);
	}
	moveX = 0;
	hSpeed = 0;
}
x += moveX;


//Vertical Collide
timeSinceOnGround += time;
var moveY = (vSpeed)*time
if (place_meeting(x, y+moveY, pSolid)) {
	//Back Onto Wall
	while(!place_meeting(x, y+sign(moveY), pSolid)) {
		y += sign(moveY);
	}
	
	//Am On Ground
	timeSinceOnGround = -1;	
	allowHalfGravity = false;
	
	//Reset Speed
	moveY = 0;
	vSpeed = 0;
}
y+=moveY;
var wasOnGround = onGround;
onGround = place_meeting(x, y+1, pSolid);
groundBelow = (onGround) ? instance_place(x, y+1, pSolid) : noone;


//Land	
if (!wasOnGround && onGround) {
	squishX = 1.2;
	squishY = 0.8;	
}



//
//Jump
if (Controller.jump) {
	jumpTicks = preLandJumpsTime;	
}

//Check Jump
if (jumpTicks > 0) {
	jumpTicks -= time;
	
	//Coyottee Time AND Wait for until on ground.
	if (timeSinceOnGround < coyoteeMaxTime) {
		
		//Jump
		vSpeed = jumpSpeed + vMomentum; 
		jumpTicks = 0;
		squishX = 0.8;
		squishY = 1.2;
	}
}
