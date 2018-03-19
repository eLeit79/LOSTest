
var xMove = 0;
var yMove = 0;

if (keyboard_check(ord("A"))) xMove--;
if (keyboard_check(ord("D"))) xMove++;
if (keyboard_check(ord("W"))) yMove--;
if (keyboard_check(ord("S"))) yMove++;
if (keyboard_check(vk_escape)) game_end();

var actualSpeed = moveSpeed;
if (xMove != 0 && yMove != 0) {
	actualSpeed = moveSpeed * 0.75;
}

xSpd = xMove * actualSpeed;
ySpd = yMove * actualSpeed;

x += xSpd;
y += ySpd;

var tmFloors = layer_tilemap_get_id("FloorLayer");
var tmWidth = tilemap_get_width(tmFloors);
var tmHeight = tilemap_get_height(tmFloors);

//var px = x & ~31;
//var py = y & ~31;

//if (updateLightCount == 0) {
//	updateLightCount = updateLightInterval;
//	for (var fy = 0; fy < tmHeight; fy++) {
//		for (var fx = 0; fx < tmWidth; fx++) {
//			var tx = (fx << 5) + 16;
//			var ty = (fy << 5) + 16;
//			var tileData = tilemap_get(tmFloors, fx, fy);
//			//if (point_distance(tx, ty, x, y) < 256) {
//				var haveSight = false;
//				if (HaveLineOfSight(tx, ty, x, y, 31, tmCollision)) {
//					haveSight = true;
//				}
//				tileData = tile_set_index(tileData, haveSight ? 1 : 2);
//			//} else {
//			//	tileData = tile_set_index(tileData, 2);
//			//}
//			tilemap_set(tmFloors, tileData, fx, fy);
//		}
//	}
//}
//updateLightCount--;

fpsCount++;
fpsSum += fps_real;
if (fpsCount == 60) {
	fpsCount = 0;
	fpsReal = fpsSum / 60;
	fpsSum = 0;
}
