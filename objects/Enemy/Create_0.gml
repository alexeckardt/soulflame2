/// @desc

//Attributes
//
//
	//Enemy Types
	lesser = false;

	//Health
	hp = 10;

	//Movement
	hSpeed = 0;
	vSpeed = 0;
	weight = 1;
	
	//Damage
	effectiveDamageTypes = [];
	resistedDamageTypes = [];
	
	
	
//Other Variables
//
//
	hitReactionTimeLeft = -1;
	STATE = state.base;

	//Alignment
	random_set_seed(Game.gameSeed);
	alignment = choose(-1, 1);
	healthyPercent = 0;

	//Sprites
	updatedSprites = false; //Updates any sprites on alginment switch or creation