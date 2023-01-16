kitchen();

module kitchen(){

wall=16;


height=1000-38; //830+100; //878;
th=38;

deep=500;

W=2430;//800+600+500+300;

translate([-80,0,height]) color([0.8,0.8,0.5]) cube([600,W,th]);
xcenter=deep/2-35;
ysinkcenter=800/2;

face_h=720;
face_h_top=620;   
face_space=3;
level=height-face_h-3;

// sink box
/*
    здесь нужно убедиться, что задняя планка не мешает сегрегатору
    также надо:
     - точнее определиться с положением раковины    
     - более точно определить высоту ниши для духовки
     - подумать над способами уменьшить ширину передних планок. и нужны ли они вообще
     - решить вопрос с гидроаккумулятором
*/
translate([100-80,0,1470]) top_box(w=800, doors=2);
translate([100-80,800,1470]) top_box(w=600, doors=2);
translate([100-80,600+800,1470]) top_box(w=400, doors=1);
kitchen_box();
// sink
$fn=12;
bw=450;
bl=550;
translate([xcenter,ysinkcenter,height-180+th]) color([0.5,0.6,0.8])
hull(){
    for (i=[-1,1]) for (j=[-1,1]){
        translate([(bw/2-30)*i, (bl/2-30)*j,0]) cylinder(h=10, r=10);
        translate([bw/2*i, bl/2*j,180]) cylinder(h=10, r=10);
    }
}
// disposal
translate([xcenter,ysinkcenter,height-180-360+th-5]) color([0.2,0.1,0.1]) cylinder(h=360,r=100);

// bin
binw=260;
translate([wall,800-wall-binw,level+wall]) color([0.3,0.5,0]) cube([482,binw,480]);
/*
translate([500-450,800-wall-binw,level+wall+370]) color([1,0.5,0.2]) cube([450,binw,200]);
translate([500-450,800-wall-130,level+wall+370]) color([1,0.5,0.2]) cube([450,130,250]);
*/

// filter block
color([1,1,1]){
for(i=[-1:1]) translate([500/2+160*i, 100,level+wall+10]) cylinder(h=310,r1=90/2,r2=120/2);
translate([500/2,100,level+wall+310+4])    cube([160*3,160,10], center=true);

translate([500/2,100,level+wall+310+4+220/2+20])    cube([160*3,160,220], center=true);
}

//vents
translate([-80,800+600/2-55, height]) color([1,1,1]) cube([55,110,600]);
// background
translate([-86,0,height]) color([0.7,0.7,0.7]) cube([6,W,600]);
// heater
translate([-60,1910, 330+38+height]) heater();
// equipment
translate([0,800+100,height]) color([0,0,0]) cooker();
translate([0,800+400, height]) color([0,0,0])  toster();

translate([-74,800+300+55+100, height+38+100]) sockets();
translate([-74,800+300+55+100+87-18, height+38+100+87]) sockets();

translate([-50,400,height+38+100]) color([0.5,0.5,0.6]) rotate(180)faucet();
translate([-50,800,height+38+100]) color([0.5,0.5,0.6]) rotate(180)drinking();
// cook box
translate([0,800,0]) color([0.9,1,1]){
box_walls(600, deep, height);
translate([0,wall,400+10])cube([400,600-wall*2,wall]); 
}
translate([0,800+wall+6]) color([1,1,1]) cube([deep,600-wall*2-20,400]); // dishwasher
// oven
translate([0,800+face_space/2, 400+wall+6]) cube([deep, 600-face_space, 455]);

// right box
translate([0,800+600+500,0]) {
    kitchen_box(w=300, doors=1);
}
// =====================

module kitchen_box(w=800, doors=2, deep=500){
    box_walls(w, deep, height);
    translate([0,wall,level])cube([deep,w-wall*2,wall]);    // bottom
    translate([0,wall,level+200])cube([wall,w-wall*2,300]);
    translate([500-wall,wall,height-100])cube([wall,w-wall*2,100]);
    
    if (doors==1){
        %translate([500,face_space/2,height-face_h-face_space])cube([20,w-face_space,face_h]);
    }
    else {
        %translate([500,face_space/2,height-face_h-face_space])cube([20,w/2-face_space,face_h]);
        %translate([500,face_space/2+w/2,height-face_h-face_space])cube([20,w/2-face_space,face_h]);
    }
}

module top_box(w=800, doors=2){
    deep=300;
    level=0;
    height=620;
    box_walls(w, 300, height);
    translate([0,wall,40])cube([deep,w-wall*2,wall]);    // bottom
    translate([0,wall,level+200])cube([wall,w-wall*2,300]);
    translate([deep-wall,wall,height-100])cube([wall,w-wall*2,100]);
    
    if (doors==1){
        %translate([deep,face_space/2,0])cube([20,w-face_space,face_h_top]);
    }
    else {
        %translate([deep,face_space/2,0])cube([20,w/2-face_space,face_h_top]);
        %translate([deep,face_space/2+w/2,0])cube([20,w/2-face_space,face_h_top]);
    }
}

module box_walls(w, deep, height){
    cube([deep,wall,height]);
    translate([0,w-wall,0]) cube([deep,wall,height]);    
}

module cooker(){
    a=290; b=370/2; r=20;
    translate([300,0,5+38])
    hull(){
        
         for(i=[-1,1]) for(j=[-1,1])
            translate([i*(370/2-r),j*(290/2-r),5])  cylinder(h=30,r=r);
    }
}

module toster(){
    translate([300,0,5+38])
    hull(){
        for(i=[-1,1]) translate([i*(250/2-140/2),0,20]) cylinder(h=160, r1=170/2, r2=150/2);
        for(i=[-1,1]) translate([i*(250/2-140/2),0,0]) cylinder(h=20, r2=170/2, r1=150/2);    
    }
}

module sockets(){
    color([1,1,1]) difference(){
        cube([6,299,86]);
        
        for(i=[0:3]) translate([2,20+48/2+70*i,86/2]) cube([48,48,48], center=true) ;
    }
    
    for (i=[0:3]) color([1,1,0.9]) translate([2,20+48/2+70*i,86/2]) in_socket();
    
    module in_socket(){
        rotate([0,90,0]) difference(){
            cube([47,47,6], center=true);
            
             cylinder(h=20,r=20);
            for(i=[-1,1]) translate([0,18/2*i,0]) cylinder(h=20, r=2, center=true);
        }
    }
}

module heater(){
    color([1,1,1])cube([170,330,550]);
    
     color([0.5,0.5,0.5]) for(i=[-1,0,1])translate([30,330/2+i*50,-60]) cylinder(h=60,r=20);
     color([1,1,1])for(i=[0,1])translate([30,330/2+i*50,-600]) cylinder(h=600,r=11);
     color([0.5,0.5,0.5])    translate([30,-185,70]) cylinder(h=100,r=20);
    
    translate([30,0,-250]) rotate([0,90,0]) color([0.5,0.5,0.5])union(){
    translate([0,330/2-50-50,0]) rotate_extrude(angle=90) translate([50,0]) circle(r=12);
    translate([0,-185+50,0]) rotate_extrude(angle=-90) translate([50,0]) circle(r=12);
    translate([50,330/2-50-50]) rotate([90,0,0]) cylinder(h=185+330/2-150, r=12);
    
    translate([00,-185]) rotate([0,-90,0]) cylinder(h=185+330/2, r=12);
    translate([00,330/2-50]) rotate([0,-90,0]) cylinder(h=185+330/2-50, r=12);
}
}

module faucet(){
    r=70;
    translate([-r,0,200])rotate([90,0,0])rotate_extrude(angle=180) translate([r,0]) circle(r=7);
    cylinder(h=200,r=9);
    
    cylinder(h=40,r=12);
    translate([30,0,0])rotate([0,-90,0])cylinder(h=85,r=12);
    translate([-55,0,25]) cube([4,12,75], center=true);
    
    translate([-r*2,0,140]) cylinder(h=50, r1=25, r2=20);
    translate([-r*2,0,160]) cylinder(h=50, r=12);
}

module drinking(){
    r=100;
    translate([-r,0,200])rotate([90,0,0])rotate_extrude(angle=180) translate([r,0]) circle(r=5);
    cylinder(h=200,r=5);
    translate([-r*2,0,0]) cylinder(h=200, r=5);
    
    cylinder(h=40,r=12);
    translate([30,0,0])rotate([0,-90,0])cylinder(h=85,r=12);
    translate([-45,0,10]) cylinder(h=45,r=5);
}

}
