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
	var hspdGoal = 0;
	controlHSpeed = lerp(controlHSpeed, hspdGoal, hFriction);

	//Amount
	knockbackHSpeed = lerp(knockbackHSpeed, 0, kbFriction);
	hSpeed = round(controlHSpeed + knockbackHSpeed * 10) / 10;