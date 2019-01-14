include <MCAD/involute_gears.scad>;

teeth=27;
circles=8;
twist=200;
height=20;

		gear (number_of_teeth=teeth,
			circular_pitch=700,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.2,
			hub_diameter=15,
			bore_diameter=5,
			circles=circles,
			twist=twist/teeth);
			
			
translate([ 0.00, 0.00, 30.00 ]
  test_double_helix_gear();