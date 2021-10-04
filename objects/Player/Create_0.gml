/// @desc Player

//Weapon
weaponUsing = weapon.none;

	//Base Damages
	basePunchDamage = 1;
	baseFireMeeleDamage = 1.15;
	baseSwordDamage = 1.8;
	baseBowDamage	= 0.5
		baseArrowDamage = 1.6;
	baseAnchorDamage = 3;
	baseScytheDamage = 1.4;

//Essence Tokens
essenceTokensCanHold = 3;
essenceTokens = ds_list_create();
essenceTokensHolding = 0; //Count of Above

essenceForToken = 25;

//Corruptionsssss
corruptionPercent = 0;


//Health
baseMaxHealth = 5;
currentMaxHealth = 5;
hp = 5;

maxHpAtCorrupt = 3;
dead = false;

healthDisplayY = 8;
heartWidthOffset = 20;

heartBoxCol = c_black;
heartBoxAlpha = 0.5;

//UI Positions
tokenEdgeBuffer = 18;
tokenColumnSep = 11;
tokenRowHeight = 13;
tokenListBufferY = tokenRowHeight;
heartBorderBuffer = 12;