package hazard 
{
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Spike extends Hazard
	{
		
		public function Spike(xp:uint, yp:uint) 
		{
			super(xp, yp);
			loadGraphic(Res.spike, false, false, 4, 5);
			immovable = true;		
		}
		
	}

}