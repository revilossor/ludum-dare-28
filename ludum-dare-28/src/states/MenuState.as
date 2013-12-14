package states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class MenuState extends FlxState
	{
		
		public function MenuState() 
		{}
		override public function create():void
		{
			super.create();
			FlxG.bgColor = 0xffff0000;
			FlxG.gameData = new GameData();
		}
		override public function update():void
		{
			super.update();
			keyHandling();
		}
		private function keyHandling():void
		{
			if (FlxG.keys.justReleased("SPACE")) {
				FlxG.fade(0xff000000, 1, gotoPlayState);
			}
		}
		private function gotoPlayState():void { FlxG.switchState(new PlayState(FlxG.gameData.currentLevel));} 
	}

}