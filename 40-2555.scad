/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */
include <8020/40-4040.scad>

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

module db40_2555() {
  clen = 640;
  cbx = clen/sqrt(2);
  
  translate([0,40,0]) rotate([0,-90,180])
    union() {
    multmatrix( m = [
                     [1, 0, 0, 0],
                     [0, 1, 0, 0],
                     [1, 0, 1, 0],
                     [0, 0, 0, 1],
                     ]) item40_4040(clen/1.5);
    multmatrix( m = [
                     [ 1, 0, 0, 0],
                     [ 0, 1, 0, 0],
                     [-1, 0, 1, clen/2],
                     [ 0, 0, 0, 1],
                     ]) item40_4040(clen/2);
  }
}

if ( G8020DEBUG ) {
     translate([0,-40,0])
     db40_2555();
}

