/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */
include <ab4holes.scad>

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

module ab40_4334() {
  if ( G8020FAKE ) {
     ab40_4334_simple();
  }else{
     ab40_4334_real();
  }
}

module ab40_4334_simple() {
    A = 40;
    B = 40;
    F = 76;
    offset = (80-F)/2;
    translate([0,0,offset])
    linear_extrude(height=F) {
      polygon(points=[[0,0],[A,0],[0,B]]);
    }
}

module ab40_4334_real() {
        
    // parameters
    bev = 4;
    A0 = 40;
    B0 = 40;
    C = 6;
    D = 40;
    E = 20;
    F = 76;
    G = 18;
    H = 20;
    J = 8.3;
    
    hole_r = J/2; // hole radius
    hole_2 = E/2; // hole radius
    
    // adjustment; assuming A = B
    at = sqrt(2) - 1.0; // tan(22.5 deg)
    
    adj0 = bev/A0*( 1.0/at - 1 );
    adj = 1/(1 - adj0);
    
    A = A0 * adj;
    B = B0 * adj;
    
    hyp = sqrt(A*A+B*B);
    Ain = A - C - C*(hyp/B + A/hyp);
    Bin = B - C - C*(hyp/A + B/hyp);
    
    offset = (80 - F)/2;
    translate([0,0,offset])
    // color([1,0,0])
    difference() {
        tri_out(bev,A,B,F);
        union() {
	translate([C,C,-10]) tri_in(Ain,Bin,F);
	
	translate([H,-2,G]) hole_y(hole_r,A/4);
	translate([H,C+1,G]) hole_y(hole_2,A);

	translate([H,-2,G+D]) hole_y(hole_r,A/4);
	translate([H,C+1,G+D]) hole_y(hole_2,A);

	translate([-2 ,H,G]) hole_x(hole_r,A/4);
	translate([C+1,H,G]) hole_x(hole_2,A);
	
	translate([-2 ,H,G+D]) hole_x(hole_r,A/4);
	translate([C+1,H,G+D]) hole_x(hole_2,A);
      }
    }
}

if ( G8020DEBUG ) {
   ab40_4334();
}
