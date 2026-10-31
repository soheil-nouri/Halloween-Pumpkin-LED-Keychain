// =============================================================================
// PRODUCTION-READY HALLOWEEN PUMPKIN KEYCHAIN (MICRO-ENCLOSURE)
// OpenSCAD & FreeCAD OpenSCAD Workbench Script
// =============================================================================

$fn = 70;

/* [Part Configuration] */
part = "both"; // ["both", "front", "back"]

/* [Dimensions] */
pumpkin_od        = 24.6;
pumpkin_height    = 20.0;
wall_thickness    = 1.8;
tolerance         = 0.25;
num_lobes         = 8;

/* [Stem & Loop] */
stem_r_base       = 2.2;
stem_r_top        = 1.4;
stem_height       = 3.8;
loop_od           = 6.5;
loop_id           = 3.2;
loop_width        = 2.6;

/* [Snap-Fit & Seam] */
lip_height        = 1.0;
pry_slot_w        = 4.2;
pry_slot_h        = 0.7;

/* [Face Features] */
eye_collar_od     = 5.2;
eye_collar_id     = 3.2;
eye_spacing       = 4.2;
eye_z             = 2.2;
eye_radius        = 1.9;

/* [Electronics Mounts] */
cr1220_dia        = 12.6;
switch_body_l     = 8.7;
switch_body_w     = 4.4;
switch_body_h     = 4.2;
switch_slot_l     = 5.0;
switch_slot_w     = 2.6;

module ellipsoid(rx, rz) {
    scale([rx, rx, rz])
        sphere(r = 1.0);
}

module pumpkin_solid(core_rx, core_rz, lobe_rx, lobe_rz, lobe_dist) {
    union() {
        ellipsoid(core_rx, core_rz);
        for (i = [0 : num_lobes - 1]) {
            rotate([0, 0, i * 360 / num_lobes])
                translate([lobe_dist, 0, 0])
                    ellipsoid(lobe_rx, lobe_rz);
        }
    }
}

module stem_and_loop() {
    union() {
        translate([0, 0, 9.2])
            cylinder(r1 = stem_r_base, r2 = stem_r_top, h = stem_height);
        translate([0, 0, 9.0])
            cylinder(r1 = 3.0, r2 = loop_od / 2, h = 3.5);
        translate([0, 0, 12.5])
            rotate([90, 0, 0])
                difference() {
                    cylinder(r = loop_od / 2, h = loop_width, center = true);
                    cylinder(r = loop_id / 2, h = loop_width + 2, center = true);
                }
    }
}

module full_shell() {
    difference() {
        union() {
            pumpkin_solid(9.5, 10.0, 5.5, 10.0, 6.8);
            stem_and_loop();
        }
        pumpkin_solid(7.7, 8.2, 3.7, 8.2, 5.8);
    }
}

module mouth_cutter() {
    rotate([90, 0, 0])
        linear_extrude(height = 25, center = false)
            polygon(points = [
                [-6.5, -3.0], [-5.0, -2.6], [-3.6, -2.5], [-1.8, -2.4], [0.0, -2.4],
                [1.8, -2.5], [1.8, -4.1], [3.6, -4.1], [3.6, -2.7], [5.0, -2.8], [6.5, -3.0],
                [5.0, -5.5], [2.5, -6.2], [0.0, -6.2],
                [-1.8, -6.3], [-1.8, -4.7], [-3.6, -4.7], [-3.6, -6.3], [-5.0, -5.5], [-6.5, -3.0]
            ]);
}

module nose_cutter() {
    rotate([90, 0, 0])
        linear_extrude(height = 25, center = false)
            polygon(points = [[0.0, 1.5], [1.3, -0.6], [-1.3, -0.6]]);
}

module front_cover() {
    difference() {
        union() {
            intersection() {
                full_shell();
                translate([-30, 0, -30]) cube([60, 50, 60]);
            }
            intersection() {
                translate([-30, 0, -30]) cube([60, 50, 60]);
                union() {
                    translate([-eye_spacing, 2.0, eye_z])
                        rotate([-90, 0, 0]) cylinder(r = eye_collar_od / 2, h = 6.0);
                    translate([eye_spacing, 2.0, eye_z])
                        rotate([-90, 0, 0]) cylinder(r = eye_collar_od / 2, h = 6.0);
                }
            }
        }
        intersection() {
            translate([-30, -0.1, -30]) cube([60, lip_height + tolerance + 0.1, 60]);
            pumpkin_solid(8.6 + tolerance, 9.1 + tolerance, 4.6 + tolerance, 9.1 + tolerance, 6.3);
        }
        translate([-eye_spacing, 1.0, eye_z]) rotate([-90, 0, 0]) cylinder(r = eye_collar_id / 2, h = 20);
        translate([eye_spacing, 1.0, eye_z]) rotate([-90, 0, 0]) cylinder(r = eye_collar_id / 2, h = 20);
        translate([-eye_spacing, 2.0, eye_z]) rotate([-90, 0, 0]) cylinder(r = eye_radius, h = 20);
        translate([eye_spacing, 2.0, eye_z]) rotate([-90, 0, 0]) cylinder(r = eye_radius, h = 20);
        nose_cutter();
        mouth_cutter();
        translate([-pry_slot_w / 2, -1.5, -10.0]) cube([pry_slot_w, 3.0, pry_slot_h]);
    }
}

module back_cover() {
    difference() {
        union() {
            intersection() {
                full_shell();
                translate([-30, -50, -30]) cube([60, 50, 60]);
            }
            intersection() {
                translate([-30, -1.0, -30]) cube([60, lip_height + 1.0, 60]);
                difference() {
                    pumpkin_solid(8.6, 9.1, 4.6, 9.1, 6.3);
                    pumpkin_solid(7.7, 8.2, 3.7, 8.2, 5.8);
                }
            }
            // Switch cradle outer walls
            intersection() {
                translate([-30, -50, -30]) cube([60, 50, 60]);
                difference() {
                    translate([-(switch_body_l + 2.0)/2, -3.5 - (switch_body_w + 1.6)/2, -9.5])
                        cube([switch_body_l + 2.0, switch_body_w + 1.6, 5.5]);
                    translate([-switch_body_l/2, -3.5 - switch_body_w/2, -9.0])
                        cube([switch_body_l, switch_body_w, 7.0]);
                }
            }
            // CR1220 battery guide rails & shelf
            intersection() {
                translate([-30, -50, -30]) cube([60, 50, 60]);
                union() {
                    translate([-cr1220_dia/2 - 1.2, -5.5, -6.5]) cube([1.2, 3.5, 7.0]);
                    translate([cr1220_dia/2, -5.5, -6.5]) cube([1.2, 3.5, 7.0]);
                    translate([-cr1220_dia/2 - 1.2, -5.5, -7.0]) cube([cr1220_dia + 2.4, 3.5, 1.2]);
                }
            }
        }
        // Hollow through-slot at the bottom (toggle slider access to outside)
        translate([-switch_slot_l/2, -3.5 - switch_slot_w/2, -12.0])
            cube([switch_slot_l, switch_slot_w, 5.0]);
        // Open cavity access from inside
        translate([-switch_body_l/2, -3.5 - switch_body_w/2, -9.0])
            cube([switch_body_l, switch_body_w, 6.0]);
        // Pry slot
        translate([-pry_slot_w / 2, -1.5, -10.0]) cube([pry_slot_w, 3.0, pry_slot_h]);
    }
}

if (part == "both") {
    color([1.0, 0.45, 0.0]) front_cover();
    color([0.9, 0.38, 0.0]) translate([28.0, 0, 0]) back_cover();
} else if (part == "front") {
    color([1.0, 0.45, 0.0]) front_cover();
} else if (part == "back") {
    color([0.9, 0.38, 0.0]) back_cover();
}
