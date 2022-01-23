
//for(i=[-1,1]) rotate(90) translate([25*i/2, 50, 0])cylinder(h=20,r=1.5);
  
difference(){
    union(){
        cylinder(h=5,r=35);
        //cylinder(h=30, r1=48/2, r2=45/2);
    }
    translate([0,0, 0]) for(j=[1:4]) 
        rotate(90*j+45) translate([0,45/2+7,0]) cylinder(h=25, r=1.5, center=true);
    
    //cylinder(h=150, r=38/2+0.5, center=true);
}