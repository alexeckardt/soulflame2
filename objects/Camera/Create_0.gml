/// @description 

//Disable App Surface
application_surface_enable(false);

cam = view_camera[0];

var cW = camera_get_view_width(cam);
var cH = camera_get_view_height(cam);
game_width = cW;
game_height = cH;

zoom = 3;
zoomLast = 1;
window_set_size(cW*zoom, cH*zoom);
centerApplication = true;

//camera_set_view_size(cam, cW+1, game_height+1);
display_set_gui_size(cW, cH);
view_surf = -1;

//desired_game_width = 640;
//desired_game_height = 360;
//Targetting
target = oKeira.id;
targetXoffset = 0;
targetYoffset = -32;
trackingSpeed = 0.3;
roomEdgeBuffer = 16;

lockX = 0;
lockY = 0;

