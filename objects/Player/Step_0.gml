/// @desc

//Health
	//Decide Max Health Point
	var maxhp = baseMaxHealth;
	var corruptedHealthLoss = abs(corruptionPercent) * (baseMaxHealth - maxHpAtCorrupt);
	
	//Reduce Max Hp
	maxhp -= round(corruptedHealthLoss);
	
	//Health Clamp
	hp = clamp(hp, 0, maxhp);
	
	
	//Save
	currentMaxHealth = maxhp;
	
	//
	

