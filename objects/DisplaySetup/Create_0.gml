//Aspect Ratio Drawing

desired_game_height = 540; //

monitor_width = display_get_width();
monitor_height = display_get_height();

aspect_ratio = (monitor_width / monitor_height);

ideal_width = round(desired_game_height * aspect_ratio);
ideal_height = desired_game_height;

//Check for odd number
if (ideal_width mod 2 == 1) ideal_width++;


//Update EVERY Room's View Automatically
for (var i = 0; i < room_last; i++) {
	
	if (room_exists(i)) {
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
		room_set_view_enabled(i, true);
	}
}

//Update This Rooms Camera
var vc = view_camera[0];
camera_set_view_size(vc, ideal_width, ideal_height);