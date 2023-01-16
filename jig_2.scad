$fn=60;

function add(v, i = 0, r = 0) = i < len(v) ? add(v, i + 1, r + v[i]) : r;

w=18;

offsets=[37,32,32,32,32,32];
L=add(offsets)+offsets[0]; //37+32+32+20;

holeX = [ for (a=0, b=offsets[0]; a < len(offsets); a= a+1, b=b+offsets[a]) b];
echo(cumsum);

//offset=[37,

difference(){
    union(){
        {
            translate([0,-w*2+3,0])cube([L,w*3+5,3.5]);
            //translate([0,16,0]) cube([L,5,15]);
            
            translate([0,w,0]) cube([25,8,25]);
            translate([L-25,w,0]) cube([25,8,25]);
            translate([L/2-25/2,w,0]) cube([25,8,25]);
            translate([L/2,w,18]) rotate([0,45,0]) translate([-25/2,0,-25/2])cube([25,8,25]);
        }
    }
    
    for(i=[0:5]) translate([holeX[i],w/2,-1]) {
        cylinder(h=12,r=6);
        holes();
    }
        

}

module holes(){
    for (i=[0:2]) rotate(-i*90) translate([10,0,0]) cylinder(h=12,r=1.7);
        
}
