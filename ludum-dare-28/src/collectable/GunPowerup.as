package collectable 
{
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class GunPowerup extends Powerup
	{
		
		public function GunPowerup(xp:int, yp:int) 
		{
			super(xp, yp);
			loadGraphic(Res.collectable_map_tiles_16x16, true, false, 16, 16);
			addAnimation("idle", [1]);
			play("idle");
		}
		
	}

}