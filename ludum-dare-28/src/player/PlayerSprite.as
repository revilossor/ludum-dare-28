package player 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class PlayerSprite extends FlxSprite
	{

		public var onGround:Boolean = false;
		
		public function PlayerSprite(xp:uint, yp:uint) 
		{
			super(xp, yp);
			loadGraphic(Res.player_28x40, true, true, 28, 40);
			addAnimation("idle", [0]);
			addAnimation("walk", [0, 1, 0, 2], 8);
			addAnimation("jump", [1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5], 8, false);
			addAnimation("fall", [6]);
			addAnimation("shoot", [7]);
			addAnimation("shootWalk", [7, 8, 7, 9], 8);
			play("idle");
		}
		override public function update():void
		{
			super.update();
			animationHandling();
			keyHandling();
			if (isTouching(FlxObject.FLOOR)) {
				if (!onGround) { FlxG.play(Res.land); }
				onGround = true;
			}else {
				onGround = false;
			}
			
		}
		private function keyHandling():void
		{
			if (FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR)) {
				FlxG.play(Res.jump, 0.05);
				velocity.y -= Player.JUMP_STRENGTH;
			}
		}
		private function animationHandling():void
		{
			if (FlxG.keys.pressed("UP")) {
				!Player.gunShowing?play("jump"):play("shoot");
			}else if (velocity.y > 50) {
				!Player.gunShowing?play("fall"):play("shoot");
			}else if (velocity.x > 0 && isTouching(FlxObject.FLOOR)) {
				facing = RIGHT;
				!Player.gunShowing?play("walk"):play("shootWalk");
			}else if(velocity.x < 0 && isTouching(FlxObject.FLOOR)){
				facing = LEFT;
				!Player.gunShowing?play("walk"):play("shootWalk");
			}else{
				!Player.gunShowing?play("idle"):play("shootWalk");
			}
		}
		
	}

}