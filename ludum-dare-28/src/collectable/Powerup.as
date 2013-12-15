package collectable
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Powerup extends FlxSprite
	{
		
		public function Powerup(xp:int, yp:int) 
		{
			super(xp, yp);
			makeGraphic(16, 16, 0xffff00ff);
		}
		override public function update():void
		{
			super.update();
		}
	}

}