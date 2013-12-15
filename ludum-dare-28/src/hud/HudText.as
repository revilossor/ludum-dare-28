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
		
		public function HudText(xp:int, yp:int, message:String, duration:uint) 
		{
			_lifetime = duration;
			trace("messsage at : " + xp + ", "+yp);
			var text:FlxText = new FlxText(xp, yp, 200, message);
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