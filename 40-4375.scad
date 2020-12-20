/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

module L40_4375() {
  if ( G8020FAKE ) {
    L40_4375_simple();
  }else{
    L40_4375_real();
  }
}

module L40_4375_simple() {
  A = 80;
  B = 40;
  C = 6;
  G = 76;

  translate([0,0,40-G/2]) {
    cube([C,A,G]);
    cube([B,C,G]);
  }  
}

module L40_4375_real() {
  A = 80;
  B = 40;
  C = 6;
  D = 20;
  E = 18;
  F = 40;
  G = 76;
  H = 8.3;
  
  C2 = C*2;
  
  translate([0,0,40-G/2])
  difference() 
  {
  group() {
  intersection() {
    translate([B-C,0,0]) cube([C,C,G]);
    translate([B-C,0,0]) cylinder(r=C, h=G);
  }

  intersection() 
  {
    translate([0,A-C,0]) cube([C,C,G]);
    translate([0,A-C,0]) cylinder(r=C, h=G);
  }
  
  difference() {
    cube([C2,C2,G]);
    translate([C2,C2,-G*0.1]) cylinder(r=C, h=G*1.2);
  }
  
  translate([C2,0,0]) cube([B-3*C,C,G]);
  translate([0,C2,0]) cube([C,A-3*C,G]);
  }
  
  group() {
  translate([D,C2,E]) rotate([90,0,0]) cylinder(r=H/2,h=C*3);
  translate([D,C2,E+F]) rotate([90,0,0]) cylinder(r=H/2,h=C*3);
  
  translate([-C,D,E]) rotate([0,90,0]) cylinder(r=H/2,h=C*3);
  translate([-C,D,E+F]) rotate([0,90,0]) cylinder(r=H/2,h=C*3);
  
  translate([-C,D+F,E]) rotate([0,90,0]) cylinder(r=H/2,h=C*3);
  translate([-C,D+F,E+F]) rotate([0,90,0]) cylinder(r=H/2,h=C*3);
  }
  
  }
}

if ( G8020DEBUG ) {
   L40_4375();
}
