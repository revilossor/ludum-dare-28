package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	import states.MenuState;
	
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(720, 440, MenuState, 1, 30, 30, true);
		}
		
	}
	
}