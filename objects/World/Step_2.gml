/// @desc
var cX = Camera.x;
var cY = Camera.y;

//Move All Instances on a layer by their paralax Multiplier
for (var i = 0; i < paralaxSpriteCount; i++) {
	
	var sprInfo = paralaxSprites[| i];
	
	//Unpack
	var elementId = sprInfo[0];
	var sprParalaxMulti = sprInfo[1];
	var sprOrgX = sprInfo[2];
	var sprOrgY = sprInfo[3];
	
	//Calculate
	var newX = sprOrgX - (cX - sprOrgX)*sprParalaxMulti;
	var newY = sprOrgY - (cY - sprOrgY)*sprParalaxMulti;
	
	layer_sprite_x(elementId, newX);
	layer_sprite_y(elementId, newY);
}