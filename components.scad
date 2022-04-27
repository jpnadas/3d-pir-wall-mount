module hinge(thickness=1, outer_radius = 3, body_length=10, wall_thickness=1) {
 
  
    inner_radius = outer_radius - wall_thickness;
    difference(){
        union(){
            
            cube([2 * outer_radius, body_length, thickness], center=true);
            translate([0, body_length / 2, 0])
            cylinder(r=outer_radius, h=thickness, center=true);
        }
        translate([0, body_length / 2, 0])
        cylinder(r=inner_radius, h=thickness + 1, center=true);
    }
}

hinge();