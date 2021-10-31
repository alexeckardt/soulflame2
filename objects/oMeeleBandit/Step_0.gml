/// @desc

var time = Game.delta;

//Take Damage 
enemy_take_damage();

//Collision
generic_collide_solid();


//(Vertical Motion)
	if (knockbackVSpeed != 0) {
		vSpeed += knockbackVSpeed;
		knockbackVSpeed = 0;
	}
	//Gravity
	vSpeed += myGrav;

//Horizontal Motion
	//Friction
	var hFriction = (groundBelow != noone) ? groundBelow.tractionStart		: airFrictionValue;
	var kbFriction =(groundBelow != noone) ? groundBelow.tractionStart/3	: airFrictionValue;
	
	//Goal
	controlHSpeed = lerp(controlHSpeed, hspdGoal, hFriction);

	//Amount
	knockbackHSpeed = lerp(knockbackHSpeed, 0, kbFriction);
	hSpeed = round((controlHSpeed + knockbackHSpeed) * 10) / 10;

//Movement
	if (STATE == state.height) {
		
		//No Move
		hspdGoal = 0;
		
		//Can See Target?
		var yoffset = -32;
		var toSeePlayer = false;
		if (point_distance(x, y, target.x, target.y) < sightRange) {
			if (collision_line(x, y+yoffset, target.x, target.y+yoffset, target, false, true)) {
			
				//Detected
				toSeePlayer = true;
			
			}
		}
		
		
		//Detect Target After Time
		if (toSeePlayer) {
			
			//Notice Player Time
			timeLeftBeforeNoticeTarget -= time;
			
			if (timeLeftBeforeNoticeTarget < 0) {
				seesTarget = true;
				STATE = state.base;
				lastSawTargetX = target.x;
				lastSawTargetY = target.y;	
			}
			
		//Target Not Visible, Reset Time
		} else {
			timeLeftBeforeNoticeTarget = lerp(timeLeftBeforeNoticeTarget, timeToNoticeTarget, 0.5*time);	
		}
	}
	
	
	//Noticed Target, Going to Them
	if (STATE == state.base) {
		
		//Distances & Positions
		var targetDist = point_distance(x, y, target.x, target.y);
		var targetLastSawDist = point_distance(x, y, lastSawTargetX, lastSawTargetY);
		var toTargetDir = sign(lastSawTargetX - x);
		
		//Update Last Saw Pos If Target At A distance away from target pos
		if (point_distance(target.x, target.y, lastSawTargetX, lastSawTargetY) > 16) {
			var yoffset = -32;
			if (collision_line(x, y+yoffset, target.x, target.y+yoffset, target, false, true)) {
				seesTarget = true;
				lastSawTargetX = target.x;
				lastSawTargetY = target.y;
				
				targetLastSawDist = point_distance(x, y, lastSawTargetX, lastSawTargetY);
			}
		}
		
		//Stop Moving; PLayer Got Away
		if (point_distance(x, y, lastSawTargetX, y) < attackDistanceGoal div 2) {
			if (targetDist > sightRange) {
				STATE = state.height;
			}
		}
		
		//Move To Target	
		if (targetDist > attackDistanceGoal) {
		
			//HspdGoal
			hspdGoal = toTargetDir*runSpeed;
			directionFacing = sign(hspdGoal);
		
		} else {
			
			//Reached Player for Attack
			hspdGoal = 0;
			createdDamage = false;
			
			//State Setup
			STATE = state.combat_htilt;
			attackSprite = sBanditPunchHeavy;
			
		}
	
	}
	
	//Attacking
	if (STATE == state.combat_htilt) {
	
		
	
	}
	
	//Dead
	if (STATE == state.dead) {
	
		//No More Movement Control
		hSpeedGoal = 0;
		vSpeedGoal = 0;
	
		//Die
		if (onGround) {
			if (deadTicks > timeLayingOnGroundBeforePop) {	
				//Kill
				instance_destroy();
			}
			
		//Reset
		} else {
			deadTicks = 0;	
		}
	
	}
	
	
	
//Visuals Call
event_user(0);