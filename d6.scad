
module d6_letter(
	letter,
	letter_size=10,
	font="Liberation Sans",
	lHeight=1)
{
	linear_extrude(height=lHeight)
	{
		text(letter, size=letter_size, font=font,
			halign="center", valign="center", $fn=16);
		
		// Add a line under 6 and 9.
		if (letter=="6" || letter=="9")
		{
			translate([-letter_size/3,-letter_size/1.9])
				square([letter_size/1.5, letter_size/16]);
		}
		
		if (letter=="six")
		{
			translate([-letter_size,-letter_size/1.4])
				square([letter_size*2.2, letter_size/6]);
		}
		
		if (letter=="nine")
		{
			translate([-letter_size*1.5,-letter_size/1.4])
				square([letter_size*3, letter_size/6]);
		}
	}
}

module d6(
	d6_size = 10,
	d6_color="white",
	d6_lColor="black",
	d6_lHeight=1,
	d6_lSize,
	d6_dieValues)
{
	lSize = d6_lSize == undef
		? d6_size * 5/6
		: d6_lSize;
	
	/*
	echo(d6_size);
	echo(d6_color);
	echo(d6_lColor);
	echo(d6_lHeight);
	echo(d6_lSize);
	echo(lSize);
	*/
	
	o = d6_size/2 - d6_lHeight/2;
	
	difference()
	{
		color(d6_color)cube(d6_size, center=true);
		color(d6_lColor)
		{
			translate([0,-o,0])
				rotate([90,0,0])
				d6_letter(
					d6_dieValues[0] == undef
						? "1"
						: d6_dieValues[0],
					lSize, lHeight=d6_lHeight);
			translate([0,0,o])
				d6_letter(
					d6_dieValues[1] == undef
						? "2"
						: d6_dieValues[1],
					lSize, lHeight=d6_lHeight);
			translate([o,0,0])
				rotate([90,90,90])
				d6_letter(
					d6_dieValues[2] == undef
						? "3"
						: d6_dieValues[2],
					lSize, lHeight=d6_lHeight);
			translate([-o,0,0])
				rotate([90,90,-90])
				d6_letter(
					d6_dieValues[3] == undef
						? "4"
						: d6_dieValues[3],
					lSize, lHeight=d6_lHeight);
			translate([0,0,-o])
				rotate([180,0,0])
				d6_letter(
					d6_dieValues[4] == undef
						? "5"
						: d6_dieValues[4],
					lSize, lHeight=d6_lHeight);
			translate([0,o,0])
				rotate([90,180,180])
				d6_letter(
					d6_dieValues[5] == undef
						? "6"
						: d6_dieValues[5],
					lSize, lHeight=d6_lHeight);
		}
	}
}
/*
// Doesn't render the die faces for some reason...
d6(20,d6_lHeight=.5,d6_lSize=19,
	d6_dieValues=
		["⚀","⚁","⚂","⚃","⚄","⚅"]);
/*
linear_extrude(1)
{
	translate([10,10,0]) text("Hello \u2680 World",font="DejaVu Sans");
	translate([30,0,0]) text("\u20AC10 \u263A");
}

// Some examples.
translate([90,0,0])
	rotate([0,180,0])
	d6(30,"blue","white",2);

/*
translate([-90,0,0])
	rotate([0,90,180])
	d6(40,"crimson","black");
translate([0,90,0])
	rotate([90,180,180])
	d6(50,"lime","yellow");
translate([0,-90,0])
	rotate([-90,-90,90])
	d6(20,"darkorange","black");
*/