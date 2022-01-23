difference(){
    a=22;
    b=50;
    cube([a,b,14]);
    
    translate([a/2,a/2,-1]) cylinder(h=16, r=2.5);
    translate([a/2,b-a/2,-1]) cylinder(h=16, r=2.5);
}