package states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class DeathState extends FlxState
	{
		
		public function DeathState() { }
		override public function create():void
		{
			FlxG.playMusic(Res.gover_bgm);
			add(new FlxSprite(0,0, Res.death_bg));
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
				FlxG.fade(0xff000000, 1, gotoPlay);
			}
			if (FlxG.keys.justReleased("ENTER")) {
				FlxG.play(Res.click);
				FlxG.fade(0xff000000, 1, gotoMenu);
			}
		}
		private function gotoMenu():void
		{
			FlxG.pauseSounds();
			FlxG.switchState(new MenuState());
		}
		private function gotoPlay():void
		{
			FlxG.pauseSounds();
			FlxG.switchState(new PlayState(FlxG.gameData.currentLevel));
		}
		
	}

}