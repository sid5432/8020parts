include <8020/40-4040.scad>
include <8020/40-8080.scad>
include <8020/40-4080.scad>
include <8020/40-8016.scad>

// G8020OUTERONLY=true;

item40_4040(20);

translate([50,0]) item40_4080(20);

translate([140,0]) item40_8080(20);

translate([230,0]) item40_8016(20);
