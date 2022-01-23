L=1800;
W=1500;
H=2450;



%cube([1,L,H]);
%translate([0,L,0])cube([W,1,H]);


level=150;

color([0.5,0.5,0.5]) difference(){
    cube([W,L,140]);
    //translate([450,-1,100])cube([600,200,101]);
    
    hull(){
        translate([0,0,140]) cube([W,L,200]);
        translate([-10,700,140-20])cube([1600,70,10]);
    }
}

translate([100,700,140-28])color([0.2,0.3,0.5])cube([1300,70,10]);

translate([0,0,140]){
    translate([0,L-900,100]) tube();
    translate([0,L-1006,800-175]) sink();
    translate([0,300-370/2,0]) wc();
    
    translate([W-400,0,level]) washer();
}
//%translate([0,0,level-25]) cube([370+350,1000,25]);

%difference(){
    translate([0,-100,0])cube([W,100,H]);
    translate([450,-110,0]) cube([600,150,2000]);
}

module washer(){
    cube([400,600,840]);
    translate([0,300,500]) rotate([0,-90,0]) cylinder(h=50,r=200);
}


// https://i.sdvk.ru/i/Art-Max/RIMINI-AM204CHR-CHasha-unitaza-podvesnogo-bezobodkovogo-234851/356502.jpg
module wc(){
    
    translate([0,0,60])hull(){
        cube([370,370,340]);
        for(i=[-1,1]) translate([490-370/4,i*(370/4)+370/2]) 
            cylinder(h=340,r=370/4);
    }
    
    translate([0,-300+370/2,0]) cube([370+350,600,1]);
}

module tube(){
    w=[450,700,900];
    x=[0,500,1500];
    hull(){
        for(i=[0:2]) translate([x[i],900-w[i],0]) cube([1,w[i],450]);
    }
}

module sink(){
    w=[300,509,509/3];
    x=[0,300,1006];
    color([1,1,1,0.4])
    hull(){
        for(i=[0:2]) translate([0,x[i],0]) cube([w[i],1,175]);
    }
}