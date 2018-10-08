include <d6.scad>


module d12(
	d12_size,
	d12_color="white",
	d12_lColor="black",
	d12_lHeight=1)
{
	scale([d12_size,d12_size,d12_size])
	{
		color(d12_color)
		{
			intersection()
			{
				resize([2,2,1])
					d6(1,d12_color,d12_lColor,d12_lHeight,.05);
				intersection_for(i=[0:4])
				{
					rotate([0,0,72*i])
						rotate([116.565,0,0])
							resize([2,2,1])
							d6(1,d12_color,d12_lColor,d12_lHeight,.05);
				}
			}
		}
	}
}

d12(60,d12_lHeight=.1);
