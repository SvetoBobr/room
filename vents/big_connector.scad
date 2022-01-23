use <../libs/transitions.scad>
use <../libs/transform.scad>

BD=125;
SD=100;

/*
intersection(){
    rotate([90,0,0]) cylinder(h=BD, r=BD/2, center=true);
    rotate([0,90,0]) cylinder(h=BD, r=BD/2, center=true);
    rotate([0,0,90]) cylinder(h=BD, r=BD/2, center=true);
}*/
/*
hull(){
    sphere(r=180/2);
    cylinder(h=150, r=BD/2, center=true);
}
*/
/*
ololo(d=SD);
rotate([90,0,0]) ololo(d=SD);
*/

difference(){
    minkowski(){
        vent(th=0);
        sphere(r=2, $fn=2);
    }
    
    vent(th=10);
}

module vent(th=0){
    for(i=[0:2]) translate([BD*i,0,0]) union(){
        ololo(d=SD, th=th);
        rotate([90,0,0]) ololo(d=SD, th=th);
    }
    
    rotate([0,-90,0]) ololo1(d=BD, , th=th);
}

module ololo(d, th){
    a=25;
    hull(){
        //sphere(r=BD/2+a);
        rotate([0,90,0]) cylinder(h=BD, r=BD/2+a/3, center=true);
        translate([0,0,40+a]) cylinder(h=1, r=d/2+8);
    }
    hull(){
        translate([0,0,40+a]) cylinder(h=1, r=d/2+8);
        translate([0,0,60+a]) cylinder(h=1, r=d/2);
    }
    translate([0,0,60+a]) cylinder(h=20+th, r=d/2);
}

module ololo1(d, th){
    a=29;
    hull(){
        sphere(r=BD/2+a);
        //rotate([0,90,0]) cylinder(h=BD, r=BD/2, center=true);
        translate([0,0,40+a]) cylinder(h=1, r=d/2+5);
    }
    hull(){
        translate([0,0,40+a]) cylinder(h=1, r=d/2+5);
        translate([0,0,60+a]) cylinder(h=1, r=d/2);
    }
    translate([0,0,60+a]) cylinder(h=20+th, r=d/2);
}