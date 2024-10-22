// The inner diameter of the 3d printed roland mount is 12mm
// the existing stl also uses an exactly 12mm hole
//*
translate([0-100, 0, 100]) 
import("Mount_Roland_10_noshell.stl");
//*/

inner = 9+1; // the alesis rods are actually 10mm, not 9mm
outer = 12+1.5;
h = 33;
fn = 50;
notch_w = 2;
notch_h = 20;

translate([5, 11.5, 0])
translate([0, 0, -39.5])
difference () {
	cylinder(h, outer/2, outer/2, $fn=fn);
	union() {
		cylinder(h, inner/2, inner/2, $fn=fn);
		translate([-notch_w/2, -notch_h, 0])
			cube([notch_w, notch_h, h]);
	}

}