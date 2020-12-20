/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

module L40_4302() {
  if ( G8020FAKE ) {
    L40_4302_simple();
  }else{
    L40_4302_real();
  }
}

module L40_4302_simple() {
  A = 40;
  B = 40;
  C = 6;
  F = 36;

  translate([0,0,20-F/2]) {
    cube([C,A,F]);
    cube([B,C,F]);
  }
}

module L40_4302_real() {

  A = 40;
  B = 40;
  C = 6;
  D = 20;
  E = 18;
  F = 36;
  G = 8.3;
  
  C2 = C*2;
  
  translate([0,0,20-F/2])
  difference() {
  group() {
  intersection() {
    translate([B-C,0,0]) cube([C,C,F]);
    translate([B-C,0,0]) cylinder(r=C, h=F);
  }

  intersection() 
  {
    translate([0,A-C,0]) cube([C,C,F]);
    translate([0,A-C,0]) cylinder(r=C, h=F);
  }
  
  difference() {
    cube([C2,C2,F]);
    translate([C2,C2,-F*0.1]) cylinder(r=C, h=F*1.2);
  }
  
  translate([C2,0,0]) cube([B-3*C,C,F]);
  translate([0,C2,0]) cube([C,A-3*C,F]);
  }
  
  group() {
  translate([D,C2,E]) rotate([90,0,0]) cylinder(r=G/2,h=C*3);
  translate([-C,D,E]) rotate([0,90,0]) cylinder(r=G/2,h=C*3);
  }
  
  }
}

if ( G8020DEBUG ) {
  L40_4302();
 }
