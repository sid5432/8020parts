/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */
G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

include <ab4holes.scad>

module ab30_4336() {
  if ( G8020FAKE ) {
    ab30_4336_simple();
  }else{
    ab30_4336_real();
  }
}

module ab30_4336_simple() {
    A = 60;
    B = 60;
    F = 27;
    linear_extrude(height=F) {
      polygon(points=[[0,0],[A,0],[0,B]]);
    }
}

module ab30_4336_real() {
    // parameters
    bev = 4;
    A0 = 60;
    B0 = 60;
    C = 4;
    D = 13.5;
    E = 12.7;
    F = 27;
    G = 15;
    H = 30;
    J = 6.81;
    
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
    
    offset = (30-F)/2;
    
    translate([0,0,offset])
    difference() {
      tri_out(bev,A,B,F);
        union() {
	translate([C,C,-10]) tri_in(Ain,Bin,F);
	translate([B0-G-H,-2,D]) hole_y(hole_r,A/4);
	translate([B0-G,-2,D]) hole_y(hole_r,A/8);
	
	translate([B0-G-H,C+1,D]) hole_y(hole_2,A);
	translate([B0-G,C+1,D]) hole_y(hole_2,A);
	
	translate([-2,A0-G-H,D]) hole_x(hole_r,A/4);
	translate([-2,A0-G,D]) hole_x(hole_r,A/8);
	
	translate([C+1,A0-G-H,D]) hole_x(hole_2,A);
	translate([C+1,A0-G,D]) hole_x(hole_2,A);
      }
    }
}


if ( G8020DEBUG ) {
  ab30_4336();
 }
