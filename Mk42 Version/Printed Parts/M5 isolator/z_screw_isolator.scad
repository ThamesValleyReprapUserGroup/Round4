nut_ht = 4.7;
nut_wd = 9.9;
dia = 9;
thick = 2;

module one( ){
difference() {
	//outline
	union() {
		cylinder(r=nut_wd/2+2*thick, h=nut_ht+thick, $fn=6);
		
		translate([0,-(dia+3*thick)/2,0])
		cube([37,dia+3*thick, nut_ht+thick]);
        translate([-13,-(dia+3*thick)/2,0])
        cube([10,dia+3*thick,nut_ht+thick]);
        translate([-6.5,-(dia+3*thick)/2,0])
        cube([10,dia+3*thick,nut_ht+thick]);
	}
	
	// nut trap
	translate([0,0,thick])
	cylinder(d=nut_wd, h=nut_ht, $fn=6);

	// screw hole
	cylinder(d=7, h=thick, $fn=360);

	// screw entrance
	translate([-15,-5/2,0])
	cube([15, 5, nut_ht+thick]);

	// smooth bar channel end
	translate([15,0,0])
	cylinder(r=dia/2, h=nut_ht+thick, $fn=360);

	// smooth bar channel
	translate([15,-dia/2,0])
	cube([30, dia, nut_ht+thick]);
    
    //hole for M3 bolt
    translate([-8,15,(nut_ht+thick)/2]) rotate ([90,0,0])
    cylinder(d=3, h=30, $fn=360);
    translate([-8,12.45,(nut_ht+thick)/2]) rotate ([90,0,0])
    cylinder(d=5.4, h=nut_ht+thick, $fn=6);
}
}
one();
translate ([0,20,0]) rotate([0,0,180])scale ([-1,1,1]) one(); 