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

module ab40_4338() {
  if ( G8020FAKE ) {
     ab40_4338_simple();
  }else{
     ab40_4338_real();
  }
}

module ab40_4338_simple() {
    A = 80;
    B = 80;
    F = 76;
    offset = (80-F)/2;
    translate([0,0,offset])
    linear_extrude(height=F) {
      polygon(points=[[0,0],[A,0],[0,B]]);
    }
}

module ab40_4338_real() {
        
    // parameters
    bev = 4;
    A0 = 80;
    B0 = 80;
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
    
    off1 = (F - D)/2;
    offset = (80-F)/2;
    
    translate([0,0,offset])
    difference() {
        tri_out(bev,A,B,F);
        union() {
	translate([C,C,-10]) tri_in(Ain,Bin,F);
	
	translate([H,-2,off1+D]) hole_y(hole_r,A/4);
	translate([H+D,-2,off1]) hole_y(hole_r,A/8);
	
	translate([H,-2,off1]) hole_y(hole_r,A/4);
	translate([H+D,-2,off1+D]) hole_y(hole_r,A/8);
	
	translate([H,C+1,off1]) hole_y(hole_2,A);
	translate([H+D,C+1,off1]) hole_y(hole_2,A);

	translate([H,C+1,off1+D]) hole_y(hole_2,A);
	translate([H+D,C+1,off1+D]) hole_y(hole_2,A);

	translate([-2,H,off1]) hole_x(hole_r,A/4);
	translate([-2,H+D,off1]) hole_x(hole_r,A/8);

	translate([-2,H,off1+D]) hole_x(hole_r,A/4);
	translate([-2,H+D,off1+D]) hole_x(hole_r,A/8);

	translate([C+1,H,off1]) hole_x(hole_2,A);
	translate([C+1,H+D,off1]) hole_x(hole_2,A);
	
	translate([C+1,H,off1+D]) hole_x(hole_2,A);
	translate([C+1,H+D,off1+D]) hole_x(hole_2,A);
      }
    }
}

if ( G8020DEBUG ) {
   ab40_4338();
}
