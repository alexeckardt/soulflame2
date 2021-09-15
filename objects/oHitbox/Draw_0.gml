/// @desc

//Positions
var x1 = x - hitboxWidth / 2
var y1 = y - hitboxHeight / 2;
var x2 = x1 + hitboxWidth;
var y2 = y1 + hitboxHeight;

//Visualize
if (isEllipse){
	draw_ellipse(x1, y1, x2, y2, true);
}
else {
	draw_rectangle(x1, y1, x2, y2,true);
}