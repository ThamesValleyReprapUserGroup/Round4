/*
 * Z Isolator for a Trapezoidal screw and nut
 *
 * (C) David Price
 *
A variation on the zisolator by Michel Pollet and http://www.thingiverse.com/thing:20147.

The zisolators allow the X axis to be raised and lowered but isolate the X axis
from lateral movement (ie wobble) of the drive screw.

This version allows a trapezoidal screw and nut to be used secured with M3 screws

Note: there is a cutout underneath for a central boss
*/

$fn = 360;

E = 0.5;                        // error adjustment

leadscrew_D = 8.5+E;        // diameter of drive screw
smooth_D = 8+E;             // diameter of smooth rod

nut_D = 24;                     // diameter of leadscrew top plate
nut_boss_D = 11+E;           // diameter of boss
nut_boss_H = 1.2;             // height of boss

guide_L = 30;                  // guide bar length
guide_W= 16;                 // width of guide bar

z_thick = 7;                   // zisolator thickness

screw_D = 3.3+E;           // attachment screw size
screw_dist = 16;        // diameter of attachement screws circle
screw_rot = 45;         // rotation of screw disk

cap_D = 5.3+E;            // diameter of attachement screw cap
cap_H = 4;                  // clearance depth of cap


module znut() {
// the main zisolator nut
    difference() {

        union() {
                cylinder(r= nut_D/2, h= z_thick);   // the nut disk
                translate([0, -guide_W/2, 0])   cube([guide_L, guide_W, z_thick]);
            }
        // cutouts
        cylinder(r=nut_boss_D/2, h= nut_boss_H);   // nut boss
        cylinder(r= (leadscrew_D/2) + E, h= z_thick + nut_boss_H);  // leadscrew

        translate([2+ nut_D/2, 0,0]) cylinder(r =smooth_D/2, h=z_thick);   // guide
        translate([2+ nut_D/2, -smooth_D/2,0]) cube([guide_L, smooth_D, z_thick]);   // guide
        
         // screwholes
         screwholes();
    }
}

module screwholes() {
// screw holes to attach trapezoidal nut   
   rotate([0,0,screw_rot]) translate([0, screw_dist/2,0]) cylinder(r= screw_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([0, -screw_dist/2,0]) cylinder(r= screw_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([screw_dist/2,0,0]) cylinder(r= screw_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([-screw_dist/2,0,0]) cylinder(r= screw_D/2, h= z_thick);

// clearance holes for caps
   cap_offset = z_thick - cap_H;
   #rotate([0,0,screw_rot]) translate([0, screw_dist/2,cap_offset]) cylinder(r= cap_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([0, -screw_dist/2,cap_offset]) cylinder(r= cap_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([screw_dist/2,0,cap_offset]) cylinder(r= cap_D/2, h= z_thick);
    rotate([0,0,screw_rot]) translate([-screw_dist/2,0,cap_offset]) cylinder(r= cap_D/2, h= z_thick);

}

// RENDERING

//rotate ([180,0,0])
znut();