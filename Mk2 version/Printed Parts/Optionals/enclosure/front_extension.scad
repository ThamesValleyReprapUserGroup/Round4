

module one() {
difference(){
import("top_front_1.stl", convexity=3);
#translate([0,40,82.5])cube([80,80,165], center=true);
}
}
one();
//translate([0,0,315.5])mirror([1,0,0])rotate([180,0,180])one();