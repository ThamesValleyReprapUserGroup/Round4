

module one() {
difference(){
import("front_stands1.stl", convexity=3);
translate([-50,-50,0])cube([80,80,124.5]);
}
}
one();
translate([0,0,249])mirror([1,0,0])rotate([180,0,180])one();