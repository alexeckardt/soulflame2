//
//DESC:
//
//Creates a Signle Hitbox.
//
//
function hitbox_create(_x, _y, _width, _height, _isEllipse) {

	//Create the Hitbox
	var newHitbox = instance_create_depth(_x,_y, depth - 5, oHitbox);
	
	//Update Object
	newHitbox.creator = id;
	
	newHitbox.xoffset = _x - x;
	newHitbox.yoffset = _y - y;
	newHitbox.hitboxWidth = _width;
	newHitbox.hitboxHeight = _height;
	newHitbox.isEllipse = _isEllipse;
	
	//Return id of the hitbox
	return newHitbox

}