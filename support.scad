use <components.scad>
use <threads.scad>
$fn = 100;

hinge_length = 7;
hinge_outer_radius = 4;
hinge_wall_thickness = 2;
hinge_inner_radius = hinge_outer_radius - hinge_wall_thickness;
hinge_thickness = 2;
hinge_separation = hinge_thickness + 0.25;

wall_plate_height = 70;
wall_plate_width = 50;
wall_plate_thickness = 2;
corner_radius = 5;

plate_height = 80;
plate_width = 50;
plate_thickness = 2;

bolt_length = hinge_thickness * 2 + hinge_separation + 5;
bolt_radius = hinge_inner_radius - 0.4;


hull(){
translate([-(wall_plate_width / 2 - corner_radius), wall_plate_height / 2 - corner_radius,0])
cylinder(r=corner_radius, h=wall_plate_thickness, center=true);
translate([wall_plate_width / 2 - corner_radius, wall_plate_height / 2 - corner_radius,0])
cylinder(r=corner_radius, h=wall_plate_thickness, center=true);
translate([-(wall_plate_width / 2 - corner_radius), -(wall_plate_height / 2 - corner_radius),0])
cylinder(r=corner_radius, h=wall_plate_thickness, center=true);
translate([wall_plate_width / 2 - corner_radius, -(wall_plate_height / 2 - corner_radius),0])
cylinder(r=corner_radius, h=wall_plate_thickness, center=true);
}

translate([hinge_separation / 2 + hinge_thickness / 2, 
           -wall_plate_height / 2 + hinge_outer_radius, 
           hinge_length / 2 - plate_thickness / 2])
rotate([90, 0, 90])
hinge(outer_radius = hinge_outer_radius, body_length=hinge_length, wall_thickness = hinge_wall_thickness, thickness=hinge_thickness);

translate([- (hinge_separation / 2 + hinge_thickness / 2), - wall_plate_height / 2 + hinge_outer_radius, hinge_length / 2 - wall_plate_thickness / 2])
rotate([90, 0, 90])
hinge(outer_radius = hinge_outer_radius, body_length=hinge_length, wall_thickness = hinge_wall_thickness, thickness=hinge_thickness);

translate([wall_plate_width / 2 + plate_width /2 + 5, 0, 0]){
hull(){
    translate([0,(plate_height - plate_width)/2,0])
    cylinder(r=plate_width/2, h=plate_thickness, center=true);
    translate([0,-(plate_height - plate_width)/2,0])
    cylinder(r=plate_width/2, h=plate_thickness, center=true);
}

translate([- hinge_separation / 2, - plate_height / 2 + hinge_outer_radius, hinge_length / 2 - plate_thickness / 2])
rotate([90, 0, 90])
hinge(outer_radius = hinge_outer_radius, body_length=hinge_length, wall_thickness = hinge_wall_thickness, thickness=hinge_thickness);
}


//%translate([bolt_length /2 ,-plate_height / 2 + hinge_outer_radius, hinge_length - hinge_wall_thickness + bolt_radius/2])
//rotate([0, -90, 0])
translate([- plate_width , 0, 0])
rotate([0, 0, 90])
MetricBoltSet(bolt_radius * 2, bolt_length);





















