include <relativity.scad>;

height = 1638;
unit = height/11.5;
eye = 1/5*unit;
inch = 25.4;
echo(unit);

skeleton()
head();

module body()
{
	head()
	attach("neck")
	chest()
	{
		attach("shoulder")
		arm()
		attach("wrist")
		hand();

		attach("waist")
		pelvis()
		attach("crotch")
		leg();
		attach("ankle")
		foot();
	}
}

module muscles()
{
	color("red")
	show("muscle")
	children();
}

module skeleton()
{
	color("white")
	hulled("ilium,pubis")
	mirrored(y)
	hulled("cranium,occiput,forehead,cheek,nose,orbital", $class="skull bone")
	hulled("jaw")

	hulled("collarbone", $class="collarbone")
	hulled("shoulderblade", $class="shoulderblade")
	hulled("ribs", $class="ribs")

	hulled("ulna", $class="ulna")
	hulled("radius", $class="radius")
	hulled("humerus", $class="humerus")

	hulled("femur", $class="femur")
	hulled("tibia", $class="tibia")
	hulled("fibula", $class="fibula")
	children();
}

module head()
{
	hide("socket")
	ball(unit, anchor=-z, $class="cranium bone")
	{
		align(-x-z)
		translate(-1/32*unit*x + 1/16*unit*z)
		ball(1/2*unit, anchor=-x-z, $class="occiput");

		align(-x-z)
		translate(1/16*unit*y)
		ball(3/4*unit, anchor=-x-z, $class="occiput");

		align(z)
		translate(1/8*unit*x)
		ball([1,3/4,1]*unit, anchor=z, $class="forehead");

		align(x)
		translate(1/2*eye*x+1/12*unit*y+1/2*eye*z)
		ball(2/3*unit, anchor=x, $class="forehead");

		align(x)
		ball(1.5*eye, anchor=z, $class="orbit")
		{
			ball(7/4*eye, $class="arch");

			ball(3/2*eye, anchor=-x, $class="socket")
			ball(3/2*eye, anchor=-y);

			ball(eye, $class="eye");
		}

		align(-z)
		translated(1/5*unit*x)
		box([infinitesimal, 3*eye, eye], anchor=-x+z, $class="jaw")
		{
			align(y+z, $class="cheek")
			ball(3/2*eye, anchor=-z)
			align(x)
			ball(1*eye, anchor=center)
			align(x)
			ball(1/2*eye, anchor=center)
			align(z)
			ball(1/2*eye, anchor=center);

			translate(1/2*unit*x)
			{
				ball(d=1/3*unit, anchor=x)
				{
					align(x+z)
					ball(eye, anchor=x-z, $class="nose")
					{
						align(y)
						ball(1/2*eye, anchor=z);

						align(x)
						ball(1/2*eye, anchor=center);
					}

					translate(-eye*z)
					ball(d=1/2*eye, anchor=-x-y+z);
				}
			}
		}

		align(-z, $class="neck")
		children();
	}
}

module chest()
{
	rod(d=1/3*unit, h=unit, $class="cervical bone")
	{
		align(-x-z)
		translate(-unit/2*z)
		{
			// back
			ball(unit, anchor=-y+z, $class="ribs bone")
			align(-x-z)
			box(1/6*unit, anchor=-x-y, $class="shoulderblade");

			translate(3/2*unit*y)
			box(1/6*unit, anchor=x+y-z, $class="shoulderblade")
			{
				align(x-y+z)
				ball(1/6*unit, anchor=-x+y, $class="collarbone");

				align(x-z, $class="shoulder")
				children();
			}
		}

		// center

		align(-z, $class="ribs bone")
		ball(unit)
		{
			// front
			align(x-z)
			ball(unit, anchor=z)
			ball(unit, anchor=-y)
			ball(unit, anchor=z);

			//bottom center
			align(-z)
			ball(unit)
			align(-z, $class="waist")
			children();

			align(x)
			translate(1/6*unit*y)
			ball(1/6*unit, anchor=-y-z, $class="collarbone");

			align(-x+y)
			box(1/6*unit, anchor=-y, $class="shoulderblade");
		}
	}
}

module pelvis()
{
	rod(d=1/3*unit, h=unit, anchor=-x+z, $class="lumbar bone")
	{
		align(-y-z)
		ball(unit, anchor=-y+z, $class="ilium bone");

		align(-z)
		ball(unit, anchor=z, $class="ilium bone")
		{
			translate(1/4*unit*(-x-z))
			ball(unit, anchor=center, $class="coccyx");

			align(-z, $class="crotch")
			children();
		}
	}
}

module leg()
{
	femur()
	align(y-z)
	tibia();
}

module femur()
{
	ball(d=1/2*unit, anchor=-x-y+z, $class="pubis")
	{
		align(-x+y)
		ball(d=1/4*unit, anchor=-y, $class="condyle")
		ball(d=1/2*unit, anchor=-y+z, $class="condyle")
		{
			ball(d=1/4*unit, $class="femur");
		}
	}

	translate(2.5*unit*down)
	translate(1*inch*y)
	ball(d=1/4*unit, anchor=-y+z, $class="condyle bone")
	{
		align(y)
		ball(d=1/4*unit, anchor=-y, $class="femur bone");

		align(x+y)
		ball(d=1/4*unit, anchor=x, $class="femur bone");

		children();
	}
}

module tibia()
{
	ball(d=1/2*unit, anchor=z, $class="condyle bone")
	{
		align(-x+y)
		ball(d=1/6*unit, anchor=-x+y, $class="fibula bone");

		align(x)
		ball(d=1/4*unit, anchor=x, $class="tibia bone")
		align(z)
		translate(2.5*unit*down)
		ball(d=1/4*unit, anchor=-z, $class="tibia bone")
		{
			align(-x+y)
			ball(d=1/6*unit, anchor=center, $class="fibula bone");
		}
	}
	children();
}

module arm()
{
	humerus()
	align(y)
	ulna();
}

module humerus()
{
	ball(d=1/4*unit, anchor=center, $class="humerus bone");

	translate(2*unit*y)
	ball(d=1/4*unit, anchor=center, $class="humerus bone")
	{
		ball(d=1/4*unit, anchor=z, $class="condyle bone");
		ball(d=1/4*unit, anchor=-z, $class="condyle bone");
		children();
	}
}

module ulna()
{
	ball(d=1/4*unit, anchor=-y+z, $class="ulna bone");
	ball(d=1/8*unit, anchor=-y-z, $class="radius bone");

	translate(1.75*unit*y)
	{
		ball(d=1/8*unit, anchor=y-z, $class="radius bone wrist");
		children();

		// hand
		ball(d=1/8*unit, anchor=y+z, $class="ulna bone");
	}
}
