module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a, $fn=500) square([r,h]);
}

// Note: no idea why there's a .008 here. It is equal to .2mm though - maybe it's a tolerance?
//outer_rad = 10.008*25.4/2;	// 10 inch
outer_rad = 12.008*25.4/2; 		// 12 inch

// thickness appears to be 3, so im doing 2.7
tol = 0.3;
tol_tight = 0.1;

// h = 32; // from the original drum prototype

shell();

/*
difference() {
	shell();
	jack(true);
}
difference() {
	jack(true);
	jack(false);
}
//*/

module shell() {
	// from https://www.instructables.com/E-drum-With-Small-3D-Printer-and-Thick-Paper/
	h = 55;
	rotate([0, 0, 30])
	difference() {
		pieSlice(120,outer_rad-tol,h);
		pieSlice(360, outer_rad-tol-2.7,h);
	}
}

module jack(cutout) {
	jack_height = 25;  // TODO: figure out
	jack_diameter = 8; // TODO: measure
	hole_d = jack_diameter + tol_tight*2;
	cube_h = 4;
	
	translate([0, outer_rad, jack_height])
	rotate([90, 0, 0]) {
		if (cutout)
			translate([0, 0, cube_h/2]) cube([jack_diameter*3, jack_diameter*3, cube_h], center=true);
		else
			cylinder(100, hole_d, hole_d, $fn=50);
	}
}