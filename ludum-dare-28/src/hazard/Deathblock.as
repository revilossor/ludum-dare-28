package hazard 
{
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Deathblock extends Hazard
	{
		
		public function Deathblock(xp:uint, yp:uint) 
		{
			super(xp, yp);
			loadGraphic(Res.dethblock, false, false, 32, 32);
			immovable = true;
		}
		
	}

}