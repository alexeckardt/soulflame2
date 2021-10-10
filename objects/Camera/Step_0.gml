/// @description Updates

if (centerApplication) {
	centerApplication = false;
	window_center();
}

//Zoom Upd
if (zoom != zoomLast) {
	window_set_size(game_width*zoom, game_height*zoom);
	centerApplication = true;
	
	zoomLast = zoom;
	
	//Surface
	if (!surface_exists(view_surf)) {
		view_surf = surface_create(game_width, game_height);
	}
}


//Fullscreen
if (keyboard_check_pressed(vk_f11)) {
	var f = !window_get_fullscreen();
	window_set_fullscreen(f)	;
}