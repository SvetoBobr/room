$fn=50;

mount_w=5;
mount_x=3+8/2;
mount_h=22;

foot_h=24;

dy=27;

//translate([0,50,0])corner();
//central();
intersection(){
    front();
    
    hull(){
        central();
    }
    
}

incline=mount_x+17+1.2;

module central(){
    difference(){
        hull() {
            for(i=[-1,1]) translate([0,dy/2*i,0]) rotate([0,90,0]) rotate(45) cylinder(h=14,r=12, $fn=4);
                
            for(i=[-1,1]) translate([mount_x,dy/2*i,mount_h-5]) rotate([0,90,0]) cylinder(h=mount_w/2,r=3);
            for(i=[-1,1]) translate([mount_x,dy*i,mount_h-3]) rotate([0,90,0]) cylinder(h=mount_w,r=3-2);
                
            for(i=[-1,1])translate([incline,7*i,-35]) rotate([0,-90,0])  cylinder(h=5,r=1);
                
        }
        
        for(i=[-1,1]) translate([-1,dy/2*i,]) rotate([0,90,0]) cylinder(h=32,r=1.8, center=true);
            
        translate([0,-50,mount_h-3]) cube([mount_x,100,100]);
        
        hull(){
            translate([0,0,-30]) rotate([0,90,0]) cylinder(h=150,r=2, center=true);
            translate([0,0,-10]) rotate([0,90,0]) cylinder(h=150,r=6, center=true);
        }
        
        hull(){
            translate([0,0,30]) rotate([0,90,0]) cylinder(h=150,r=18, center=true);
            translate([0,0,10]) rotate([0,90,0]) cylinder(h=150,r=6, center=true);
        }       
    }
}

module corner(){
    
    hole_x=mount_w+mount_x+3;
    hole_y=dy/2;
    difference(){
        hull() {
            for(i=[-1,1]) translate([0,dy/2*i,0]) rotate([0,90,0])  rotate(45) cylinder(h=12,r=10, $fn=4);
                
         // for(i=[-1,1]) translate([mount_x,dy/2*i,mount_h-5]) rotate([0,90,0]) cylinder(h=mount_w/2,r=5);
         //   for(i=[-1,1]) translate([mount_x,dy/2*i,mount_h-5]) rotate([0,90,0]) cylinder(h=mount_w,r=5-2);
                
            a=0;
            translate([hole_x,hole_y,a])  cylinder(h=mount_h-a,r1=7, r2=4);
        }
        
        for(i=[-1,1]) translate([-1,dy/2*i,0]) rotate([0,90,0]) cylinder(h=32,r=1.5, center=true);
            
        translate([0,-50,mount_h-3]) cube([mount_x+50,100,100]);
        
        translate([hole_x,hole_y,-0])  cylinder(h=150,r=2, center=true);
        
        //translate([0,0,-10]) rotate([0,90,0]) cylinder(h=150,r=10, center=true, $fn=4);
        //translate([0,0,10]) rotate([0,90,0]) cylinder(h=150,r=4, center=true, $fn=4);
    }
}

module front(){
    dy=10;
    difference(){
        hull() {
            for(i=[1]) translate([0,dy/2*i,0]) rotate([0,90,0]) rotate(45) cylinder(h=mount_w+mount_x+6,r=10, $fn=4);
        //#    for(i=[-1]) translate([0,dy/2*i,0]) rotate([0,90,0]) rotate(45) cylinder(h=8,r=4, $fn=44);
        //        for(i=[-1]) translate([0,dy/2*i,-3]) rotate([0,90,0]) rotate(45) cylinder(h=8,r=6, $fn=4);
                    
            a=1.2;
        //    for(i=[2]) translate([mount_x,dy/2*i,mount_h-5]) rotate([0,90,0]) cylinder(h=mount_w/2,r=3);
            for(i=[1,1.5]) translate([mount_x,dy*i*2,mount_h-3]) rotate([0,90,0]) cylinder(h=mount_w,r=3-2);
                
            for(i=[-1,1])translate([incline,7*i,-35]) rotate([0,-90,0])  cylinder(h=5,r=1);
                
        }
        
        for(i=[-1,1]) translate([-1,dy/2*i,]) rotate([0,90,0]) cylinder(h=32,r=1.9, center=true);
            
        translate([0,-50,mount_h-3]) cube([mount_x,100,100]);
        
        hull(){
            translate([0,1,-30]) rotate([0,90,0]) cylinder(h=150,r=2, center=true);
            translate([0,4,-10]) rotate([0,90,0]) cylinder(h=150,r=2, center=true);
        }
    }
}