draw_self();
if (path_exists(path)) draw_path(path, 0, 0, true);

if (haveLOS) {
	draw_set_color(c_white);
	draw_set_font(fntArial);
	draw_set_halign(fa_center);
	draw_text(x, y - 32, "<(o)>");
}

if (haveTarget) {
	draw_set_color(c_orange);
	draw_circle(xTargetLast, yTargetLast, 5, false);
}
