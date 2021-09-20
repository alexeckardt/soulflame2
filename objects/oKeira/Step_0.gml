/// @desc

//Use time Time
var time = Game.delta;


//Gravity
if (timeSinceOnGround > -1) {

	//Choose Values
	var grav = myGrav * ((STATE == state.climb && vSpeed > 0) ? climbingGravMulti : 1);
	var term = (STATE != state.climb) ? terminalVelocity : climbingTermVel;

	//Gives Hang Time If Jump is Still Held
	var mult = (abs(vSpeed) < halfGravityThreshold && (Controller.jumpHeld || forceHalfGravity) && allowHalfGravity) ? 0.5 : 1;
	
	//Add Gravity
	vSpeed = min(vSpeed + grav*mult*time, term);
	
	//Short Jump
	if (!Controller.jumpHeld && vSpeed < -halfGravityThreshold && !cutVspd) {
		vSpeed /= 1.6;	
		cutVspd = true;
	}
}


//
//Horizontal Movement

//Get Input
controllerHorizontalMovementInput = Controller.right - Controller.left;
var mx = controllerHorizontalMovementInput;

//Get Friction Values
var slideValBase = airFrictionValue;
var inAir = !onGround;
if (!inAir) {
	
	if (mx == 0 || mx == -sign(round(hSpeed))) {
		//Turning Around or Stopping
		slideValBase = (groundBelow != noone) ? groundBelow.tractionEnd : 0.3;
	} else {
		//Start Running
		slideValBase = (groundBelow != noone) ? groundBelow.tractionStart : 0.3;
	}
}

//Movement Multipliers
var runSpeedMulti = 1;

//Goal
var hspdGoalsMultipliers = time * power(0.99, time) * runSpeedMulti;
var hSpeedGoal = mx * minRunSpeed * hspdGoalsMultipliers * inControl;
var slidingHspdGoal = slidingInDirection * slideSpeed * hspdGoalsMultipliers;


//CHanges
if (STATE = state.combat_slide) { 
	hSpeedGoal = slidingHspdGoal; 
}

var originalHSpeedGoal = hSpeedGoal;
if (inAir) {

	//In Air Speed Changes
	var holdingOppositeInAir = (sign(mx) == -sign(hSpeedGoal) && mx != 0 && timeSinceOnGround > room_speed/2) * airFrictionValue*5;
	
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
	hSpeed = lerp(hSpeed, hSpeedGoal, slideValBase);
	allowHalfGravity = true;
	cutVspd = false;
	
	//Keep Track
	timeSinceOnGround = -1;	
	lastOnFloorAtY = y;
	
}
//Round Out
hSpeed = sign(hSpeed) * floor(abs(hSpeed) * 100) / 100;
directionFacing = (hSpeed != 0 && inControl) ? sign(hSpeed) : directionFacing;

//
//
//Collide and Move

//Update Mask
mask_index = mask;

//If Particularily Long Break, Don't Shoot Out of the map
var lagDampen = power(0.95, max(1,time));

//Horizontal
var moveX = (hSpeed)*time*lagDampen
if (place_meeting(x + moveX, y, Solid)) {
	
	//Approach Wall until meeting
	while(!place_meeting(x+sign(moveX), y, Solid)) {
		x += sign(moveX);
	}
	
	//Impact Splat
	squishX = -clamp((abs(moveX)-2)/4, 0, 0.5);
	
	//Set Wall Direction
	wallInDirection = sign(moveX);
	
	//Reset Movement Vals
	moveX = 0;
	hSpeed = 0;
}
x += moveX;

//Vertical Collide
timeSinceOnGround += time;
var moveY = (vSpeed)*time*lagDampen;
if (place_meeting(x, y+moveY, Solid)) {

	//Back Onto Wall
	while(!place_meeting(x, y+sign(moveY), Solid)) {
		y += sign(moveY);
	}
	
	//Slide Around Corner
	var stopVspeed = true;
	if (vSpeed < -1) {
		if (!place_meeting(x+slideCornerRange+hSpeed, y-2+vSpeed, Solid)) {
			hSpeed = 2;
			stopVspeed = false;
		}
		
		if (!place_meeting(x-slideCornerRange+hSpeed, y-2+vSpeed, Solid)) {
			hSpeed = -2;
			stopVspeed = false;
		}
		
		//Squish on Head Hurt
		if (stopVspeed) {
			squishX = squishOffset * 1.5;
			squishY = -squishOffset * 0.3;
		}
	}
	

	//Reset Speed
	moveY = 0;
	
	if (stopVspeed) {
		moveY = 0;
		vSpeed = 0;
		allowHalfGravity = false;
	}
}
y+=moveY;

//Update On Ground
var wasOnGround = onGround;
onGround = place_meeting(x, y+1, Solid);
groundBelow = (onGround) ? instance_place(x, y+1, Solid) : noone;

//Land Detection
if (onGround && !wasOnGround) {
	squishX = squishOffset;
	squishY = -squishOffset;
	
	//Reset
	if (STATE == state.climb) {
		STATE = state.base;	
	}
	
	//Double Jump
	
	//Attacks
	allowCombatAirUp = true;
}



//Climb
timeSinceClimbing += time;
if (wallInDirection != 0) {

	//Remeber Wall
	lastWallInDirection = wallInDirection;
	lastWallMeeting = instance_place(x + wallInDirection, y, Solid)

	var climbing = (STATE == state.climb);

	//Switch To Climb State
	if (STATE == state.base) {
		if (abs(lastOnFloorAtY - y) > 40) { //Must be at least 2.5 tiles off the ground
			STATE = state.climb;	
			climbing = true;
		}
	}

	//Reset Tracking Of Time
	if (climbing) {
		timeSinceClimbing = -1;
	}


	//Reset STATE
	if (lastWallMeeting == noone) {
		wallInDirection = 0;
		
		//Exit Climb
		if (climbing) {
			STATE = state.base;
		}
	}
}



//
//Jump
if (Controller.jump || forceJump) {
	jumpTicks = preLandJumpsTime;	
}

//Check Jump
jumpCooldownTicks -= time;
if (jumpTicks > 0) {
	jumpTicks -= time;
	
	//Coyottee Time AND Wait for until on ground.
	var onGroundJump = timeSinceOnGround < coyoteeMaxTime && jumpCooldownTicks < 0;
	var wallJump = timeSinceClimbing < wallClimbCoyoteeTime && (directionFacing == -lastWallInDirection || !canVerticalClimb);
	var verticalClimb = canVerticalClimb && directionFacing == lastWallInDirection;
	var doubleJump = false;
	var bounceOffEnemy = bouncingOffEnemy && forceJump;
	
	if (inControl || forceJump) {
		if (onGroundJump || wallJump || bounceOffEnemy) {
		
			//Jump Universal
			jumpTicks = 0;
			jumpCooldownTicks = coyoteeMaxTime + 2;
			forceJump = false;
			bouncingOffEnemy = false;
		
			//Bounce Off Enemy
			if (bounceOffEnemy) {
				onGroundJump = false;
				wallJump = false;
				verticalClimb = false;
				doubleJump = false;
				
				vSpeed = jumpSpeed * bounceJumpCoefficient + vMomentum; 
				squishX = -squishOffset;
				squishY = squishOffset;
			}
		
			//Set Speeds
			if (onGroundJump) {
				vSpeed = jumpSpeed + vMomentum; 
				squishX = -squishOffset;
				squishY = squishOffset;
			}
		
			//Jump Off Wall 
			if (wallJump) {
			
				//Decide Vector
				var spd = wallJumpSpeed;
				var jumpingAngle = 90 + lastWallInDirection*wallJumpAngle;
			
				hSpeed = lengthdir_x(spd, jumpingAngle) + hMomentum;	
				vSpeed = lengthdir_y(spd, jumpingAngle) + vMomentum; 
			
				squishX = -squishOffset*1.3;
				squishY = squishOffset*1.25;
			
				//Cannot Turn Around For A Short Amount of Time if I can't climb stragit
				airFrictionMultiplierLerp *= canVerticalClimb;
			}
		
			if (verticalClimb) {
			
				vSpeed = wallJumpSpeed + vMomentum; 
				squishX = -squishOffset;
				squishY = squishOffset;
		
			}
		}
	}
}

//Attack Input
if (Controller.combatAttackPressed) {
	
	var stickDeadzone = 0.25;
	var horizontalAttackReq = abs(Controller.horizontalStick) > stickDeadzone;
	var running = abs(hSpeed) > minRunSpeed - 1.5;
	
					//Take H Momentum into account here
	var runAttack = running && horizontalAttackReq;
	var doHTilt = horizontalAttackReq && Controller.hStickTimeInSameInput < tiltTime;
	var upAttack = (Controller.verticalStick) < -stickDeadzone && Controller.vStickTimeInSameInput < tiltTime;
	var downAttack = (Controller.verticalStick) > stickDeadzone && Controller.vStickTimeInSameInput < tiltTime;
	
	//Decide Attack
	if (onGround) {
		
		if (doHTilt) {
			nextAttack = state.combat_htilt;
			
		} else
		if (runAttack) {
			nextAttack = state.combat_running;
			
			
		} else 
		if (upAttack) {
			nextAttack = state.combat_up;	
		
		} else {
			nextAttack = state.combat_neutral;
			
		}
		
		if (downAttack && running) {
			nextAttack = state.combat_slide;
		}
		
	} else {
		
		//Air Attacks
		if (upAttack) {
			if (allowCombatAirUp) {
				nextAttack = state.combat_air_up;
				allowCombatAirUp = false;
			}
			
		} else
		if (downAttack) {
			
			if (running && place_meeting(x, y+vSpeed+16, Solid)) {
				nextAttack = state.combat_slide;
			} else {
				nextAttack = state.combat_air_down;
			}
			
		} else 
		if (doHTilt) {
			nextAttack = state.combat_air_horizontal;
			
		} else {
			nextAttack = state.combat_air_neutral;
			
		}
	
		
	}
	
	//Allow input before current attack is finished.
	wantToChangeAttackTicks = timeForPreAttacks;
}

//Switch To Next Attack
if (nextAttack != state.height) {
	
	//Allow for input of attacks before finished current attack
	wantToChangeAttackTicks -= time;
	if (wantToChangeAttackTicks > 0) {
		
		//Make Sure Attack is finished
		if (STATE == state.base) {
			
			//Set New Attack
			STATE = nextAttack;
			
			//Reset Animation (Otherwise will end if Playing same one)
			image_index = 0;
			useFront = !useFront;
			
			//Decide Attack Sprites
			keira_decide_attack_sprite(nextAttack);
			
			//Reset Vars
			nextAttack = state.height;
			createdDamage = false;
		}
	}
}





//States
event_user(0);