ff = 0.05;					// CSG fudge factor
$fs = 1.0;					// CSG segment size (mm)
$fa = 5;						// CSG minimum angle (degrees)
$fn=360;

ew = 0.5;					// extrusion width based on nozzle
ww = 2*ew;					// wall width min thickness (integer multiple of ew)


// ***** configurable parameters *****
base_depth = 3;				// thickness of base

// fan dimensions
fan_diameter = 77.5;			// don't obstruct the blades!
fan_housing = 80;			// TIL: 80mm fans aren't always 80mm wide...
hole_spacing = 71.5;	
hole_dia = 4.5;//metric_clearance_diameter(M4);


/*
M1 		M2 	M3 		M4 	M5 	M6 	M7 	M8 	M10
2,5 	4 	5,5 	7 	8 	10 	11 	13 	17
*/
screw_m=7;

off_tunnel=4;
 
    
// duct dimensions
duct_width = 130;			// try to keep same cross-sectional area (~47sqcm) for optimum airflow
duct_height = 36;

duct_dx = -10;					// x offset - all offsets calculated from front-bottom <chortle!> corner...
duct_dy = -12;				// y offset
duct_dz = 25;				// z offset (depth of fan duct)


// ***** static/calculated parameters *****
hole_depth = base_depth + ff;


if (1)
	print();
else
	preview();

CSA_fan_disc = 3.141592653589 * pow(fan_diameter/2, 2);
CSA_duct_aperture = duct_width * duct_height;
CSA_diff = ((CSA_duct_aperture/CSA_fan_disc) - 1) * 100;
echo(str("Fan duct aperture is ", abs(CSA_diff) ,"% ", sign(CSA_diff)<0 ? "smaller" : "larger", " than the fan blade disc" ));


module print()
{
	cowl();
}

module preview()
{
	rotate([90, 0, 0])
		cowl();
}

module cowl()
{
	union()
	{
		difference()
		{
			union()
			{
				base();
				outer();
                screw_bases();
			}
			inner();
			screw_holes();
		}

	}
}

module base()
{
	translate([-fan_housing/2, -fan_housing/2, 0])
		roundedRect2([fan_housing, fan_housing, base_depth],10);
}

module outer()
{
	hull()
	{
		//intersection()
		//{
		//	base();
			translate([0, 0, base_depth+off_tunnel-0.1]) cylinder(h = base_depth, d = 92);
		//}
		translate([-fan_housing/2 + duct_dx, -fan_housing/2 + duct_dy, duct_dz])
			roundedRect2([duct_width + ww*2, duct_height + ww*2, ff],10 + ww*2);
	}
	translate([0, 0, 0]) cylinder(h = base_depth+off_tunnel, d = 92);
}

module inner()
{
	hull()
	{
		translate([0, 0,  base_depth+off_tunnel-0.1])
			cylinder(h = ff, r = fan_diameter / 2, center = true);
		translate([-fan_housing/2 + duct_dx + ww, -fan_housing/2 + duct_dy + ww, duct_dz + ff])
		roundedRect2([duct_width, duct_height, ff],10);
	}
	translate([0, 0, -ff]) cylinder(h = base_depth+off_tunnel+0.2, r = fan_diameter / 2);
}

module screw_bases()
{
	translate([hole_spacing/2, hole_spacing/2, -ff/2])		screw_base();
	translate([-hole_spacing/2, hole_spacing/2, -ff/2])		screw_base();
	translate([hole_spacing/2, -hole_spacing/2, -ff/2])		screw_base();
	translate([-hole_spacing/2, -hole_spacing/2, -ff/2])    screw_base();
}

module screw_base()
{
	cylinder(h = base_depth+2, r = screw_m);
}

module screw_holes()
{
	translate([hole_spacing/2, hole_spacing/2, -ff])		screw_hole();
	translate([-hole_spacing/2, hole_spacing/2, -ff])		screw_hole();
	translate([hole_spacing/2, -hole_spacing/2, -ff])		screw_hole();
	translate([-hole_spacing/2, -hole_spacing/2, -ff])    screw_hole();
}

module screw_hole()
{

	cylinder(h = hole_depth, r = hole_dia/2);
    translate([0, 0,  base_depth-1]) cylinder(r=screw_m/2 / cos(180 / 6) + 0.05, h=off_tunnel+1,$fn=6);
}



module roundedRect(size, radius) {

x = size[0];
y = size[1];
z = size[2];

linear_extrude(height=z)
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
}
}


module roundedRect2(size, radius) {

x = size[0];
y = size[1];
z = size[2];

linear_extrude(height=z)
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(0)+(radius/2), (0)+(radius/2), 0])
    circle(r=radius);

    translate([(x)-(radius/2), (0)+(radius/2), 0])
    circle(r=radius);

    translate([(0)+(radius/2), (y)-(radius/2), 0])
    circle(r=radius);

    translate([(x)-(radius/2), (y)-(radius/2), 0])
    circle(r=radius);
}
}
