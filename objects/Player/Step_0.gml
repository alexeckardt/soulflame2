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
	
//Selecting Weapon
	if (Controller.selectingWeaponToggle) {
		selectingWeapon = !selectingWeapon;
		weaponHighlighted = weapon.none;}
	
	if (selectingWeapon) {
		
		//Create Surface
		if (!surface_exists(weaponWheelSurf)) {
			var w = weaponWheelSurfaceWidth;
			weaponWheelSurf = surface_create(w, w);	
		}
		
		//Input Choice
		var cH = Controller.stickHolding;
		
		//If Wanting To Set Weapon
		weaponWheelLerpDisplayingLen = lerp(weaponWheelLerpDisplayingLen, point_distance(0, 0, Controller.horizontalStick, Controller.verticalStick)*0.5, 0.4);
			
		if (cH) {
			
			//Smooth Display
			var actualDir = Controller.stickDirection;
			weaponWheelLerpDisplayingDir -= angle_difference(weaponWheelLerpDisplayingDir, actualDir) / 3;
			
			//Get Segments Count
			var weaponsCount = weapon.height;
			
			//Find Segment Size
			var segSize = 360 / weaponsCount;
			
			//Based around the CENTER of a segment, not from an edge
			var cD = (actualDir + 360) - (90 - segSize/2);
			cD %= 360;
			
			//Get What Segment Stick is aiming IN
			weaponHighlighted = cD div segSize;

		} else {
			
			//If No Direction Inputted, Revert to basic weapon
			weaponHighlighted = weapon.none;	
		}
		
		
		if (Controller.combatAttack) {
			selectingWeapon = false;	
		}
		
	} else {
		
		//Lock In Weapon Selection
		
		
		//Clear Surface
		if (weaponWheelSurf != -1) {
			if (weaponWheelScale < weaponWheelScaleDispalyThreshold) {
				surface_free(weaponWheelSurf);
				weaponWheelSurf = -1;
			}
		}	
	}
	
	//Show/Hide the Surface
	weaponWheelScale = lerp(weaponWheelScale, selectingWeapon, 0.3);
