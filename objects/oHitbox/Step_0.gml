/// @desc Update Position

if (creator != noone) {
	
	var roundTo = .1;
	x = round((creator.x + xoffset)/roundTo) * roundTo;
	y = round((creator.y + yoffset)/roundTo) * roundTo;
	
}