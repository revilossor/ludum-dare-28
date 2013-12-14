package states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class DeathState extends FlxState
	{
		
		public function DeathState() { }
		override public function update():void
		{
			super.update();
			keyHandling();
		}
		private function keyHandling():void
		{
			if (FlxG.keys.justReleased("SPACE")) {
				FlxG.fade(0xff000000, 1, gotoMenu);
			}
		}
		private function gotoMenu():void
		{
			FlxG.switchState(new MenuState());
		}
		
	}

}