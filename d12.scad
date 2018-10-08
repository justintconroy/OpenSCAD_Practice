include <d6.scad>


module d12(
	d12_size,
	d12_color="white",
	d12_lColor="black",
	d12_lHeight=.2,
	d12_lSize=.15)
{
	d6_dieSides =[
		[0,"12",0,0,"1",0],
		[0,"9",0,0,"4",0],
		[0,"11",0,0,"2",0],
		[0,"3",0,0,"10",0],
		[0,"8",0,0,"5",0],
		[0,"7",0,0,"6",0]];

	scale([d12_size,d12_size,d12_size])
	{
		color(d12_color)
		{
			intersection()
			{
				resize([2,2,1])
					rotate([0,180,0])
					d6(1,d12_color,d12_lColor,d12_lHeight,
						d6_lSize=d12_lSize,
						d6_dieValues=d6_dieSides[0]);
				intersection_for(i=[0:4])
				{
					rotate([0,0,72*i])
						rotate([116.565,0,0])
							resize([2,2,1])
							d6(1,
								d12_color,
								d12_lColor,
								d12_lHeight,
								d12_lSize,
								d6_dieSides[i+1]);
				}
			}
		}
	}
}

//d12(30,d12_lHeight=.2);
