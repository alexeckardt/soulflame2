/// @desc

gameObj = Game.id;

//Attributes
//
//
	//Enemy Types
	lesser = false;

	//Health
	hp = 10;

	//Movement
	weight = 1;
	doCollision = true;
	
	//Damage
	hitboxes = ds_list_create();
	hitboxTakingDamage = noone;
	effectiveDamageTypes = [];
	resistedDamageTypes = [];
	
	
//Other Variables that *Should* be used by each enemy
//
//
	hitReactionTimeLeft = -1;
	invulnerableTicks = 0;
	myGrav = 0.3; //PLayer is 0.35?
	STATE = state.base;

	//Moveing
		controlHSpeed = 0; //Vector the Object itself should control for movement
		controlVSpeed = 0;
		knockbackHSpeed = 0; //Hspd Added To Knockback
		knockbackVSpeed = 0;
		hSpeed = 0; //Comboination
		vSpeed = 0;

	

	onGround = 0;
	groundBelow = noone
	timeSinceOnGround = 0;

	//Alignment
	random_set_seed(gameObj.gameSeed);
	alignment = choose(-1, 1);
	healthyPercent = 0;

	//Sprites
	updatedSprites = false; //Updates any sprites on alginment switch or creation