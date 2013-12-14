package states 
{
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
		
		public function PlayState(map:uint = 0) 
		{
			_map = new Map(map);
			_player = new Player(Res.startPositions[map].x, Res.startPositions[map].y);
			_hud = new Hud(); 
			_redDoor = _map.redDoor;
			_greenDoor = _map.greenDoor;
			_blueDoor = _map.blueDoor;
			_hazards = _map.hazards;
			_particles = new FlxGroup();
		}
		override public function create():void
		{
			super.create();
			FlxG.bgColor = 0xff000000;
		
			add(_map);
			add(_redDoor);
			add(_greenDoor);
			add(_blueDoor);
			add(_player);
			add(_hazards);
			add(_particles);
			add(_hud);
			
			FlxG.camera.setBounds(0, 0, _map.width, _map.height);
			FlxG.worldBounds = new FlxRect(0, 0, _map.width, _map.height);
			FlxG.camera.follow(_player.sprite, FlxCamera.STYLE_PLATFORMER);
		}
		override public function update():void
		{
			super.update();
			handleCollision();
		}
		private function handleCollision():void
		{
			FlxG.collide(_player.sprite, _map);
			FlxG.collide(_particles, _map);
			FlxG.collide(_player.bullet, _map);
			FlxG.collide(_player, _hazards, playerDie);
			FlxG.overlap(_player, _redDoor, playerOverRedDoor);
			FlxG.overlap(_player, _greenDoor, playerOverGreenDoor);
			FlxG.overlap(_player, _blueDoor, playerOverBlueDoor);
		}
		private function playerDie(pl:FlxObject, ha:FlxObject):void
		{
			_hud.showMessage(_player.sprite.getScreenXY().x- 30, _player.sprite.getScreenXY().y-50, "DEDZ!", 45); 
			
			spawnParticles(	_player.sprite.getMidpoint().x, 
								_player.sprite.getMidpoint().y,
									30, 0xffff0000 );
			_player.kill();
			FlxG.fade(0xffff0000, 2, gotoDeathState);
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
				_nextRoom = getConnecton("red");
				FlxG.fade(0xff000000, 1, gotoNextRoom);
			}
		}
		private function playerOverGreenDoor(pl:FlxObject, dr:FlxObject):void
		{
			if (FlxG.keys.justReleased("DOWN")) {
				_greenDoor.allowCollisions = FlxObject.NONE;
				_nextRoom = getConnecton("green");
				FlxG.fade(0xff000000, 1, gotoNextRoom);
			}
		}
		private function playerOverBlueDoor(pl:FlxObject, dr:FlxObject):void
		{
			if (FlxG.keys.justReleased("DOWN")) {
				_blueDoor.allowCollisions = FlxObject.NONE;
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