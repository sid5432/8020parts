/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = true;
 
module plt40_4350() {
  if ( G8020FAKE ) {
     plt40_4350_simple();
  }else{
     plt40_4350_real();  
  }
}

module plt40_4350_simple() {
  A = 120;
  B = 80;
  C = 40;
  D = 20;
  E = 8.3;
  F = 6;
  G = 40;
  H = 40;

  r = 2;

  linear_extrude(height=F)
  polygon(points=[[0,0],[B,0],[B,G],[H,A],[0,A]]);
}

module plt40_4350_real() {
  A = 120;
  B = 80;
  C = 40;
  D = 20;
  E = 8.3;
  F = 6;
  G = 40;
  H = 40;

  r = 2;

  difference() {
  linear_extrude(height=F)
  offset(r) offset(-r)
  polygon(points=[[0,0],[B,0],[B,G],[H,A],[0,A]]);
  
  group() {
    translate([D,D,-F]) cylinder(r=E/2,h=F*3);
    translate([D+C,D,-F]) cylinder(r=E/2,h=F*3);
    
    translate([D,D+C,-F]) cylinder(r=E/2,h=F*3);
    
    translate([D,D+2*C,-F]) cylinder(r=E/2,h=F*3);
  }
  }
}

if ( G8020DEBUG ) {
   plt40_4350();
}
