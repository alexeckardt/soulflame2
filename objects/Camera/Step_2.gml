/// @description 

//Dim
var halfCamW = game_width div 2;
var halfCamH = game_height div 2;

//Goal
var goalX = x;
var goalY = y;
if (instance_exists(target)) {	
	if (target != noone) {
		
		goalX = lerp(goalX, target.x+targetXoffset, trackingSpeed);
		goalY = lerp(goalY, target.y+targetYoffset, trackingSpeed);
		
	} else {

		var bS = 0.1;
		var lerpP = bS + (1-bS)*(!panCameraToLock)
		goalX = lerp(goalX, lockX, lerpP);
		goalY = lerp(goalY, lockY, lerpP);
			
	}
}

//Update Pos
goalX = clamp(goalX, roomEdgeBuffer+halfCamW, room_width-roomEdgeBuffer-halfCamW);
goalY = clamp(goalY, roomEdgeBuffer+halfCamH, room_height-roomEdgeBuffer-halfCamH);

//Set
x = goalX;
y = goalY;


//Update Movement
camera_set_view_pos(cam, floor(x-halfCamW), floor(y-halfCamH));
if (!surface_exists(view_surf)) {
    view_surf = surface_create(game_width, game_height);
}
view_surface_id[0] = view_surf;
