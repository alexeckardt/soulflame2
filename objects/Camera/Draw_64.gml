
//Get Values
var vc = view_camera[0];

//Offset View Surface by the decimal portion of the camera position 
if (surface_exists(view_surf)) {
	var ax = camera_get_view_x(vc) - x + game_width div 2;
	var ay = camera_get_view_y(vc) - y + game_height div 2;
	draw_surface(view_surf, ax, ay);
}