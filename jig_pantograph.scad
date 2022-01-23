dx=125;
dy=45;

difference(){
    hull(){
       place() cylinder(h=3, r=5, center=true); 
    
    }
    
    hull(){
        for(j=[-1,1]) translate([dx/3*j, dy*1, 0]) cylinder(h=50, r=1, center=true);
    }
    
    hull(){
        for(i=[1:4]) translate([0, dy*i, 0]) cylinder(h=50, r=1, center=true);
    }   
    
    place() cylinder(h=50, r=1, center=true);
}

module place(){
    for(i=[0:5]) for(j=[-1,1]) translate([dx/2*j, dy*i, 0]) children(0);
}