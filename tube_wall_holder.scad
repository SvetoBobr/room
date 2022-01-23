$fn=80;

D=19;

difference(){
    cylinder(h=12, r=D/2+20);
    
    cylinder(h=30, r=D/2, center=true);
    for(i=[0:3]) rotate(90*i) translate([D/2+10,0,-1]) cylinder(h=20,r=2);
    for(i=[0:3]) rotate(90*i) translate([D/2+10,0,5]) cylinder(h=20,r=6);
}