package states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Oliver Ross 
	 */
	public class InitState extends FlxState
	{
		
		public function InitState() 
		{
		}
		override public function create():void
		{
			super.create();
			FlxG.gameData = new GameData();
			FlxG.switchState(new MenuState());
		}
		
	}

}