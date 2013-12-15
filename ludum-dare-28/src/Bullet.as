package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import player.Player;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Bullet extends FlxSprite
	{
		private var _duration:uint;
		public var justSpawned:Boolean = false;
		public var weaponised:Boolean = true;
		
	
		public function Bullet() 
		{
			makeGraphic(4, 4, 0xffffec00);
			visible = false;
		}
		override public function update():void
		{
			if (visible) {
				justSpawned = false;
			}else {
				velocity.x = velocity.y = 0;
				x = -99; y = -99;
			}
		}
		public function activateGravity():void
		{
			velocity = new FlxPoint();
			acceleration = Player.ACCELERATION;
			weaponised = false;
		}
		public function deactivateGravity():void
		{
			acceleration = new FlxPoint();
			weaponised = true;
		}
		
	}

}