W=2250;
L=2380;

w=750;
l=600;
H=2450;

RH=2480;

wall=16;



//%translate([w*0.5,l/2, H-500])     cube([w-80, l-40, 1000], center=true);
//%translate([w*0.5,l/2, H300]) rotate([0,90,0]) cylinder(h=w-80, r=800, center=true);


//%translate([w*0.5,l/2, RH-800-200]) rotate([0,90,0])     cylinder(h=w+80, r=800, center=true);



//%translate([w*1.5,l/2, H-500-200]) cube([w-80, l-40, 1400], center=true);
translate([0,0,0]) wardrobe();

%translate([0,-10,0]) rails();
//translate([0,-10,0]) doors();

//floor
%translate([0,-150,-10]) cube([W,L,10]);
//%translate([W,-150-700*2,0]) cube([10,700,2000]);
module wardrobe(){
    for (x=[0, w-wall, w, 2*w-wall]) translate([x,0,0]) cube([wall, l, H]);
    
    %for (i=[0:6]) translate([w*0.5,l*0.5, i*175+40]) box();
    %for (i=[0:3]) translate([w*1.5,l*0.5, i*175+40]) box();
        
    // polki
    translate([0,0,H-1180]) cube([w,l,wall]);
    translate([w,0,H-1180-400]) cube([w,l,wall]);
    // antresol
    translate([0,0,RH-200]) cube([w,l,wall]);
    translate([w,0,RH-200]) cube([w,l,wall]);
    
    // back walls
    translate([0,600,0]) cube([750,wall,RH-200+wall]);
    translate([750,600,0]) cube([750,wall,RH-200+wall]);
    echo(RH-200+wall);
    //polka nad dveriu
    translate([w*2,0,2000]) cube([w,l,wall]);
    

}

translate([W-18,-150,0]) cube([28,140,RH]); //косяк
translate([0,-150,0]) cube([18,140,RH]); //косяк

//
module rails(){
    translate([0,-45-16,RH-200]) cube([W, 45, 200]);
    for(i=[1:3]) translate([0,-35*i,2480-200-35]) 
        color([0.5,0.5,0.5])cube([W, 34, 35]);
}

module doors(){
    dh=RH-200-100;
    dw=w+36;
    for(i=[1:3]) translate([18+(3-i)*w-wall*(4-i),-35*i,20]) 
        color([0.3,0.5,0.5, 0.5])cube([750, 16, dh]);   
}

module box(){
    $fn=12;
    bw=685;
    bl=535;
    hull(){
        for (i=[-1,1]) for (j=[-1,1]){
            translate([(bw/2-30)*i, (bl/2-30)*j,0]) cylinder(h=10, r=10);
            translate([bw/2*i, bl/2*j,150]) cylinder(h=10, r=10);
        }
    }
}

module fx_box(){
       $fn=12;
    bw=490;
    bl=370;
    %color([1,0.8,0.6, 0.5]) hull(){
        for (i=[-1,1]) for (j=[-1,1]){
            translate([(bw/2-30)*i, (bl/2-30)*j,0]) cylinder(h=10, r=10);
            translate([bw/2*i, bl/2*j,270])  cylinder(h=10, r=10);
        }
    } 
}

sw=820/2;
for(i=[0:3]) for(j=[0:1]) translate([500/2, l+wall+sw*(1/2+i), j*270]) fx_box();
for(i=[0:3]) for(j=[0:1]) translate([500/2, l+wall+sw*(1/2+i), j*270+700]) fx_box();
for(i=[0:3]) for(j=[0:1]) translate([500/2, l+wall+sw*(1/2+i), j*270+700+600]) fx_box();   
for(i=[0:3]) for(j=[0:1]) translate([500/2, l+wall+sw*(1/2+i), j*270+700+600*2]) fx_box();     
    
for(i=[0:1]) translate([0, l+wall+sw*(i)*2, 0]) color([0.5+0.5*i,1,1]) {
    cube([500,wall,700-22]);
    translate([0,sw*2-wall,0]) cube([500,wall,700-22]);
    translate([0,wall,0]) cube([wall,sw*2-wall,150]);
}
    
for(i=[0:1]) for(j=[0:2])translate([0, l+wall+sw*(i)*2, 700+j*600]) color([0.5+0.5*i,1,1]) {
    cube([500,wall,600-22]);
    translate([0,sw*2-wall,0]) cube([500,wall,600-wall]);
    translate([0,wall,0]) cube([wall,sw*2-wall,150]);
}

{   // tables
translate([0,l+wall,700-22]) cube([500,820,22]);   
translate([0,l+wall+820,700-22]) cube([W,820,22]);
}



for(i=[3]) for(j=[0:1]) translate([W-500/2, l+sw*(1/2+i), j*270]) fx_box();