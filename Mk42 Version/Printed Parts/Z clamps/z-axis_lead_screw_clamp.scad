//z-axis lead screw clamp for Ian Stratford Laser Cut Plywood frame

$fn=360;

clamp_height=30.0;
wall_thick=2.5;
shaft_od=5.6;
diff_margin=0.1;
m3_screw_length=8.0;
m3_screw_dia=3.0;
m3_screw_head_dia=5.9;
m3_screw_head_height=2.3;
m3_nut_height=2.5;
m3_nut_dia=6.6;
thread_rod_dia=5.2;

/////////////////////

clamp_od=2* wall_thick+shaft_od;
shaft_height=clamp_height+2*diff_margin;
m3_screw_length_1=m3_screw_length+m3_screw_head_height;;
m3_screw_od=m3_screw_dia+2*diff_margin;
m3_screw_head_od=m3_screw_head_dia+2+1.4*diff_margin;


include <shapes.scad>;


module m3_screw(){
    
		union()
            { 		
            translate([0,0,0]) 
                rotate([0,0,0])
                cylinder(h=m3_screw_length_1,d=m3_screw_od);   
        
            translate([0,0,0]) 
               rotate([0,0,0])
              //  cylinder(h=m3_screw_head_height,d1=m3_screw_head_od, d2=m3_screw_od);   
                            #cylinder(h=m3_screw_head_height,d=m3_screw_head_od);   
                    }

}



module clamp_body(){
union()
{ 
	difference() 
	{

		union()
		{ 
			translate([0,-clamp_od/2,0]) cube([clamp_od/2,clamp_od,clamp_height]);


			translate([0,0,0]) cylinder(h=clamp_height,d=clamp_od);
			translate([clamp_od/2,0,0]) cylinder(h=clamp_height,d=clamp_od);
//			translate([150,50,0]) cylinder(h = pillar_height, r = 4.15);
//			translate([150,0,0]) cylinder(h = pillar_height, r = 4.15);

		}


		translate([0,-wall_thick/2,-diff_margin]) cube([clamp_od,wall_thick,shaft_height]);
		translate([0,0,-diff_margin]) cylinder(h=shaft_height,d=shaft_od);
        translate([0,0,-diff_margin+(clamp_height/2)]) cylinder(h=shaft_height,d=thread_rod_dia);
		translate([shaft_od/2+2,clamp_od/2,clamp_height/4]) rotate([90,0,0]) m3_screw();				
      translate([shaft_od/2+2,m3_nut_height-clamp_od/2,clamp_height/4]) rotate([90,0,0]) cylinder(h = m3_nut_height,d=m3_nut_dia,$fn=6);
		translate([shaft_od/2+2,clamp_od/2,3*clamp_height/4]) rotate([90,0,0]) m3_screw();				
      translate([shaft_od/2+2,m3_nut_height-clamp_od/2,3*clamp_height/4]) rotate([90,0,0]) cylinder(h = m3_nut_height,d=m3_nut_dia,$fn=6);
    }

translate([-5*shaft_od/6+0.5,-(shaft_od+diff_margin)/2,0]) cube([shaft_od/3,shaft_od+2*diff_margin,clamp_height/2]);

}

}
clamp_body();
//m3_screw();