/// @func OptimizePath(path, tmCollision)
/// @param path Path index
/// @param tmCollision Collision tilemap index
var path = argument0;
var tmCollision = argument1;

var done = false;
while (!done && path_get_number(path) > 2) {
	var pIndex = 2;
	while (pIndex < path_get_number(path)) {
		var px = path_get_point_x(path, pIndex);
		var py = path_get_point_y(path, pIndex);
		var ppx = path_get_point_x(path, pIndex - 2);
		var ppy = path_get_point_y(path, pIndex - 2);
		var pointHaveLOS = true;
		if (!HaveLineOfSight(px - 16, py - 16, ppx - 16, ppy - 16, 16, 0, tmCollision)) pointHaveLOS = false; 
		if (!HaveLineOfSight(px + 16, py - 16, ppx + 16, ppy - 16, 16, 0, tmCollision)) pointHaveLOS = false; 
		if (!HaveLineOfSight(px - 16, py + 16, ppx - 16, ppy + 16, 16, 0, tmCollision)) pointHaveLOS = false; 
		if (!HaveLineOfSight(px + 16, py + 16, ppx + 16, ppy + 16, 16, 0, tmCollision)) pointHaveLOS = false; 
		if (pointHaveLOS) {
			path_delete_point(path, pIndex - 1);
			break;
		}
		pIndex++;
		if (pIndex == path_get_number(path)) {
			done = true;
			break;
		}
	}
}
