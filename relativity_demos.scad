include <relativity.scad>;

module branch(n)
{
	if(n>0)
	{
		align(top)
		rotate([0,0,90])
		mirrored([1,0,0])
		rotate([0,15,0])
		scale([0.8,0.8,0.8])
		parent(anchor=bottom)
		branch(n-1);
	}
}

module tree(n=5)
{
	color("brown")
	rod(d=20,h=100,anchor=bottom)
		branch(n);
}

module stacked_rods()
{
	colored("red", "mid")
	colored("white")
	rod(50,anchor=bottom)
		colored("green")
		align(top) rod($parent_size*.8, $class="mid")
		align(top) rod($parent_size*.8, $class="top");
}

module csg_ex()
{
	colored("blue","parent child,B grandchild")
	ball(50, $class="parent")
	{
		align(x) ball(40, $class="child A")
			align(x) ball(30, $class="grandchild");

		align(z) ball(40, $class="child B")
			align(z) ball(30, $class="grandchild");

		align(-x) ball(40, $class="child C")
			align(-x) ball(30, $class="grandchild");
	}
}
//csg_ex();

module stepper_demo()
{
	differed("negative","positive")
	box(42,anchor=bottom, $class="motor positive")
	{
		align([-y,y])
		align([-x,x])
		rotate(45*z)
		box([5,5,indeterminate], $class="negative", anchor=center)
		box([10,10,20], anchor=center);

		align(top)
		{
			// Rotor
			rod(d=35, h=0.25, anchor=$outward, $class="negative")
			align(bottom)
			rod(d=22,h=2, anchor=$outward, $class="motor rotor positive")
			{
				children();
				// shaft
				align(top)
				rod(d=5,h=10)

					// gear
					align(top)
					translate(2*up)
					differed("negative", "positive")
					rod(d=15,h=8, anchor=$outward)
					{
						// rod hole
						rod(d=5,$class="negative");

						// gear teeth
						align(bottom)
						rod(d=17,h=1);

						rotated(360/20*z, [1:20])
						align(x)
						align(bottom)
						rod(d=1.75, anchor=$outward, $class="negative");
					}

			}

			// Screws
			translated(31*y,[-1,1]/2)
			translated(31*x,[-1,1]/2)
			rod(d=3,h=7, $class="motor screw positive")
			{

				children();
				align(top)
				// Screw heads
				differed("negative", "positive")
					// Rounded top
					hulled("positive")
						rod(d=6,h=1.5)
						align(top) rod(d=5,h=1)
					// Drive
					align(top) rotated(90*z,[0,1])
						box([4,1,1], anchor=top, $class="negative");

			}
		}
	}
}

module motor(){
    box(42, $class="motor")
    align(top)
    {
        rod(d=22,h=10, $class="motor rotor")
        children();

        translated(31*y, [-1,1]/2) 
        translated(31*x, [-1,1]/2) 
        rod(d=3,h=10, $class="motor screw")
        children();
    }
}

differed("motor")
hulled("wrapper")
stepper_demo()
{
	attach("rotor") rod(d=30,h=10, $class="wrapper");
	attach("screw") rod(d=10,h=10, $class="wrapper");
}
