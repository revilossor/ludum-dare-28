package states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
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
			FlxG.playMusic(Res.menu_bgm);
			
			add(new FlxSprite(0, 0, Res.menu_bg));
		}
		override public function update():void
		{
			super.update();
			keyHandling();
		}
		private function keyHandling():void
		{
			if (FlxG.keys.justReleased("SPACE")) {
				FlxG.play(Res.click);
				FlxG.fade(0xff000000, 1, gotoPlayState);
			}
		}
		private function gotoPlayState():void 
		{
			FlxG.pauseSounds();
			FlxG.switchState(new PlayState(FlxG.gameData.currentLevel));
		} 
	}

}