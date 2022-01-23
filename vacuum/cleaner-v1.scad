inner_circle=95;

module containers(){
    %bucket();
    %translate([0,0,100]) bucket2();
}

//%cylinder(h=550,r=200, center=true);



part=0;

if ( part==0)%containers();
    

if (part==1 || part==0) translate([0,0,3])stage2();
if (part==2 || part==0) translate([0,0,2])stage2_inflow();

if (part==3 || part==0) translate([0,0,1])stage2_outflow();

%if (part==4 || part==0) translate([0,0,-18-20-9]) mirror([0,0,1])  motor_flange();

//if ( || part==0)
module bucket(){
    //rotate([180,0,0])
    {
        cylinder(h=190, r2=190/2, r1=210/2);
        cylinder(h=10, r=220/2);
    }
}

module bucket2(){
    //rotate([180,0,0])
    {
        cylinder(h=70, r2=80/2, r1=120/2);
        cylinder(h=10, r=130/2);
    }    
}


// separator
    h1=100;
    h2=30;
    br=15+2;
    sr=8/2+2;
th=4;
N=6;

module stage2(){
    //N=6;
    difference(){
        union(){
            // cones
            for(i=[1:N]) rotate(i*360/N) translate([inner_circle/2-10,0,0])         
                union(){
                    cylinder(h=th, r=br+6);
                    hull(){
                        cylinder(h=h1, r=sr);
                        cylinder(h=h2, r=br);
                    }
                    
                    hull(){
                        a=20;
                        translate([0,0,h1-th]) cylinder(h=th, r=br);
                        translate([0,0,h1-th-a])cylinder(h=a, r=sr);
                    }           
                }
                
            // inflow tube
            cylinder(h=50, r=38/2+2);
            
            // cap flange
            difference(){
                cylinder(h=th, r=inner_circle/2+13);
                cylinder(h=th*3, r=inner_circle/2+13-br, center=true);
            }
            
            // bucket flange
            translate([0,0,h1-th]) cylinder(h=th, r=inner_circle/2+7);
            
            // interconnection cones
            for(i=[1:N]) for(j=[-1,1]) rotate(360/N*i+j*15) translate([0,53,0]) cylinder(h=15,r1=8, r2=4);
            for(i=[1:N]) rotate(360/N*i) translate([0,38/2+6,0])cylinder(h=15,r1=6, r2=4);
        }
        translate([0,0,h1-th]) cylinder(h=th*3, r=inner_circle/2+7-br-10, center=true);
        
        translate([0,0,-1]) cylinder(h=55,r=38/2);
        
        translate([0,0,h1-th]) difference(){
            cylinder(h=35,r=inner_circle/2+8, center=true);
            cylinder(h=50,r=inner_circle/2+8-br/2, center=true);
        }
        
        // cones
        for(i=[1:N]) rotate(i*360/N) translate([inner_circle/2-10,0,0])   {
            hull(){
                cylinder(h=h1, r=sr-2);
                cylinder(h=h2, r=br-2);
            }
            
            cylinder(h=h1+1, r=sr-2);
            translate([0,0,-1]) cylinder(h=h2, r=br-2);
            
            
        }
        
        for(i=[1:N]) for(j=[-1,1]) rotate(i*360/N+13*j) 
            translate([inner_circle/2-10,0,h1]) cylinder(h=30,r=1.5, center=true);
        
        translate([0,0,h1-th]) cylinder(h=0.1, r=100, center=true);
        
        interconnect();
    }
}


module stage2_inflow(){
    translate([0,0,-18]) difference(){
        union(){
            hull() {
                for(i=[1:N]) 
                    rotate((i+1)*360/N) translate([inner_circle/2-10,0,br]) intersection(){
                        sphere(r=br);
                        rotate([180,0,0])cylinder(h=br, r=br);
                    }
                translate([0,0,18-20]) cylinder(h=20, r=inner_circle/2+12);
                translate([0,0,18-th]) cylinder(h=th, r=inner_circle/2+13);
                    
    
            }
            
            for(i=[1:N]) rotate((i+1)*360/N) translate([inner_circle/2-10,0,br])cylinder(h=25, r=15/2+2);
            
        }
        
        // incoming channels
        difference(){
            for(i=[1:N]) {
                hull(){
                    intersection(){
                        rotate(i*360/N-6.5) translate([0,0,0]) cube([10,35,19]);
                        rotate((i+1)*360/N) translate([inner_circle/2-10,0,br]) sphere(r=br-2);
                    }
                    rotate(i*360/N-6.5) translate([0,0,0]) cube([10,5,18]);
                }
                
                difference(){
                    rotate((i+1)*360/N) translate([inner_circle/2-10,0,br]) sphere(r=br-2);
                    rotate((i+1)*360/N) translate([inner_circle/2-10,0,0]) 
                        rotate([-35,0,0]) cube([50,50,10], center=true);
                }
            }
                    
            for(i=[1:N]) rotate((i+1)*360/N) translate([inner_circle/2-10,0,br])
                cylinder(h=100, r=15/2+2, center=true);
        }
        
        for(i=[1:N]){
            rotate((i+1)*360/N) translate([inner_circle/2-10,0,br])cylinder(h=100, r=15/2, center=true);
        }
        
        interconnect();
    }
}

module stage2_outflow(){
    translate([0,0,-18-20])  difference(){
        cylinder(h=18, r=inner_circle/2+12);
        
        for(i=[1:N]) hull(){
            rotate((i+1)*360/N) translate([inner_circle/2-10,0,br])cylinder(h=100, r=15/2, center=true);
            cylinder(h=20,r=38/2, center=true);
        }
        
        interconnect();
    }
}

module motor_flange(){
    capz=150;
    /*
    %translate([0,0,2*th])union(){
        hull(){
            cylinder(h=10, r=138/2);
            cylinder(h=110, r=130/2);
        }
        cylinder(h=120,r=38/2);
    }
    */
    
    difference(){
        union(){
            rotate(360/12) cylinder(h=120+th*2,r=150/2+12, $fn=6) ;
            for(i=[1:N]) rotate(360/N*i) translate([-7.5,0,0])cube([15,100,120+th*2]);
                
            for(i=[1:N]) rotate(360/N*i+360/12)translate([-45,75,0])cube([90,13,20]);
            for(i=[1:N]) rotate(360/N*i+360/12)translate([-45,75,120+th*2-20])cube([90,13,20]);    
                
            //cap
            translate([0,0,capz])rotate(360/12) cylinder(h=10,r=150/2+12+15, $fn=6) ;
            translate([0,0,capz])rotate(360/12) cylinder(h=10+th,r=38/2+10) ;
        }
        
        rotate(360/12) translate([0,0,th*2]) cylinder(h=120+th*2,r=150/2+12-th, $fn=6) ;
        
     //   cylinder(h=10, r=160/2);
        
        translate([0,0,th]) cylinder(h=10,r=55/2);
        translate([0,0,th]) cylinder(h=122,r=138/2);
        
        cylinder(h=50, r=38/2, center=true);
        
        translate([0,0,th*2]) cylinder(h=0.1, r=200, center=true);
        for(i=[1:N]) rotate(360/N*i) translate([0,0,th*2])cube([0.1,100,120+th*2]);
            
        for(i=[1:N]) rotate(360/N*i) for(j=[-2:2]) translate([80,15*j,-5])cylinder(h=200, r=1.5);
        for(i=[1:N]) rotate(360/N*i) for(j=[1:4]) translate([0,91,20*j+15]){
            rotate([0,90,0]) cylinder(h=150, r=1.5);    
            rotate([0,-90,0]) cylinder(h=150, r=2.5);    
        }
        
        interconnect();
        
        translate([0,0,capz+th]) cylinder(h=12, r=38/2);    // 
        
        for(i=[-1,1]) translate([0,50*i, capz-1])cylinder(h=20,r=38/2);  // outflow
   #     for(i=[-1,1]) translate([0,50*i, capz-1]) for(j=[1:4]) 
            rotate(90*j+45) translate([0,45/2+7,0]) cylinder(h=25, r=1.5, center=true);
        
        for(i=[-1,1]) rotate(90) translate([25*i/2, 50, capz-1])cylinder(h=20,r=1.5);
        rotate(90) translate([0, 50, capz-1])cylinder(h=20,r=16.5/2);
        
    }
    
    difference(){
        translate([0,0,0]) cylinder(h=th*2,r=95/2);
        cylinder(h=50, r=38/2, center=true);
        
        interconnect();
    }
    
    
}

module interconnect(){
for(i=[1:N]) for(j=[-1,1]) rotate(360/N*i+j*15) translate([0,53,-100])cylinder(h=150, r=1.5);
for(i=[1:N]) rotate(360/N*i) translate([0,38/2+6,-100])cylinder(h=150, r=1.5);
}


//translate([50,0,-38/2]) rotate([90,0,0]) cylinder(h=50,r=38/2);
/*
intersection(){
    difference(){
        cylinder(h=4,r=195/2, center=true, $fn=120);
        cylinder(h=6,r=120/2, center=true, $fn=120);
        
        intersection(){
            difference(){
                cylinder(h=5,r=195/2-6, center=true, $fn=120);
                cylinder(h=6,r=120/2+6, center=true, $fn=120);           
            }
             translate([10,10,-20]) cube([100,100,100]);
        }
    }
    
    translate([0,0,-20]) cube([100,100,100]);
}
*/
//%translate([0,0,0]) mirror([0,0,1])  dead_zone();

translate([0,0,0]) mirror([0,0,1])  tube();

module tube(){
    //translate([120/2+45/2,0,45/2+12]) rotate([90,0,0]) cylinder(h=100, r=45/2);
    difference(){ union(){
        translate([120/2+45/2,-100,45/2+12]) rotate([90,0,0]) 
                cylinder(h=50+10,r1=44/2+2, r2=45.5/2+2);
        
        hull(){
            translate([120/2+45/2,-100,45/2+12]) rotate([90,0,0]) cylinder(h=5,r=45/2);
            translate([50,0,0]) cube([50,5,50]);
        }
        
         hull(){
             intersection(){
                 cube([100,100,50]);
                 cylinder(h=50,r=190/2);
             }
      //      translate([120/2+45/2,-100,45/2+12]) rotate([90,0,0]) cylinder(h=5,r=45/2);
            translate([50,0,0]) cube([50,5,50]);
        }   }
        
        
        dead_zone();
        
        translate([0,0,70]) rotate([-20,0,0]) cube([500,500,50], center=true);
        translate([0,0,37]) rotate([0,-35,0]) cube([500,500,50], center=true);
        
        for(i=[1:5]) rotate(i*18-8){
            translate([89,0,0]) cylinder(h=80,r=1.5, center=true);
            translate([65,0,0]) cylinder(h=80,r=1.5, center=true);
        }
    }
}

module dead_zone(){
    union(){
    ch=38+6;
    cylinder(h=500,r=120/2, center=true);
    
    difference(){
        cylinder(h=12,r=220/2);
        translate([0,0,-1]) cylinder(h=14,r=188/2);
    }
    
    rotate([180,0,0]) cylinder(h=10,r=250/2);
    
    translate([0,0,ch]) rotate(360/12)  cylinder(h=50,r1=110, r2=200, $fn=6);
}
}