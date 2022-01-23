$fn=60;

function add(v, i = 0, r = 0) = i < len(v) ? add(v, i + 1, r + v[i]) : r;

w=16;

offsets=[37,32,32];
L=add(offsets)+20; //37+32+32+20;

holeX = [ for (a=0, b=offsets[0]; a < len(offsets); a= a+1, b=b+offsets[a]) b];
echo(cumsum);

//offset=[37,

difference(){
    union(){
        hull(){
            cube([L,w,3.5]);
            rotate(-90) cube([85,16,3.5]);
            
    
        }
        
    color([0,1,0])    rotate(180) hull(){
            translate([0,46.5,0]) cylinder(h=3,r=7);
            translate([10,46.5,0]) cylinder(h=3,r=7);
        }
    }
    
    for(i=[0:2]) translate([holeX[i],w/2,-1]) {
        cylinder(h=12,r=6);
        holes();
    }
        
    rotate(180) hull(){
        translate([0,46.5,-1]) cylinder(h=12,r=4);
        translate([17,46.5,-1]) cylinder(h=12,r=4);
    }
}

module holes(){
    for (i=[0:2]) rotate(-i*90) translate([10,0,0]) cylinder(h=12,r=1.5);
        
}

translate([0,0,20]) color([1,0,0]) difference (){
    union(){
        hull(){
            for (i=[0:2]) rotate(-i*90) translate([10,0,0]) cylinder(h=4,r=4);
            
        }
        cylinder(h=4,r=10);
    }
    
    translate([0,0,-2])holes();
    translate([0,0,-2])cylinder(h=12,r=3.5);
    translate([0,0,2])cylinder(h=10,r=6);
}


translate([0,0,40]) color([0,0,1])  difference (){
    union(){
        hull(){
            for (i=[0:2]) rotate(-i*90) translate([10,0,0]) cylinder(h=2,r=4);
            
        }
        cylinder(h=2,r=10);
        cylinder(h=6,r=5.5);
    }
    
    translate([0,0,-2])holes();
    translate([0,0,-2])cylinder(h=12,r=2);
    
}