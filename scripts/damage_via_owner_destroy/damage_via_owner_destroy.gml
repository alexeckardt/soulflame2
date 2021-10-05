//
//DESC:
//
//
//
function damage_via_owner_destroy(_objIdToCheck){
	
	var instanceHasBeenDestroyed = false;
	
	with (oDamage) {
		if (creator == _objIdToCheck) {
			instanceHasBeenDestroyed = true;
			instance_destroy();	
		}
	}
	
	return instanceHasBeenDestroyed;
}