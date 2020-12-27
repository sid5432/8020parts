/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */

G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

COVERS_14104 = false;

module ab_14104() {
     if ( G8020FAKE ) {
          ab_14104_simple();
     }else{
          ab_14104_real();
     }

     if (COVERS_14104) {
          color([0.5,0.5,0.5]) cov12039();
     }  
}

module ab_14104_simple() {
     A = 76;
     B = 76;
     L = 74;

     roffset = (80-L)/2;
     translate([0,0,roffset])
          linear_extrude(height=L,center=false) {
          polygon(points=[[0,0],[B,0],[0,A]]);
     }
}

module ab_14104_real() {
     A = 76;
     B = 76;
     C = 2.0;
     D = 25.25;
     E = 17.0;
     F = 40.0;
     G = 21.5;
     H = 3.5;
     J = 8.7;
     K = 29.5;
     L = 74;
     M = 8.0;
     N = 40.0;
  
     bev = 1.0;
     wallt = 8.7; // not given in catalog
     roffset = (80-L)/2;
     G2 = G/sqrt(2.0);

     hoffset = D-G/2-wallt;
  
     module wall14104(H) {
          linear_extrude(height=H,center=false) {
               polygon(points=[[0,0],[B-bev,0],[B,bev],[bev,A],[0,A-bev]]);
          }
     }
  
     module base14104(th) {
          linear_extrude(height=th,center=false) {
               polygon(points=[[0,0],[B-bev,0],[B,bev],
                               [B-wallt+bev,wallt],
                               [wallt,wallt],
                               [wallt,A-wallt+bev],
                               [bev,A],[0,A-bev]]);
          }
     }
  
     module slots() {
          color([0,1,0])
               rotate([0,0,45]) cube([A,G2,J]);
     }

     module holes1() {
          translate([0,hoffset,E-J/2+roffset]) slots();
          translate([0,hoffset+K,E-J/2+roffset]) slots();
    
          translate([0,hoffset,E-J/2+roffset+F]) slots();
          translate([0,hoffset+K,E-J/2+roffset+F]) slots();
     }

     if ( G8020OUTERONLY && COVERS_14104 ) {
          translate([0,0,roffset]) wall14104(L);
     }else{
  
          difference() {
               union() {
                    translate([0,0,roffset]) wall14104(H);
                    translate([0,0,80-H-roffset]) wall14104(H);
                    translate([0,0,roffset]) base14104(L);
               }
               union() {
                    holes1();
                    mirror([1,-1,0]) holes1();
               }
          }

     }
}

module cov12039() {
     A = 76;
     B = 76;
     L = 74;
     plt = 2;
     bev = 1;
     A1 = A-bev;
     B1 = B-bev;
     W  = sqrt(A1*A1 + B1*B1);
  
     roffset = (80-L)/2;
     b2 = bev/sqrt(2);

     translate([B,bev,roffset])
          rotate([0,0,45]) cube([plt,W,L]);
}

if ( G8020DEBUG ) {
     ab_14104();
}



