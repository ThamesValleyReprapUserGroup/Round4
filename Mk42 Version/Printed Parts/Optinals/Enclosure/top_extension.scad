

translate([0,0,-119])
difference(){
import("top_guide4.stl", convexity=3);
translate([40,0,40.5])cube([80,80,81], center=true);
}

translate([72,44.5,132])
difference(){
rotate([180,0,0])import("top_guide3.stl", convexity=3);
translate([-40,-40,-40.5])cube([80,80,81], center=true);
}