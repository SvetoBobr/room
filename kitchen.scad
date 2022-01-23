kitchen();

module kitchen(){

wall=16;


height=878;
th=38;

deep=500;

W=800+600+500+300;

translate([-80,0,height]) color([0.8,0.8,0.5]) cube([600,W,th]);
xcenter=deep/2-35;
ysinkcenter=800/2-50;

face_h=720;
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
translate([100-80,0,1460]) top_box(w=800, doors=2);
translate([100-80,800,1460]) top_box(w=600, doors=2);
translate([100-80,600+800,1460]) top_box(w=400, doors=1);
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
translate([xcenter,ysinkcenter,height-180-360+th-5]) color([0.2,0.1,0.1]) cylinder(h=360,r=110);

// bin
binw=282;
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

// cook box
translate([0,800,0]) color([0.9,1,1]){
box_walls(600);
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
    height=700;
    box_walls(w, 300, height);
    translate([0,wall,level])cube([deep,w-wall*2,wall]);    // bottom
    translate([0,wall,level+200])cube([wall,w-wall*2,300]);
    translate([deep-wall,wall,height-100])cube([wall,w-wall*2,100]);
    
    if (doors==1){
        %translate([deep,face_space/2,height-face_h-face_space])cube([20,w-face_space,face_h]);
    }
    else {
        %translate([deep,face_space/2,height-face_h-face_space])cube([20,w/2-face_space,face_h]);
        %translate([deep,face_space/2+w/2,height-face_h-face_space])cube([20,w/2-face_space,face_h]);
    }
}

module box_walls(w, deep, height){
    cube([deep,wall,height]);
    translate([0,w-wall,0])cube([deep,wall,height]);    
}

}