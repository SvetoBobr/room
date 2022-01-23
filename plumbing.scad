//big_cross();
big_corner();

module big_cross(){
    //rotate([0,-90,0])
    {
        hull(){
            sphere(r=110/2);
            cylinder(r=110/2,h=110);
        }
        
        hull(){
            sphere(r=110/2);
            rotate([90,0,0]) cylinder(r=110/2,h=110);
        }
        
        rotate([180,0,0])cylinder(r=50/2, h=100);
        rotate([270,0,0])cylinder(r=50/2, h=100);
    }
}
module big_corner(){
    //rotate([0,-90,0])
    {
        hull(){
            sphere(r=110/2);
            cylinder(r=110/2,h=110);
        }
        
        hull(){
            sphere(r=110/2);
            rotate([90,0,0]) cylinder(r=110/2,h=110);
        }
        
    //    rotate([180,0,0])cylinder(r=50/2, h=100);
        rotate([270,0,0])cylinder(r=50/2, h=100);
    }
}
module corner_45(){
        hull(){
            sphere(r=110/2);
            rotate([45*2,0,0]) cylinder(r=110/2,h=110);
        }    
        hull(){
            sphere(r=110/2);
            rotate([-45,0,0]) cylinder(r=110/2,h=110);
        }            
}

module corner_90(){
        hull(){
            sphere(r=110/2);
            rotate([45*2,0,0]) cylinder(r=110/2,h=110);
        }    
        hull(){
            sphere(r=110/2);
            rotate([-0,0,0]) cylinder(r=110/2,h=110);
        }            
}