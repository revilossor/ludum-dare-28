package player 
{
	import collectable.GunPowerup;
	import collectable.Powerup;
	import flash.text.engine.BreakOpportunity;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Player extends FlxGroup
	{
		private var _sprite:PlayerSprite; 
		public function get sprite():PlayerSprite { return _sprite; }
		private var _gun:FlxSprite; 
		private var _hasGun:Boolean;
		
		private var _bullet:Bullet;
		public function get bullet():Bullet { return _bullet; }
		
		private var _isFalling:Boolean = true;
		private var _isJumping:Boolean = true;
		private var _facing:String = 'right';
		
		public var canShootRight:Boolean = true;
		public var canShootLeft:Boolean = true;
		
		private const shootThreshold:uint = 30;
		private var shootTimer:uint = 0;
		private const showWeaponThreshold:uint = 10;
		public static var gunShowing:Boolean = false;;
		
		public static const MAX_VELOCITY:FlxPoint = new FlxPoint(250, 500);
		public static const DRAG:FlxPoint = new FlxPoint(100, 50);
		public static const ACCELERATION:FlxPoint = new FlxPoint(0, 500);
		public static const JUMP_STRENGTH:uint = 300;
		public static const WALK_STRENGTH:uint = 20;
		
		public function Player(xp:uint, yp:uint) 
		{
			_sprite = new PlayerSprite(xp, yp);
			_gun = new FlxSprite(xp + 20, yp + 4, Res.gun);
			_gun.visible = false;
			_bullet = new Bullet();
			setupSprite(_sprite);
			add(_sprite);
			add(_gun);
			add(_bullet);
			_hasGun = FlxG.gameData.hasGun;
		}
		override public function update():void
		{
			super.update();
			animationHandling();
			if(_sprite.facing==FlxObject.RIGHT){
				_gun.x = _sprite.x + 28;
				_gun.y = _sprite.y + 8;
				_gun.scale.x = 1;
			}else {
				_gun.x = _sprite.x- 12;
				_gun.y = _sprite.y + 8;
				_gun.scale.x = -1;
			}
			shootHandling();
			keyHandling();
		}
		public function collectBullet(s:FlxObject, b:FlxObject):void
		{
			var bul:Bullet = b as Bullet;
			if (bul.justSpawned) { return; }
			FlxG.gameData.ammo = 1;
			_bullet.visible = false;
			_bullet.deactivateGravity();
			FlxG.play(Res.pickupBullet);
		}
		private function shootHandling():void
		{
			if (shootTimer > 0) {
				shootTimer--;
			}
			if (shootTimer > shootThreshold - showWeaponThreshold) { _gun.visible = true; gunShowing = true; }
			else { _gun.visible = false; gunShowing = false; }
		}
		private function animationHandling():void
		{ 	
			if (_sprite.velocity.y > 50) {
				_isFalling = true;
				_isJumping = false;
				canShootLeft = canShootRight = true;
			}
			if (_sprite.velocity.y < 0) {
				_isJumping = true;
				_isFalling = false;
			}
			if (_sprite.velocity.x > 0) {
				_facing = 'right';
			}else {
				_facing = 'left';
			}
		}

		private function keyHandling():void
		{
			if (FlxG.keys.justPressed("SPACE") && shootTimer == 0 && FlxG.gameData.ammo == 1&&_sprite.onGround && _hasGun) {
				shootTimer = shootThreshold;
				trace("canright: " + canShootRight + ", can left: " + canShootLeft);
				_bullet.justSpawned = true;
				if (_sprite.facing == FlxObject.RIGHT && canShootRight) {
					FlxG.play(Res.shoot, 0.1);
					_bullet.x = _sprite.x + 37;
					_bullet.y = _gun.y;
					_bullet.velocity = new FlxPoint(sprite.velocity.x + 300, 0);
					_bullet.visible = true;
					FlxG.gameData.ammo = 0;
				}else if (_sprite.facing == FlxObject.LEFT && canShootLeft) {
					FlxG.play(Res.shoot, 0.1);
					_bullet.x = _gun.x -9;
					_bullet.y = _gun.y;
					_bullet.velocity = new FlxPoint(sprite.velocity.x - 300, 0);
					_bullet.visible = true;
					FlxG.gameData.ammo = 0;
				}
			}
			if (FlxG.keys.pressed("LEFT")) {
				_sprite.velocity.x += -WALK_STRENGTH;
				if (!canShootRight) { canShootRight = true; }
			}
			if (FlxG.keys.pressed("RIGHT")) {
				_sprite.velocity.x += WALK_STRENGTH;
				if (!canShootLeft) { canShootLeft = true; }
			}
		}
		private function setupSprite(sp:FlxSprite):void
		{
			sp.maxVelocity = MAX_VELOCITY;
			sp.acceleration = ACCELERATION;
			sp.drag = DRAG;
		}
		private function mixinVelocity(v:FlxPoint):void
		{
			for (var m:uint = 0; m < members.length; m++) {
				if (members[m] is Bullet) { continue; }
				members[m].velocity.x += v.x;
				members[m].velocity.y += v.y;
			}
		}
		
	}

}