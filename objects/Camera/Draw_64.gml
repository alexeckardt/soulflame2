
//
var display_width = game_width;
var display_height = game_height;

//Change The Window Scale
display_set_gui_size(display_width, display_height);


//Resize Window
window_set_size(display_width*scale, display_height*scale);


//Get Values
var vc = view_camera[0];

//Offset View Surface by the decimal portion of the camera position 
if (surface_exists(view_surf)) {
	var ax = camera_get_view_x(vc) - x + game_width div 2;
	var ay = camera_get_view_y(vc) - y + game_height div 2;
	
	
	draw_surface(view_surf, ax, ay);
}