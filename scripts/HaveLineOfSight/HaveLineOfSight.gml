/// @func HaveLineOfSight(xSource, ySource, xTarget, yTarget, stepSize, maxDist, tmCollision)
/// @param xSource Source X position to check from
/// @param ySource Source Y position to check from
/// @param xTarget Target X position to check against
/// @param yTarget Target Y position to check against
/// @param stepSize Number of units to step between each collision check
/// @param maxDist Maximum distance to check
/// @param tmCollision Index for collision tilemap
var xSource = argument0;
var ySource = argument1;
var xTarget = argument2;
var yTarget = argument3;
var stepSize = argument4;
var maxDist = argument5;
var tmCollision = argument6;

var dist = point_distance(xSource, ySource, xTarget, yTarget);
if (maxDist > 0) {
	if (dist > maxDist) return false;
}

var dir = point_direction(xSource, ySource, xTarget, yTarget);
var tx = lengthdir_x(stepSize, dir);
var ty = lengthdir_y(stepSize, dir);
var traveled = 0;
var cx = xSource;
var cy = ySource;

var collided = false;
while (!collided && traveled < dist && dist - traveled > stepSize) {
	traveled += stepSize;
	cx += tx;
	cy += ty;
	//draw_circle_color(cx, cy, 3, c_yellow, c_yellow, false);
	//draw_point_color(cx, cy, c_yellow);
	if (tilemap_get_at_pixel(tmCollision, cx, cy) & tile_index_mask > 0) {
		collided = true;
	}
}

return !collided;
