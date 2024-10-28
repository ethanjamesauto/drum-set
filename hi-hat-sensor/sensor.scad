// diameter of the hi-hat plastic thingy that the bottom hat rests on
stand_plastic_r = 11.3/2;

// radius of the hole the moving part fits through
hole_r = 8/2;

// outer diameter of this part
outer_r = 10;

// part thickness and height
thickness = 3;
height = 15;

tol_tight = 0.1;
tol_loose = 0.2;

platform_w = 26;
platform_h = outer_r*2;

tcrt_w = 10.2    + tol_tight*2;
tcrt_h = 5.8     + tol_tight*2;
tcrt_offset = 20 - tcrt_h/2;

disc_thick = 1.5;
disc_r = 30;

clutch_r = 9.3/2;

sensor_mount();
// disc();

module sensor_mount() {
	difference() {
		translate([0, 0, -thickness]) {
			cylinder(thickness, outer_r, outer_r, $fn=80);
			translate([0, -platform_h/2, 0]) cube([platform_w, platform_h, thickness]);
		}
		
		union() {
			translate([tcrt_offset, -tcrt_w/2, -thickness]) cube([tcrt_h, tcrt_w, thickness]);
			translate([0, 0, -thickness]) cylinder(thickness, hole_r, hole_r, $fn=80);
		}
	}

	difference() {
		cylinder(height, stand_plastic_r+thickness, stand_plastic_r+thickness, $fn=80);
		cylinder(height, stand_plastic_r+tol_tight, stand_plastic_r+tol_tight, $fn=80);
	}
}

module disc() {
	r = clutch_r + tol_loose;
	difference() {
		cylinder(disc_thick, disc_r, disc_r, $fn=80);
		cylinder(disc_thick, r, r, $fn=80);
	}
}