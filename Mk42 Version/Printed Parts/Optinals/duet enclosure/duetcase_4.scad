difference(){
translate([20,25,0])import("Duet_enclosure.stl", convexity=3);
cube([70,79,55]);
translate([70,0,0])cube([70,79,55]);
translate([0,79,0])cube([70,79,55]);
//translate([70,79,0])cube([70,79,55]);
}