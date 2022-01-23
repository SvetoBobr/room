use <../libs/custom_basics.scad>
use <../libs/transform.scad>

a=55+1;
b=110+1;
c=2;
w=15;
wall=1.6;

cr=4;
difference(){
    union(){
        translate([w/2,00,0]) rounded_brick(a+w+wall*2,b+w*2+wall*2,c, corners=[0,w,w,0]);
        rounded_brick(a+wall*2,b+wall*2,25, corners=[cr+wall,cr+wall,cr+wall,cr+wall]);
    }
    
    lift(-1)rounded_brick(a,b,40, corners=[cr,cr,cr,cr]);
    
    sh=w/2-1.5;
    #for(i=[-1,1]) translate([a/2+sh,(b/2+sh)*i,-1]) cylinder(h=5, r=2);
    
    translate([-20,0,0]) cube([50,1,50], center=true);
}