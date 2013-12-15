package states 
{
	import collectable.BulletPowerup;
	import collectable.GunPowerup;
	import flash.filters.ConvolutionFilter;
	import hazard.Cruisebot;
	import hazard.Deathblock;
	import hazard.Flybot;
	import hazard.Hazard;
	import hazard.Pushbot;
	import hazard.Spike;
	import hud.Hud;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import player.Player;
	import player.PlayerSprite;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class PlayState extends FlxState
	{
		private var _map:Map;
		private var _player:Player; 
		private var _hud:Hud;
		private var _redDoor:FlxSprite;
		private var _greenDoor:FlxSprite;
		private var _blueDoor:FlxSprite;
		private var _nextRoom:uint;
		private var _hazards:FlxGroup;
		private var _particles:FlxGroup; 
		private var _collectables:FlxGroup;
		
		public function PlayState(map:uint = 0) 
		{
			_map = new Map(map);
			_player = new Player(Res.startPositions[map].x, Res.startPositions[map].y);
			_hud = new Hud(); 
			_redDoor = _map.redDoor;
			_greenDoor = _map.greenDoor;
			_blueDoor = _map.blueDoor;
			_hazards = _map.hazards;
			_collectables = _map.collectables;
			_particles = new FlxGroup();
			FlxG.bgColor = 0xff000000;
		}
		override public function create():void
		{
			super.create();
			FlxG.bgColor = 0xff000000;
		
			add(_map);
			add(_redDoor);
			add(_greenDoor);
			add(_blueDoor);
			add(_particles);
			add(_player);
			add(_hazards);
			add(_collectables);
			add(_hud);
			
			FlxG.camera.setBounds(0, 0, _map.width, _map.height);
			FlxG.worldBounds = new FlxRect(0, 0, _map.width, _map.height);
			FlxG.camera.follow(_player.sprite, FlxCamera.STYLE_PLATFORMER);
			
			doTutorialMessaging();
		}
		private function doTutorialMessaging():void
		{
			trace("doTutorialMesaging() level " + FlxG.gameData.currentLevel + " length " + Res.tutorialMessages.length);
			if (FlxG.gameData.currentLevel < Res.tutorialMessages.length) {
				trace("message : " + Res.tutorialMessages[FlxG.gameData.currentLevel]);
				_hud.showMessage(_player.sprite.getScreenXY().x - 150, 
									_player.sprite.getScreenXY().y - 150, 
										Res.tutorialMessages[FlxG.gameData.currentLevel], 
											90);
			}
			if (FlxG.gameData.currentLevel == 16) {
				_hud.showMessage(_player.sprite.getScreenXY().x + 50, 
									_player.sprite.getScreenXY().y - 200, 
										"press space\nto return to menu", 
											200);
			}
		}
		override public function update():void
		{
			super.update();
			handleCollision();
			if (FlxG.gameData.currentLevel == 16) {
				if (FlxG.keys.justReleased("SPACE")) {
					FlxG.fade(0xff000000, 2, gotoMenuState);
				}
			}
		}
		private function gotoMenuState():void
		{
			FlxG.switchState(new MenuState());
		}
		private function handleCollision():void
		{
			if(_player.exists){
				FlxG.collide(_player.sprite, _map);
				FlxG.collide(_player.bullet, _map, bulletHitMap);
				FlxG.overlap(_player.sprite, _player.bullet, _player.collectBullet);
				FlxG.overlap(_player.sprite, _collectables, collectCollectable);
				FlxG.collide(_player.sprite, _hazards, playerHitHazard);
				if(_redDoor != null){ FlxG.overlap(_player, _redDoor, playerOverRedDoor);}
				if(_greenDoor != null){ FlxG.overlap(_player, _greenDoor, playerOverGreenDoor);}
				if(_blueDoor != null){ FlxG.overlap(_player, _blueDoor, playerOverBlueDoor);}
				if (_player.sprite.isTouching(FlxObject.RIGHT)) { _player.canShootRight = false; }
				if (_player.sprite.isTouching(FlxObject.LEFT)) { _player.canShootLeft = false; }
			}
			FlxG.collide(_particles, _map);
			FlxG.collide(_hazards, _map);
			FlxG.overlap(_player.bullet, _hazards, bulletHitHazard);
			FlxG.overlap(_hazards, _hazards, hazardOverHazard);
		}
		private function hazardOverHazard(h:Hazard, o:Hazard):void
		{
			if ((h is Deathblock && o is Pushbot) || (h is Pushbot && o is Deathblock)) {
				FlxObject.separateY(h, o);
			}
			if ((h is Deathblock && o is Cruisebot) || (h is Cruisebot && o is Deathblock)) {
				FlxObject.separateX(h, o);
			}
			if ((h is Deathblock && o is Flybot) || (h is Deathblock && o is Flybot)) {
				FlxObject.separateY(h, o);
			}
		}
		private function bulletHitMap(b:Bullet, m:FlxObject):void
		{
			b.weaponised = false;
			if (b.wasTouching == FlxObject.FLOOR) { trace("dont play ths time"); return;}
			FlxG.play(Res.bulletwall);
		}
		private function bulletHitHazard(b:Bullet, h:FlxObject):void
		{
			if (!b.weaponised) { trace("not weaponised"); return; }
			if (h is Spike) { return; }
			FlxG.play(Res.enemydie);
			FlxG.flash(0xffff0000, 0.3);
			FlxObject.separateX(b, h);
			spawnParticles(h.getMidpoint().x, h.getMidpoint().y, 10, 0x77880000);
			_hazards.remove(h, true);
			h.destroy();
			b.activateGravity();
		}
		private function collectCollectable(p:FlxObject, pow:FlxObject):void
		{
			if (pow is GunPowerup) {
				_hud.showMessage(_player.sprite.getScreenXY().x, 
									_player.sprite.getScreenXY().y, 
										"Weapon Get!\nbut there's no ammo...", 
											80);
				spawnParticles(pow.getMidpoint().x, pow.getMidpoint().y, 50, 0x77ffffff);
				FlxG.gameData.hasGun = true;
				_hud.addAmmoText();
				FlxG.play(Res.gunget, 0.3);
			}
			if (pow is BulletPowerup) {
				_hud.showMessage(_player.sprite.getScreenXY().x-150, 
									_player.sprite.getScreenXY().y-50, 
										"Bullet Get!\nyou can reuse it\npress space to shoot", 
											80);
				spawnParticles(pow.getMidpoint().x, pow.getMidpoint().y, 50, 0x77ffffff);
				FlxG.gameData.ammo = 1;
				FlxG.play(Res.bulletget, 0.5);
			}
	//		_player.collectCollectables(p, pow);
			_collectables.remove(pow, true);
			pow.destroy();
			
		}
		private function playerDie(pl:FlxObject, ha:FlxObject):void
		{
			_hud.showMessage(_player.sprite.getScreenXY().x- 30, _player.sprite.getScreenXY().y-50, "DEDZ!", 45); 
			
			spawnParticles(	_player.sprite.getMidpoint().x, 
								_player.sprite.getMidpoint().y,
									30, 0xffff0000 );
			_player.kill();
			FlxG.play(Res.playerdie, 0.2);
			FlxG.fade(0xffff0000, 2, gotoDeathState);
		}
		private function playerHitHazard(p:FlxObject, h:FlxObject):void
		{
			if (h is Spike) {
				if (!(h.isTouching(FlxObject.LEFT)||h.isTouching(FlxObject.RIGHT))) {
					playerDie(p, h);
					FlxG.flash(0xffff0000, 0.3);
					FlxG.shake();
				}
			}else {
				playerDie(p, h);
				FlxG.flash(0xffff0000, 0.3);
				FlxG.shake();
			}
		}
		private function spawnParticles(xp:uint, yp:uint, num:uint, col:uint):void
		{
			for (var p:uint = 0; p < num; p++) {
				var newparticle:FlxSprite = new FlxSprite(xp, yp);
				newparticle.makeGraphic(2 + Math.round(Math.random() * 3), 2 + Math.round(Math.random() * 3), col);
				newparticle.acceleration = Player.ACCELERATION;
				newparticle.velocity.x = -50 + (Math.round(Math.random() * 100));
				newparticle.velocity.y = -(100 + Math.random() * 100);
				_particles.add(newparticle);
			}
		}
		private function gotoDeathState():void
		{
			FlxG.switchState(new DeathState());
		}
		private function playerOverRedDoor(pl:FlxObject, dr:FlxObject):void
		{
			if (FlxG.keys.justReleased("DOWN")) {
				_redDoor.allowCollisions = FlxObject.NONE;
				_player.exists = false;
				_nextRoom = getConnecton("red");
				FlxG.play(Res.door);
				FlxG.fade(0xff000000, 1, gotoNextRoom);
			}
		}
		private function playerOverGreenDoor(pl:FlxObject, dr:FlxObject):void
		{
			if (_greenDoor == null) { trace("weird green door bug here...."); return; }
			if (FlxG.keys.justReleased("DOWN")) {
				FlxG.play(Res.door);
				_greenDoor.allowCollisions = FlxObject.NONE;
				_player.exists = false;
				_nextRoom = getConnecton("green");
				FlxG.fade(0xff000000, 1, gotoNextRoom);
			}
		}
		private function playerOverBlueDoor(pl:FlxObject, dr:FlxObject):void
		{
			if (FlxG.keys.justReleased("DOWN")) {
				FlxG.play(Res.door);
				_blueDoor.allowCollisions = FlxObject.NONE;
				_player.exists = false;
				_nextRoom = getConnecton("blue");
				FlxG.fade(0xff000000, 1, gotoNextRoom);
			}
		}
		private function gotoNextRoom():void
		{
			FlxG.gameData.currentLevel = _nextRoom;
			FlxG.switchState(new PlayState(FlxG.gameData.currentLevel));
		}
		
		private function getConnecton(door:String):uint
		{
			trace("getConnection() " + door);
			switch(door) {
				case "red":
					return Res.connections[FlxG.gameData.currentLevel][0];
					break;
				case "green":
					return Res.connections[FlxG.gameData.currentLevel][1];
					break;
				case "blue":
					return Res.connections[FlxG.gameData.currentLevel][2];
					break;
			}
			return 0;
			
		}
		
		
		
	}

}