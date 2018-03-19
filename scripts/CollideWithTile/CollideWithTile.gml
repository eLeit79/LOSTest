/// @func CollideWithTile(tmIndex, cx, cy)
/// @param cx Collision X
/// @param cy Collision Y
var tmIndex = argument0;
var cx = argument1;
var cy = argument2;

return tilemap_get_at_pixel(tmIndex, cx, cy) & tile_index_mask > 0;
