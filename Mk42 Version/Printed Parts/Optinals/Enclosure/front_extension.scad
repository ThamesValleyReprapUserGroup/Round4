

module one() {
difference(){
import("top_front_1.stl", convexity=3);
translate([0,40,78.875])cube([80,80,157.75], center=true);
}
}
one();
translate([0,0,315.5])mirror([1,0,0])rotate([180,0,180])one();