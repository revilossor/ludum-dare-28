package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Bullet extends FlxSprite
	{
		private var _duration:uint;

		public function Bullet() 
		{
			makeGraphic(4, 4, 0xffffec00);
			visible = false;
		}
		override public function update():void
		{
			if (visible) {
			
			}else {
				x = -99; y = -99;
			}
		}
		
	}

}