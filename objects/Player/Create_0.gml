/// @desc Player

//Weapon
weaponUsing = -1;

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