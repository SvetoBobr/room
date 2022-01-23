a=20;
//W=650;
D=625;  //OSB width

wall=16;    // лдсп
rail=13;    // направляюще

BPH=800;
bottom=450;

z=[30,290, 550,1340,1880];

r_tower();
translate([0,800,0]) l_tower();

module r_tower(){
    color([0,0,0])tower(W=650);
    // rails
//    %for(i=[2,3]) translate( [0,0,z[i] +a]) rails(W=650);
    %translate([-a,rail,z[0]+a+3]) spool_box(W=650);
    %translate([-a,rail,z[1]+a+3]) box_2_box(W=650);
}

module l_tower(){
    ltw=810;
    color([0,0,0])tower(W=ltw);
    // rails
  //  %for(i=[2,3]) translate( [0,0,z[i] +a]) rails(W=ltw);
    %translate([-a,rail,z[0]+a+3]) spool_box(W=ltw);
    %translate([-a,rail,z[1]+a+3]) box_4_box(W=ltw);
}

// --------------------------------------------------------------------------------------------+
module tower(W=654){
    for(x=[-a,D]) for(y=[-a,W]) translate([x,y,0]) cube([a,a,2400]);
        
    // frame
    for(i=[0,2,3,4]) translate([0,0,z[i]]) 
        for(y=[0,W-a]) translate([-a,y,0]) cube([D+2*a,a,a]);    
            
    for(i=[2:4]) translate([0,0,z[i]])   {
        for(x=[0,D/2]) for(y=[a,W-a*2]) for(z=[bottom,bottom+BPH,bottom+BPH*2, 2400-a]) {
            translate([-a,y,0]) cube([D/2+2*a,a,a]);
            translate([x,a,0]) cube([a, W-a*2,a]); 
        }
    }
    
}
    

    
module rails(W=650){
    for(y=[0,W-rail]) {
        translate([25/2,y,0]) cube([600,rail,46]);
        hull() {
            translate([0,a,23-a/2]) cube([D,a,a]);
            translate([0,W,23-a/2]) cube([D,a,a]);
        }
    }
}



module spool_box(W=650){
    l=670;//D+a*2;
    w=W-rail*2;
    spool=(l-wall*4)/3;//200;
    
    h=200;//spool+30;
    cube([l,w,wall]);
#    for(i=[0,1]) translate([0,i*(w-wall),wall]) cube([l,wall,h]);
 #   for(i=[0:3]) translate([i*(spool+wall), wall,wall]) cube([wall,w-wall*2,100]);
        
    face_h=520/2-4;
    translate([l,-20-rail+2,0]) color([0.9,1,1,0.5]) cube([wall,W+a*2-4, face_h]);
    
    translate([l,w/2,face_h/2]) color([0,0,0]) grip();
}

module box_2_box(W=650){
    l=670;//D+a*2;
    w=W-rail*2;
    bw=290;
    bl=395;
    bh=200;
    
    h=bh;
    cube([l,w,wall]);
    for(i=[0,1]) translate([0,i*(w-wall),wall]) cube([l-wall,wall,h]);
        
    translate([wall,(w-wall)/2,wall+h-100]) cube([bl-wall,wall,100]);
    
 #   translate([0, wall,wall+h-100]) cube([wall,w-wall*2,100]);
  #  translate([bl, wall,wall]) cube([wall,w-wall*2,h]);

 #   translate([l-wall, 0,wall]) cube([wall,w,h]);
    
    face_h=520/2-4;
    translate([l,-20-rail+2,0]) color([0.9,1,1,0.5]) cube([wall,W+a*2-4, face_h]);    
    
    translate([l,w/2,face_h/2]) color([0,0,0]) grip();
}

module box_4_box(W=810){
    l=670;//D+a*2;
    w=W-rail*2;
    bl=290;
    bw=395;
    bh=200;
    
    h=200;//bh;
    cube([l,w,wall]);
    for(i=[0,1]) translate([0,i*(w-wall),wall]) cube([l-wall,wall,h]);
        
 #  for(i=[0,1])translate([wall+i*(bl),(w-wall)/2,wall+h-100]) cube([bl-wall,wall,100]);
    
 #  for(i=[0,1,2])  translate([i*(bl), wall,wall+h-100]) cube([wall,w-wall*2,100]);
#   translate([l-wall, 0,wall]) cube([wall,w,h]);
    
    face_h=520/2-4;
    translate([l,-20-rail+2,0]) color([0.9,1,1,0.5]) cube([wall,W+a*2-4, face_h]);    
   
   translate([l,w/2,face_h/2]) color([0,0,0]) grip();
}

module grip(){
    for(i=[-1,1]) translate([32-15,i*(128/2-10),0]) rotate_extrude(angle=90*i) translate([10,0,0]) circle(r=5);
    translate([32-5,0,0]) rotate([90,0,0])cylinder(h=108,r=5,center=true);
    for(i=[-1,1]) translate([0,i*(128/2),0]) rotate([0,90,0]) cylinder(h=32-15,r=5);
}