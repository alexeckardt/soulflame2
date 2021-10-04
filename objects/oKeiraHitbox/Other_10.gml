/// @desc PLayer Taking Damage


var otherDamage = damagingObjectId;
var enemyWhoHitMe = otherDamage.creator;

//Send Info Back To Damage Object
if (otherDamage.life > 0) {
			
	//Not If Destroyed 
	otherDamage.enemyHitCount++;
	ds_list_add(otherDamage.enemiesHit, id);
	otherDamage.hasHitEnemy = true;
	otherDamage.hasHitEnemyAllowUpdate = true;
	
}
			
//Take Damage
Player.hp--;


//Player State
oKeira.STATE = state.hurt;
oKeira.hurtTicks = oKeira.hurtTime;
oKeira.invulnerableTicks = room_speed/2;




//Knockback Keira
var knockbackStrength = otherDamage.knockbackAmount;
		
	//Vector
	var dd = point_direction(otherDamage.knockbackFromX, otherDamage.knockbackFromY, x, y);
	var str = (knockbackStrength) / oKeira.weight;

	//Add
	oKeira.hSpeed += lengthdir_x(str, dd) + otherDamage.addToHSpeed;
	oKeira.vSpeed += lengthdir_y(str, dd) + otherDamage.addToVSpeed;
	
	