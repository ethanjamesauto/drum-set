module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a, $fn=500) square([r,h]);
}

// Note: no idea why there's a .008 here. It is equal to .2mm though - maybe it's a tolerance?
outer_rad = 10.008*25.4/2;	// 10 inch
// outer_rad = 12.008*25.4/2; 		// 12 inch

// thickness appears to be 3, so im doing 2.7
tol = 0.3;
tol_tight = 0.1;
tol_loose = 0.2;

// h = 32; // from the original drum prototype
h = 55;

rotate([0, 0, -30])
shell();

/*
rotate([0, 0, -30]) {
difference() {
	shell();
	jack(true, 1.8);
}
difference() {
	jack(true, 1.8);
	jack(false, 1.8);
}
}
//*/

module shell() {
	// from https://www.instructables.com/E-drum-With-Small-3D-Printer-and-Thick-Paper/
	rotate([0, 0, 30])
	difference() {
		pieSlice(120,outer_rad-tol,h);
		pieSlice(360, outer_rad-tol-2.7,h);
	}
}

module jack(cutout, offset) {
	// the top of the drum shell (that is not covered by the sides of the mesh head
	// is about 15mm from the top
	// the visible bottom is about 3mm from the bottom
	jack_height = ((h-15) + 3)/2;  // TODO: figure out
	jack_r = 9.6/2;
	hole_r = jack_r + tol_loose;
	cube_h = 3;
	cutout_h = jack_r*4.5;
	
	translate([0, outer_rad, jack_height])
	rotate([90, 0, 0]) {
		if (cutout)
			translate([0, 0, offset]) cube([cutout_h, cutout_h, cube_h], center=true);
		else
			cylinder(100, hole_r, hole_r, $fn=50);
	}
}