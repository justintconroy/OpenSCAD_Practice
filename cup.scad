
difference() {
	color("darkgreen") cylinder(h=2,d1=1,d2=1.5,$fn=50);
	translate([0,0,.1])
		cylinder(h=2,d1=.9,d2=1.4,$fn=50);
}

translate([0,0,1])
	sphere(d=.5, $fn=50, center=true);