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
		if (damageingObject.life > 0) {
			
			//Not If Destroyed 
			damageingObject.enemyHitCount++;
			ds_list_add(damageingObject.enemiesHit, id);
			damageingObject.hasHitEnemy = true;
			damageingObject.hasHitEnemyAllowUpdate = true;
		}
	
		//Grab Info
		var baseDamage = damageingObject.damage;
	
		//Take Damage
			hp -= baseDamage;
		
		//Release Essence
			var manaLost = essenceDropPerDamage * baseDamage;
			var chooseAlignment = sign(alignment + choose(0, 0, -1, 1));		
			essence_token_add_percent(chooseAlignment, manaLost)
			//essence_increment(chooseAlignment, manaLost);
		
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
		
		
		//Dead Detect
		if (!dead) {
			if (hp <= 0) {
				dead = true;
				
				//Auto Switch (Stagger)
				if (autoSwitchToDeadState) {
					STATE = state.dead;	
				}
			}
		}	
	}

}