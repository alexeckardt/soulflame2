
//Get Values
var vc = view_camera[0];

//Offset View Surface by the decimal portion of the camera position 
if (surface_exists(view_surf)) {
	var ax = camera_get_view_x(vc) - x;
	var ay = camera_get_view_y(vc) - y;
	draw_surface(view_surf, ax, ay);
}