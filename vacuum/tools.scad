// supposed to be printed with 3 0.7mm perimeters
// no infill. no top and bottom layers

flange(d=40);

module basic(){
    cylinder(h=50+10,r1=44/2+2, r2=45.5/2+2);
    hull(){
        cylinder(h=5,r2=44/2+2, r1=45.5/2+2);
        
        translate([0,0,-70]) hull(){
            for(i=[-1,1]) translate([i*20,0,0]) cylinder(h=10,r=8);
        }
    }
}


module nidle(){
    cylinder(h=50+10,r1=44/2+2, r2=45.5/2+2);
    hull(){
        cylinder(h=5,r2=44/2+2, r1=45.5/2+2);
        
        translate([0,0,-170]) hull(){
            for(i=[-1,1]) translate([i*5,0,0]) cylinder(h=50,r=5);
        }
    }

}

module flange(d=44){
    cylinder(h=50+10,r1=d/2+2, r2=(d+1.5)/2+2);
    difference(){
        cylinder(h=5,r=35);
        N=40;
        for(i=[1:N]) rotate(360/N*i) translate([30,0,0]) cylinder(h=20,r=1.5, center=true);
        for(i=[1:N]) rotate(360/N*i+5) translate([25,0,0]) cylinder(h=20,r=1.5, center=true);    
    }
    
}

module polishing_adapter(){
    cylinder(h=30+10,r1=44/2+2, r2=45.5/2+2);
    rotate([180,0,0]) cylinder(h=20+10,r1=44/2+2-1, r2=45.5/2+2-1);
}

/*
    cylinder(h=30+10,r1=44/2+2, r2=45.5/2+2);
    rotate([180,0,0]) hull(){
        cylinder(h=20+10,r=44/2+2);
        translate([0,0,8])cylinder(h=20+10,r1=44/2+2+3, r2=45.5/2+2+3);
    }
*/