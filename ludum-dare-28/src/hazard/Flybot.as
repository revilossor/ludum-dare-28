package hazard 
{
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Flybot extends Hazard
	{
		public function Flybot(xp:int, yp:int) 
		{
			super(xp, yp);
			loadGraphic(Res.flybot, true, false, 32, 32);
			addAnimation("move", [0, 1, 2, 3], 6);
			play("move");
			velocity = new FlxPoint(0, 150);
		}
		override public function update():void
		{
			super.update();
			if (isTouching(FlxObject.CEILING)) { velocity = new FlxPoint(0, 100); }
			if (isTouching(FlxObject.FLOOR)) { velocity = new FlxPoint(0, -100); }
		}
		
	}

}