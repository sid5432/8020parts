
module profile40_2415() {
polygon( points=[
[0.0,140.0],[2.0,139.0],[5.0,136.0],[6.0,133.0],[6.0,20.0],[7.0,17.0],[8.0,15.0],[10.0,13.0],[13.0,12.0],[20.0,11.0],[40.0,8.0],[50.0,6.0],[53.0,5.0],[54.0,4.0],[55.0,3.0],[56.0,0.0],[0.0,0.0]]
);
}


module fm40_2415() {
    A = 60;
    B = 20;
    C = 40;
    D = 20;
    // E = 40;
    F = 8.33;
    G = 36;
    H = 20;
    // J = 40;
    K = 13.49;
    L = 8;
    M = 28;
    N = 6;
    P = 140;
    Q = 56;
    
    module hole1() {
       rotate([0,90,0]) cylinder(r=F/2,h=N*5);
    }
    module hole2() {
       rotate([90,0,0]) cylinder(r=F/2,h=N*5);
       rotate([-90,0,0]) cylinder(r=M/2,h=N*5);
    }
    
    difference() {
       linear_extrude(height=C)
       profile40_2415();
       
       union() {
          translate([-N,P-B,D]) hole1();
	  // translate([-N,P-B,D+E]) hole1();
	  
	  translate([-N,P-A,D]) hole1();
	  // translate([-N,P-A,D+E]) hole1();
	  
	  translate([G,L,H]) hole2();
	  // translate([G,L,H+J]) hole2();
       }
    }
    
    
}


// fm40_2415();

    
