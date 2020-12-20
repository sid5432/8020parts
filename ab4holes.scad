module hole_x(hole_r,LL) {
  rotate([0,90,0]) cylinder(r=hole_r,h=LL);
}

module hole_y(hole_r,LL) {
  rotate([-90,0,0])
  cylinder(r=hole_r,h=LL);
}

module tri_out(bev,A,B,F) {
   linear_extrude(height=F)
     offset(bev) offset(-bev)
   polygon(points=[[0,0],[A,0],[0,B]]);

}

module tri_in(Ain,Bin,F) {
   linear_extrude(height=F+20)
   // translate([C,C,0])
   polygon(points=[[0,0],[Ain,0],[0,Bin]]);

}

