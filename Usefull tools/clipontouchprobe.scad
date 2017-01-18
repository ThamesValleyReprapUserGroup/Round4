$fn=360;
union(){
difference(){
cube([20,26,12]);
translate([1.75,1.75,2])    cube([16.5,21.5,12]);
translate([10,9,-2])    cylinder(d=9, h=20);
    
    hull(){
translate([0,16.5,5.75]) rotate([0,90,0])   cylinder(d=7.5, h=20);
translate([0,16.5,20]) rotate([0,90,0])   cylinder(d=7.5, h=20);  
translate([-5,14.5,12.75]) rotate([0,90,0])   cylinder(d=7.5, h=10);  
}
}
difference(){
translate([4.25,26,0])    cube([11.5,12,12]);
translate([6.25,26,2])    cube([7.5,12,8]);
hull(){
translate([10,28,-15])    cylinder(d=4, h=20);
translate([10,40,-15])    cylinder(d=4, h=20);    
}
}
}