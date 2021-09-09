// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function mouse_get_x_gui() {
	var _gui_w = display_get_gui_width();
	var ww = (!window_get_fullscreen()) ? window_get_width() : display_get_width();
	return window_mouse_get_x() / (ww div _gui_w);
}
