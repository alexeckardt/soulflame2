/// @desc

var cX = Camera.x;
var cY = Camera.y;

//Move All Instances on a layer by their paralax Multiplier
for (var i = 0; i < paralaxSpriteCount; i++) {
	
	var sprInfo = paralaxSprites[| i];
	
	//Unpack
	var elementId = sprInfo[0];
	var sprParalaxMultiX = sprInfo[1];
	var sprParalaxMultiY = sprInfo[2];
	var sprOrgX = sprInfo[3];
	var sprOrgY = sprInfo[4];
	
	//Calculate
	var newX = sprOrgX - (cX - sprOrgX)*sprParalaxMultiX;
	var newY = sprOrgY - (cY - sprOrgY)*sprParalaxMultiY;
	
	layer_sprite_x(elementId, newX);
	layer_sprite_y(elementId, newY);
}