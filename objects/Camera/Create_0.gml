
//Camera Based Off of https://github.com/YAL-GameMaker/pixel-perfect-smooth-camera/blob/master/

var vc = view_camera[0];

//Get Camera Dimensions
var vw = camera_get_view_width(vc);
var vh = camera_get_view_height(vc);

game_width = vw;
game_height = vh;

//Resize The Application Surface
surface_resize(application_surface, game_width, game_height);
display_set_gui_size(game_width, game_height);

view_surf = -1;
smooth = true;

//Camera Following
target = noone;//instance_nearest(x, y, oKeira);
targetXoffset = 0;
targetYoffset = -32;

//Locked Camera
lockX = x;
lockY = y;
panCameraToLock = false;

trackingSpeed = 0.4;