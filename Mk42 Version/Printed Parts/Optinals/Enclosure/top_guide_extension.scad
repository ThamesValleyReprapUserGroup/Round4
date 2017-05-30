
module one() {
translate([0,0,0])
difference(){
import("top_guide4.stl", convexity=3);
translate([0,-40,0])cube([80,80,125]);
}
}


one();
translate([0,0,250])mirror([1,0,0])rotate([180,0,180])one();
