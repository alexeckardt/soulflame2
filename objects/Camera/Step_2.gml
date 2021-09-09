///@desc Update Camera View Position

//Update Camera View Position
camera_set_view_pos(view_camera[0], floor(x), floor(y));


application_surface_enable(!smooth);	
// in smooth camera mode, the view is made 1px wider and taller so that we can
// comfortably move it up/left by 0..1px without any seams coming up:
var pad = smooth ? 1 : 0;
camera_set_view_size(view_camera[0], game_width + pad, game_height + pad);


//Create View Surface
if (!surface_exists(view_surf)) {
		view_surf = surface_create(game_width + 1, game_height + 1);
}
view_surface_id[0] = view_surf;