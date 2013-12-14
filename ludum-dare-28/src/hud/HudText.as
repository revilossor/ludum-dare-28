package hud 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class HudText extends FlxGroup
	{
		private var _lifetime:int; 
		
		public function HudText(xp:uint, yp:uint, message:String, duration:uint) 
		{
			_lifetime = duration;
			var text:FlxText = new FlxText(xp, yp, 100, message);
			text.setFormat(null, 16, 0xff9400, "center", 0xffa66000);
			text.scrollFactor.x = text.scrollFactor.y = 0;
			add(text);
		}
		override public function update():void
		{
			if (_lifetime-- <= 0) {
				this.kill();
			}
		}
		
	}

}