include <8020/40-2555.scad>
include <8020/40-2560.scad>
include <8020/40-4302.scad>
include <8020/40-4328.scad>
include <8020/40-4332.scad>
include <8020/40-4334.scad>

G8020FAKE=true;

db40_2555();
translate([0,60,0]) db40_2560();

translate([0,-80,0]) L40_4302();
translate([0,-150,0]) ab40_4332();
translate([260,-80,0]) ab40_4334();

translate([80,-180,0]) plt40_4328();
