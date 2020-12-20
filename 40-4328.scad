/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;
 
module plt40_4328() {
  if ( G8020FAKE ) {
     plt40_4328_simple();
  }else{
     plt40_4328_real();  
  }
}

module plt40_4328_simple() {
  A = 160;
  B = 160;
  C = 40;
  D = 20;
  E = 8.3;
  F = 6;
  G = 80;
  H = 80;

  r = 2;

  linear_extrude(height=F)
  polygon(points=[[0,0],[B,0],[B,G],[H,A],[0,A]]);
}

module plt40_4328_real() {
  A = 160;
  B = 160;
  C = 40;
  D = 20;
  E = 8.3;
  F = 6;
  G = 80;
  H = 80;
  
  r = 2;
  
  difference() {
  linear_extrude(height=F)
  offset(r) offset(-r)
  polygon(points=[[0,0],[B,0],[B,G],[H,A],[0,A]]);
  
  group() {
    translate([D,D,-F]) cylinder(r=E/2,h=F*3);
    translate([D+C,D,-F]) cylinder(r=E/2,h=F*3);
    translate([D+2*C,D,-F]) cylinder(r=E/2,h=F*3);
    translate([D+3*C,D,-F]) cylinder(r=E/2,h=F*3);
    
    translate([D,D+C,-F]) cylinder(r=E/2,h=F*3);
    translate([D+C,D+C,-F]) cylinder(r=E/2,h=F*3);
    translate([D+2*C,D+C,-F]) cylinder(r=E/2,h=F*3);
    translate([D+3*C,D+C,-F]) cylinder(r=E/2,h=F*3);
    
    translate([D,D+2*C,-F]) cylinder(r=E/2,h=F*3);
    translate([D+C,D+2*C,-F]) cylinder(r=E/2,h=F*3);
    
    translate([D,D+3*C,-F]) cylinder(r=E/2,h=F*3);
    translate([D+C,D+3*C,-F]) cylinder(r=E/2,h=F*3);
  }
  }
}

if ( G8020DEBUG ) {
   plt40_4328();
}
