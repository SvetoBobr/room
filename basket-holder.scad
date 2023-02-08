
a=5.5;
w=2.5;
s=1.8;
L=9/2-1.5-0.5;

y=8;
difference(){
    union(){
      translate([-5,0,0])  hull(){
            translate([-a-w,-w,0])cube([w,33+2*w,1]);
            translate([0-2*w,0-w,31])cube([2*w,33+2*w,1]);
          
            translate([-8,33/2,33-y]) rotate([0,90,0]) cylinder(h=5,r=1.9, center=true, $fn=40);
           translate([-5-a,33/2,5]) rotate([0,90,0]) cylinder(h=5,r=6.5, center=true, $fn=40);
        }
        
        translate([w,0,0]) hull(){
            translate([-a-w,-w,0])cube([1,33+2*w,1]);
            translate([0-w,0-w,31])cube([1,33+2*w,1]);
        
            translate([0,-w,0])cube([L,33+2*w,32]);
        }       
        
        
        hull(){
            translate([-a-s,0.5,0])cube([1,32,1]);
            translate([0-s,0.5,31])cube([1,32,1]);
            
            translate([0,0.5,0])cube([L,32,32]);
        }
    }
    
    translate([0,33/2,33-y]) rotate([0,90,0]) cylinder(h=100,r=1.75, center=true, $fn=40);
    translate([0,33/2,5]) rotate([0,90,0]) cylinder(h=100,r=1.75, center=true, $fn=40);
    
    //translate([-a-w*3,33/2,33-y]) rotate([0,90,0]) cylinder(h=5,r1=5.5, r2=1.75, center=true, $fn=40);
}