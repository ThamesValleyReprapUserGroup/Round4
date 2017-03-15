include <boxes.scad>;
translate([0,-24,2])
difference(){
  union(){
    difference(){
      roundedBox([10,47,4],4,true); //main body
      translate([0,-5,3])
        roundedBox([4.8,28,5],2.4,true);  //slot for servo arm
      translate([0,-17.5,-5])
      cylinder(r=3.75,h=10, $fn=30); //  Hole for servo spindle
     }

    translate([0,21.5,0])
    roundedBox([20,5,4],1.75,true); // Microswtich mount body
  }
  translate([0,21.5,-1])
  roundedBox([16,2.8,10],1.4,true);  // slot for mounting screws
}
