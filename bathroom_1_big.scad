L=1800;
W=1500;
H=2450;

level=150;

use<./kitchen.scad>
use<./plumbing.scad>

translate([80,L+90,0]) kitchen();
outer_walls();
_floor();
%big_placement();
small_placement();
translate([0,L,150])plates();

plumbing();

translate([1450+2400+1600,-1100,0]) cube([10,5500,2000]);
%translate([0,5300-1100,0]) cube([5500,100,2000]);

translate([1450+2400+1600-670,1650-1100,0]) cube([670,700,2400]);
translate([1450+2400+1600-670,1650+700+1000-1100,0]) cube([670,850,2400]);


translate([500+800+450,3000,0]) cylinder(h=700,r=450);
#translate([500+800+450,3000,0]) hull(){
//    for
    cylinder(h=700,r=450);
    translate([2000,0,0]) cylinder(h=700,r=450);
}

module plumbing(){
        // стояк
    color([0.7,0.5,0.5]){
        translate([-270,400,0]) cube([200,400,1000]);
        translate([-170,500,0]) cylinder(h=2400,r=55);
     //   translate([-30,500,70]) rotate([0,60+180,0]) cylinder(h=200,r=140/2);
    }
    
    translate([0,500,70]) rotate([0,60+180,0]) {
        translate([0,0,-50]) big_corner();;
        translate([0,0,50]) cylinder(h=200,r=140/2);
        
        translate([0,-400,-50]) mirror([0,1,0])rotate([0,180+30-0,0]) corner_45();
        
        //translate([0,-500,-50]) mirror([0,1,0])rotate([90,180+30-90,0]) rotate([0,45,0])corner_90();
    }
    translate([130,3,300]) rotate(45+90)rotate([90,0,0])corner_90();
    translate([130,3,100]) rotate(180+45)rotate([0,0,0])corner_90();
}

module big_placement(){
    translate([0,0,level]){
        translate([0,L-900-1,120]) tube();
        translate([0,L-1006-100,800-175]) sink();
        translate([370/1.4+50,370*(0)-50, 0]) rotate([0,0,45]) wc();
        
        translate([W-400,-50,150]) washer();
    }
}

module small_placement(){
    translate([0,0,level]){
        for (h=[800,1300])translate([100,0,h]) filter();
        
        color([0.5,0.5,1]){
            translate([100,0,800]) rotate(45-90) translate([150,0,0]) cylinder(h=480,r=15);
            translate([-150,300,1100-110]) rotate([0,90,0]) rotate(90)counter();
            translate([-150,300,1300]) rotate([90,0,45]) cylinder(h=200,r=11);
            translate([-150,300,1300]) rotate([180,0,0]) cylinder(h=200,r=11);
        }
    }
    
    translate([W-50,250,2000]) cylinder(h=200,r=12);
}

module plates(){
    a=190;
    b=a;
    d=3;    

    N=1500/(a+d);
    M=4; //2400/(b+d);

    x=-50;
    y=-155;
    
    x2=55;
    // solid white
    color([0.9,1,1,0.8]){
        for(i=[0:N]) for (j=[1:M]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,5,b]);
        for(i=[1:N]) for (j=[1:M]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);
            
        //for(i=[0:N]) for (j=[2+M:5+M]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,5,b]);
        for(i=[1:N]) for (j=[2+M:5+M]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);   

        for(i=[0:N]) for (j=[M+7:M+8]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,5,b]);
        for(i=[1:N]) for (j=[M+7:M+8]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);       

        for(i=[1:6]) for (j=[1:4]) translate([W,-i*(a+d)+60,  y+j*(b+d)]) cube([5,a,b]);
        for(i=[1:6]) for (j=[2+M:5+M]) translate([W,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]); 
        for(i=[1:6]) for (j=[M+7:M+8]) translate([W,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]); 
    }
    
    // glass blocks with light
    color([0.85,0.8,0.8,0.5]){
        for(i=[0:N]) for (j=[M+1]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,80,b]);
        for(i=[1:N]) for (j=[1+M]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);   
            
        for(i=[0:N]) for (j=[M+1+5]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,80,b]);
        for(i=[1:N]) for (j=[1+M+5]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);       
         
        for(i=[1:6]) for (j=[1+M]) translate([W,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);   
        for(i=[1:6]) for (j=[1+M+5]) translate([W,-i*(a+d)+x2,  y+j*(b+d)]) cube([5,a,b]);    
    }
    // glass blocks NO light
    color([0.5,0.5,0.5,0.5]){
        for(i=[0:N]) for (j=[M+2:M+5]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,80,b]);
    }     
    // mirror
    color([0.5,0.5,0.5]) {
        hull(){
            for(i=[2:6]) for (j=[2+M:M+1+4]) translate([0,-i*(a+d)+x2,  y+j*(b+d)]) cube([6,a,b]);  
        }        
        hull(){
            for(i=[2:4]) for (j=[2+M:M+1+4]) translate([W-5,-i*(a+d)+x2,  y+j*(b+d)]) cube([16,a,b]);  
        }
    }
 //   %translate([0,0,0])cube([W,90,H]);
    
    //for(i=[3:N-2]) for (j=[3:M-2]) translate([x+i*(a+d), 0, y+j*(b+d)]) cube([a,50,b]);
    wh=770;//y+4*(b+d);
    wx=x; //(a+d)*2+x
    echo(wh= wh);
    //color([0.5,0.3,0.5,]) translate([wx,-1,wh])cube([(a+d)*7, 95, (a+d)*2]);
    
   // translate([W,-L,0])cube([90,L,H]);
    
    // filter panel
    %translate([350,-100-L, 0]) rotate([0,0,45]) cube([10,500,H]);
    
    // controls
    translate([0,-6.5*(a+d)+60,  y+4.5*(b+d)]) rotate([0,90,0])grip1();
    // напор в кране / дивертор / напор в душе
    for(i=[2,4,6]) for (j=[M+1]) translate([x+(i+0.5)*(a+d), 0, y+4.5*(b+d)]) rotate([90,0,0])grip1();
    // переключение температуры / вкл-выкл
    for(i=[3,5]) for (j=[M+1]) translate([x+(i+0.5)*(a+d), 0, y+4.5*(b+d)]) rotate([90,0,0])button1();   
        
    translate([W,-450,2200]) color([0.5,0.5,0.5]) top_shower();
    
    translate([5,-2*(a+d)+x2,  y+4*(b+d)]) color([0.5,0.5,0.5]) source();
}

module grip1(){
    color([0.5,0.5,0.5]) cylinder(h=10,r=40);
    color([1,1,1]) cylinder(h=50,r=20);
}
module button1(){
    color([0.5,0.5,0.5]) cylinder(h=5,r=20);
    color([1,1,1]) cylinder(h=6,r=11);
}
module top_shower(){
    rotate([0,-90,0]) cylinder(h=5,r=54/2);
    rotate([0,-90,0]) cylinder(h=413,r=25/2);
    translate([-413,0,-100]){
        cylinder(h=5,r=100);
        cylinder(h=100,r=25/2);
    }
}

module source(){
    rotate([0,90,0])cylinder(r=25,h=4);
    rotate([0,90,0])cylinder(h=100,r=38/2);
    translate([100,0,0]) rotate([0,110,0])cylinder(h=66,r=38/2);
}

// main entrance
//color([0.5,0.5,0.5]) 
module outer_walls(){
    difference(){
        translate([-400,-1200,-1])cube([400,1200+1800+2400,H]);
        translate([-300,-1100,0])cube([310,900,2000]);
        
        translate([-300,190,0])cube([310,500,2400]);
    }
    

// bath wall
    difference(){
        translate([0,-200,0])cube([W,100,H]);
        translate([450,-210,0]) cube([600,150,2000]);
    }
}

module _floor(){
    // basic floor
    //%translate([0,-1200,-1]) cube([2000,1200+1800+2400,1]);
    
    //floor
    %difference(){
        translate([0,-200,0]) cube([W,L+200,160]);
        translate([450,-1,100])cube([600,200,101]);
        
        hull(){
            translate([0,0,200]) cube([W,L,200]);
            translate([(W-850)/2+100,700,200-20])cube([850,70,10]);
        }
    }
    translate([(W-850)/2+100,700,160-10])color([0.2,0.3,0.5])cube([850,70,10]);
}




module filter(){
    color([0.5,0.5,1]) rotate(45)rotate([180,0,0]){ 
        hull(){
            cylinder(h=100,r=100);
            cylinder(h=350,r=70);
        }
        rotate([90,0,0]) cylinder(h=300,r=26, center=true);
    }
}

module counter(){
    translate([0,0,-25])cylinder(h=70,r=35);
    rotate([90,0,0])cylinder(h=220,r=20,center=true);
}

module washer(){
    color([1,1,1,0.8])cube([400,600,840]);
    color([0.5,0.5,0.5,0.8])translate([0,300,500]) rotate([0,-90,0]) cylinder(h=50,r=200);
}


// https://i.sdvk.ru/i/Art-Max/RIMINI-AM204CHR-CHasha-unitaza-podvesnogo-bezobodkovogo-234851/356502.jpg
module wc(){
    
 //   translate([-140,-300+500/2,0])cube([140,500,1200]);
    
    color([1,1,1,0.8])translate([0,0,60])hull(){
       # cube([370,370,340]);
        cube([370,370,340]);
        for(i=[-1,1]) translate([570-370/4,i*(370/4)+370/2]) 
            cylinder(h=340,r=370/4);
    }
    
   % translate([0,-300+370/2,0]) cube([370+350,600,10]);
}

module tube(){
    w=[450,700,850,900];
    x=[0,500,1000,1500];
    color([1,1,1,0.6]) hull(){
        for(i=[0:3]) translate([x[i],900-w[i],0]) cube([1,w[i],450]);
    }
}

module sink(){
    w=[200,509,509/3];
    x=[0,300,1006];
    color([1,1,1,0.4])
    difference(){
        hull(){
            for(i=[0:2]) translate([0,x[i],0]) cube([w[i],1,175]);
                intersection(){
                    translate([200,300,0]) cylinder(h=175,r=300);
                    translate([0,0,0])cube([509,1000,175]);
                }
                //translate([250,450,0]) cylinder(h=175,r=200);
        }
        
        rotate([5,0,0]) translate([0,0,-200]) cube([600,1100,200]);
    }
}