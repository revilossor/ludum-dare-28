package hazard 
{
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Cruisebot extends Hazard
	{
		
		public function Cruisebot(xp:int, yp:int) 
		{
			super(xp, yp);
			loadGraphic(Res.cruisebot, true, true, 32, 32);
			addAnimation("move", [0, 1, 2, 3], 6);
			play("move");
			velocity = new FlxPoint( -100, 0);
		}
		override public function update():void
		{
			if (isTouching(FlxObject.LEFT)) { velocity = new FlxPoint(100, 0); facing = LEFT; }
			if (isTouching(FlxObject.RIGHT)) { velocity = new FlxPoint(-100, 0); facing = RIGHT; }
		}
		
	}

}