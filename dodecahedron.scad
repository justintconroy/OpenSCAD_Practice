module dodecahedron(height)
{
	scale([height,height,height])
	{
		intersection()
		{
			cube([2,2,1], center=true);
			intersection_for(i=[0:4])
			{
				rotate([0,0,72*i])
					rotate([116.565,0,0])
					cube([2,2,1], center=true);
			}
		}
	}
}

translate([0,0,2])dodecahedron(1);
dodecahedron(2);
translate([0,0,-4])dodecahedron(4);