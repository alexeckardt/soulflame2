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
	
		//Take Damage
			hp -= 0;
		
		
		//Knockback
			var knockbackPosX = damageingObject.knockbackFromX;
			var knockbackPosY = damageingObject.knockbackFromY;
			var knockbackAmount = damageingObject.knockbackMulti * 3 / weight;
		
			var angleFromKnockbackToHitBox = point_direction(knockbackPosX, knockbackPosY, hitboxTakingDamage.x, hitboxTakingDamage.y);
		
			hSpeed += lengthdir_x(knockbackAmount, angleFromKnockbackToHitBox);
			vSpeed += lengthdir_y(knockbackAmount, angleFromKnockbackToHitBox);
			
			
		//Reset
		hitboxTakingDamage = noone;
		invulnerableTicks = 5;
	}

}