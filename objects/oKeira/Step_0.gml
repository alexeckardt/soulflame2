/// @desc

//Use Delta Time
var time = Controller.delta;

//Collide and Move
if (place_meeting(x + hSpeed, y, pSolid)) {
	while(!place_meeting(x+sign(hSpeed), y, pSolid)) {
		x += sign(hSpeed);
	}
	hSpeed = 0;
}
x += hSpeed * delta;

//Vertical Collide
timeSinceOnGround++;
if (place_meeting(x, y+vSpeed, pSolid)) {
	//Back Onto Wall
	while(!place_meeting(x, y+min(abs(vSpeed), abs(sign(vSpeed)))*sign(vSpeed), pSolid)) {
		y += sign(vSpeed);
	}
	
	//Am On Ground
	if (sign(vSpeed) == 1) {
		timeSinceOnGround = -1;	
	}
	
	//Reset Speed
	vSpeed = 0;
}
//Move
y += vSpeed * delta;


//
//Change Movement
var hController = Controller.right - Controller.left;
runAcc = lerp(runAcc, hController, traction);
hSpeed = runAcc*minRunSpeed + hMomentum; 

//
//Jump
if (Controller.jump) {
	jumpTicks = preLandJumpsTime;	
}

//Check Jump
if (jumpTicks > 0) {
	jumpTicks--;
	
	//Coyottee Time AND Wait for until on ground.
	if (timeSinceOnGround < coyoteeMaxTime) {
		
		//Jump
		vSpeed = jumpSpeed + vMomentum; 
		
	}
}


//Gravity
if (timeSinceOnGround > -1) {
	
	if (!Controller.jumpHeld && vSpeed < -myGrav*2) {
		vSpeed /= 1.3;	
	}
	
	
	//Gives Hang Time If Jump is Still Held
	var mult = (abs(vSpeed) < halfGravityThreshold && (Controller.jumpHeld)) ? 0.5 : 1;
	
	//Add Gravity
	vSpeed = min(vSpeed + myGrav*mult, terminalVelocity);

}