/// @desc Player

//Weapon
weaponUsing = -1;

	//Base Damages
	basePunchDamage = 1;
	baseSwordDamage = 1.8;
	baseBowDamage	= 0.5
		baseArrowDamage = 1.6;
	baseAnchorDamage = 3;
	baseScytheDamage = 1.4;


//Essence Tokens
essenceTokensCanHold = 3;
essenceTokens = ds_list_create();
essenceTokensHolding = 0; //Count of Above

chaosEssence = 0;
balanceEssence=0;
orderEssence = 0;
essenceForToken = 25;

//Corruptionsssss
corruptionPercent = 0;


//Health
baseMaxHealth = 5;
hp = 5;


//UI Positions
tokenEdgeBuffer = 12;
tokenColumnSep = 6;
tokenRowHeight = 8;
tokenListBufferY = tokenRowHeight;
heartBorderBuffer = 12;