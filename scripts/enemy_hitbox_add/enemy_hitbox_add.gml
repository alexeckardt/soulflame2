//
//DESC:
//
//
//
function enemy_hitbox_add(_x, _y, _width, _height, _isEllipse) {

	//Create the Hitbox
	var newHitbox = instance_create_depth(_x,_y, depth - 5, oHitbox);
	
	//Update Object
	newHitbox.creator = id;
	
	newHitbox.xoffset = _x - x;
	newHitbox.yoffset = _y - y;
	newHitbox.hitboxWidth = _width;
	newHitbox.hitboxHeight = _height;
	newHitbox.isEllipse = _isEllipse;
	
	//Add To List
	ds_list_add(hitboxes, newHitbox);
	
	//Return id if wants to be special
	return newHitbox

}