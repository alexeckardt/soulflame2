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
essenceTokensCanHold = 10;
essenceTokens = ds_list_create();
essenceTokensHolding = 0; //Count of Above

chaosEssence = 0;
balanceEssence=0;
orderEssence = 0;
essenceForToken = 10;

//Corruption
corruptionPercent = 0;

//UI Positions
tokenEdgeBuffer = 12;
tokenColumnSep = 6;
tokenRowHeight = 8;
tokenListBufferY = tokenRowHeight;