//
//DESC:
//
//
//
function keira_attacking_sprite_setup(_spr, _spd, _damage, _damageType, _damageArrayInfo) {

	attackSprite	= _spr;
	attackSpeed		= _spd;
	
	damageCreateBaseDamage = _damage;
	damageCreateDamageType = _damage;
	
	var i = 0;
	damageCreateXoffset	= _damageArrayInfo[i++];
	damageCreateYoffset	= _damageArrayInfo[i++];
	damageCreateWidth	= _damageArrayInfo[i++];
	damageCreateHeight	= _damageArrayInfo[i++];
	damageKnockbackMulti = _damageArrayInfo[i++];
	damageKnockbackAddHSpeed = _damageArrayInfo[i++];
	damageKnockbackAddVSpeed = _damageArrayInfo[i++];
	damageKnockbackAddHspeedRelative = _damageArrayInfo[i++];

}

function keira_damage_info_array_create(xoff, yoff, width, height, knockbackMuti, hSpeedAdd, vSpeedAdd, relativeHAdd) {
	return [xoff, yoff, width, height, knockbackMuti, hSpeedAdd, vSpeedAdd,relativeHAdd];	
}