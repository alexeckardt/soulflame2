// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function mouse_get_y_gui() {
	var _gui_h = display_get_gui_height();
	var hh = (!window_get_fullscreen()) ? window_get_height() : display_get_height();
	return window_mouse_get_y() / (hh div _gui_h);
}
