/// @desc Update Position

//Update Bbox
image_xscale = hitboxWidth / sprW; 
image_yscale = hitboxHeight / sprW; 

//Move With Creator
if (creator != noone) {
	
	var roundTo = .1;
	x = round((creator.x + xoffset)/roundTo) * roundTo;
	y = round((creator.y + yoffset)/roundTo) * roundTo;
	
}

//Damage Collision
if (instance_exists(oDamage)) {
	
	//Get List Of All Damages Meeting With Me (Don't want to damage self)
	var damageCollisionsFound = instance_place_list(x, y, oDamage, damagesMeeting, false);
	if (damageCollisionsFound > 0) {

		//Loop, See if one is NOT through my own creator
		for (var i = 0; i < damageCollisionsFound; i++) {
		
			//Check Creator
			var dmgObj = damagesMeeting[| i];
			if (dmgObj.creator != creator.id) {
					
				//Check If Allowed
				if (dmgObj.canDamageEnemies) {
				
					//Check Creator Not Already Taking Damage
					if (creator.hitboxTakingDamage == noone) {
						
						//Take Damage
						creator.hitboxTakingDamage = id;
						damagingObjectId = dmgObj;
					}
					
					//Should No Longer Check
					break;
				}
				
			}
		}

		//
		//Reset List
		ds_list_clear(damagesMeeting)

	}
}