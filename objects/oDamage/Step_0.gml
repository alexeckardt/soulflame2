/// @desc

//Follow
if (followCreator) {
	x = creator.x + xoffset;
	y = creator.y + yoffset;
}

//Die After Time
life -= Game.delta*allowLifeDecay;
if (life < 0) {
	instance_destroy();
}	