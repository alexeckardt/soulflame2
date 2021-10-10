/// @description 

display_set_gui_size(game_width, game_height);

if (surface_exists(view_surf)) {
    draw_surface_part(view_surf, 0, 0, game_width, game_height, 0, 0);
}