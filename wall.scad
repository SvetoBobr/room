$fn=20;
// 241 do okna
// 248 visota
// 86 - podokonnik
W=225;
H=248;

w=86;

echo (200-S*4);

S=241/5;

//scale(10)
room();
//projection(cut = true)
// translate([0,0,-0.3]) rotate([90,0,0]) plate2();

module room(){
difference(){
    wall();
    translate([241,-1,0])  cube([78,5,200]);
}

translate([0,0,w-4.5])cube([19,W,4.5]);

for(i=[0:2]) translate([100+30*i,0,H-5.5])
    color([1,1,1])cube([11,W,5.5]);

%cube([18,W,86-2]);

bh=55;
mh=6;

%translate([18,0,0])cube([200,W,bh]);
translate([18,0,50+1.5]) color([1,0.7,1]) cube([200,W,mh]);  // матрас
translate([18+200,0,bh-19])  cube([4.5,W,19]);
}

module wall(){
    translate([0,0,200-S*4])  for (i=[0:4]) for (j=[0:6])
        translate([S*j, 0, S*i])
            plate();
    
    cube([S*7, 2.4, 9.6]);
    
    translate([0,0,H-14.6]) cube([S*7, 2.4, 14.6]);
}


module plate(size=S){
    faska=0.1;
    
    difference(){
        union(){
            cube([size, 0.2, size]);
            color([1,1,0.9]) translate([faska,0,faska]) 
                cube([size-faska*2,0.4, size-faska*2]);
        }
        
        N=4;
        sh=2;
        a=S-sh*2;
        for(i=[0:N-1]) {
            translate([a/(N-1)*i+sh,0,sh]) bolt();
            translate([a/(N-1)*i+sh,0,size-sh]) bolt();
        }
        for(i=[1:N-2]) {
            translate([sh,0,a/(N-1)*i+sh]) bolt();
            translate([size-sh,0,a/(N-1)*i+sh]) bolt();
        }       
    }
}
module plate2(size=S){
    size2=78;
    faska=0.1;
    
    difference(){
        union(){
            cube([size, 0.2, size2]);
            color([1,1,0.9]) translate([faska,0,faska]) 
                cube([size-faska*2,0.4, size2-faska*2]);
        }
        
        N=4;
        sh=2;
        a=S-sh*2;
        for(i=[0:N-1]) {
            translate([a/(N-1)*i+sh,0,sh]) bolt();
            translate([a/(N-1)*i+sh,0,size2-sh]) bolt();
        }
        for(i=[1:N]) {
            a=S-sh*2+0.5;
            translate([sh,0,a/(N-1)*i+sh]) bolt();
            translate([size-sh,0,a/(N-1)*i+sh]) bolt();
        }       
    }
}
module bolt(){
    rotate([90,0,0]) translate([0,0,-1])cylinder(h=8, r=0.2);
    rotate([-90,0,0]) translate([0,0,0.3])cylinder(h=8, r=0.6);
}