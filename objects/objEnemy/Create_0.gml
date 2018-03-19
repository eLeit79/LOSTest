xSpd = 0;
ySpd = 0;

path = 0;

tmCollision = layer_tilemap_get_id("CollisionLayer");
tmWidth = tilemap_get_width(tmCollision);
tmHeight = tilemap_get_height(tmCollision);

mpGrid = mp_grid_create(0, 0, tmWidth, tmHeight, 32, 32);
for (var gy = 0; gy < tmHeight; gy++) {
	for (var gx = 0; gx < tmWidth; gx++) {
		if (tilemap_get(tmCollision, gx, gy) & tile_index_mask > 0) {
			mp_grid_add_cell(mpGrid, gx, gy);
		}
	}
}

haveTarget = false;
targetUpdated = false;
xTargetLast = 0;
yTargetLast = 0;

updatePathCount = global.MPCount++;
if (global.MPCount > MPCountInterval) global.MPCount = 0;

checkLOSCount = global.LOSCount++;
if (global.LOSCount > LOSCountInterval) global.LOSCount = 0;
//show_debug_message(string(object_index) + ": " + string(checkLOSCount));
haveLOS = false;

