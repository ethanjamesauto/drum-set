module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a, $fn=300) square([r,h]);
}

outer_rad = 10.008*25.4/2;
// thickness appears to be 3, so im doing 2.7
tol = .3;
h = 32;

difference() {
pieSlice(120,outer_rad-tol,h);
pieSlice(360, outer_rad-tol-2.7,h);
}