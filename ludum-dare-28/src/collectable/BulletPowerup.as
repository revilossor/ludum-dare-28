package collectable 
{
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class BulletPowerup extends Powerup
	{
		
		public function BulletPowerup(xp:int, yp:int) 
		{
			super(xp, yp);
			loadGraphic(Res.bullet, false, false, 4, 4);
		}
		
	}

}