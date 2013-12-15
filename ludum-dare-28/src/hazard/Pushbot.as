package hazard 
{
	import flash.external.ExternalInterface;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import player.Player;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Pushbot extends Hazard
	{	
		
		public function Pushbot(xp:uint, yp:uint) 
		{
			super(xp, yp);
			loadGraphic(Res.pushbot, true, true, 32, 32);
			addAnimation("move", [0, 1, 2, 3], 6);
			play("move");
			acceleration = Player.ACCELERATION;
			velocity = new FlxPoint( -100, 0);
		}
		override public function update():void
		{
			if (isTouching(FlxObject.LEFT)) { velocity = new FlxPoint(100, 0); facing = LEFT; }
			if (isTouching(FlxObject.RIGHT)) { velocity = new FlxPoint(-100, 0); facing = RIGHT; }
		}
		
		
	}

}