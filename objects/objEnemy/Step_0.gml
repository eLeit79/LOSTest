if (checkLOSCount == 0) {
	checkLOSCount = LOSCountInterval;
	//if (HaveLineOfSight(x, y, objPlayer.x, objPlayer.y, 24, 0, tmCollision)) {
		haveLOS = true;
		haveTarget = true;
		var newTargetX = objPlayer.x;
		var newTargetY = objPlayer.y;
		if (newTargetX != xTargetLast || newTargetY != yTargetLast) {
			xTargetLast = newTargetX;
			yTargetLast = newTargetY;
			targetUpdated = true;
		}
//	} else {
//		haveLOS = false;
//	}
}
checkLOSCount--;

if (haveTarget && targetUpdated && updatePathCount == 0) {
	targetUpdated = false;
	//show_debug_message("Target updated: " + string(xTargetLast) + ", " + string(yTargetLast));
	path = path_add()
	if (mp_grid_path(mpGrid, path, x, y, xTargetLast, yTargetLast, true)) {
		OptimizePath(path, tmCollision);
		path_start(path, 1, path_action_stop, true);
	}
}
if (updatePathCount == 0) {
	updatePathCount = MPCountInterval;
}
updatePathCount--;
