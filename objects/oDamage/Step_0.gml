/// @desc

//Follow
if (followCreator) {
	x = creator.x + xoffset;
	y = creator.y + yoffset;
}

//Die After Time
life -= Game.delta;
if (life < 0) {
	instance_destroy();
}	