use <../libs/transform.scad>;
use <../libs/utils.scad>;
use <../libs/rounded_brick.scad>;

a=41;
d=20;
ar=5;
h=6;

difference(){
    rounded_brick(a+d, a*2+2*d, h, [ar,ar,ar,ar]);
    
    for (i=[-1,1]) translate([0,(a+d)*i/2,0]) 
        union(){
        
            //put_in_square(a=a) lift(-1) cylinder(h=h+2, r=3);
        for (k=[1:4]) rotate(90*k)
            hull(){
                lift(-1) cylinder(h=h+2, r=15);
                translate([a/2,a/2,-1]) cylinder(h=h+2, r=3);
            }
        lift(-1) cylinder(h=h+2, r=15);
            
        for (j=[-1,1]) translate([0,(a+2)/2*j,-1]) cylinder(h=h+2, r=3);;
            
        translate([25,0,0])cube([20,20,8], center=true);
    }
    
    translate([10,0,0])cube([10,40,8], center=true);
}