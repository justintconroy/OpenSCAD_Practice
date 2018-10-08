font = "Liberation Sans";

cube_size = 60;
letter_size = 50;
letter_height = 1;

o = cube_size/2 - letter_height/2;

module letter(l)
{
	linear_extrude(height=letter_height)
	{
		text(l, size=letter_size, font=font,
				halign="center", valign="center", $fn=16);
	}
}

difference()
{
	color("white")cube(cube_size, center=true);
	color("black")
	{
		translate([0,-o,0])rotate([90,0,0])letter("1");
		translate([o,0,0])rotate([90,0,90])letter("2");
		translate([0,o,0])rotate([90,0,180])letter("3");
		translate([-o,0,0])rotate([90,0,-90])letter("4");
		translate([0,0,o])letter("5");
		translate([0,0,-o - letter_height])letter("6");
	}
}
