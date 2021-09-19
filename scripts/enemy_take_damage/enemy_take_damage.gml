//
//DESC:
//
//Generic Function For Enemies Taking Damage.
//
function enemy_take_damage() {

	//Check If a Hitbox has been hit
	if (hitboxTakingDamage != noone) {
	
		//LOL!
		var damageingObject = hitboxTakingDamage.damagingObjectId;
		var damageCreator = damageingObject.creator;
	
		//Send Info Back To Damage Object
		damageingObject.enemyHitCount++;
		ds_list_add(damageingObject.enemiesHit, id);
		damageingObject.hasHitEnemy = true;
		damageingObject.hasHitEnemyAllowUpdate = true;
	
		//Take Damage
			hp -= 0;
		
		
		//Knockback
			var knockbackStrength = damageingObject.knockbackAmount;
		
			//Vector
			var dd = point_direction(damageingObject.knockbackFromX, damageingObject.knockbackFromY, x, y);
			var str = (knockbackStrength) / weight;

			//Add
			knockbackHSpeed += lengthdir_x(str, dd) + damageingObject.addToHSpeed;
			knockbackVSpeed += lengthdir_y(str, dd) + damageingObject.addToVSpeed;
			
			
		//Reset
		hitboxTakingDamage = noone;
		invulnerableTicks = 5;
	}

}