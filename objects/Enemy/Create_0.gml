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
	myGrav = 0.35;
	STATE = state.base;

	//Moveing
	hSpeed = 0;
	vSpeed = 0;
	onGround = 0;
	timeSinceOnGround = 0;

	//Alignment
	random_set_seed(gameObj.gameSeed);
	alignment = choose(-1, 1);
	healthyPercent = 0;

	//Sprites
	updatedSprites = false; //Updates any sprites on alginment switch or creation