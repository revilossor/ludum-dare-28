package  
{
	import collectable.BulletPowerup;
	import collectable.GunPowerup;
	import hazard.Cruisebot;
	import hazard.Deathblock;
	import hazard.Flybot;
	import hazard.Pushbot;
	import hazard.Spike;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Map extends FlxGroup
	{
		private var _tiles:FlxTilemap;
 		private var _hazards:FlxGroup;
		private var _collectables:FlxGroup;
		
		private var _redDoor:FlxSprite;
		private var _greenDoor:FlxSprite;
		private var _blueDoor:FlxSprite;
		
		private static const TILE_WIDTH:uint = 32;
		private static const TILE_HEIGHT:uint = 32;
		
		public function Map(map:uint = 0) 
		{
			_tiles = new FlxTilemap();
			
			_tiles.loadMap(new Res.collision_maps[map], Res.collidable_map_tiles_32x32, TILE_WIDTH, TILE_HEIGHT, 0, 0, 1, 1);
			add(_tiles);
			
			var interactable:String = new Res.interaction_maps[map];
			
			var interactableData:Array = interactable.split(/\r\n|\n|\r/);
			for (var l:int = 0; l < interactableData.length; l++) {
				interactableData[l] = interactableData[l].split(",");
			}
			
			var drawx:Number = 0;	var drawy:Number = 0;
			var widthInTiles:uint = _tiles.width / TILE_WIDTH;
			var heightInTiles:uint = _tiles.height / TILE_HEIGHT;
				
			for (var numy:int = 0; numy < heightInTiles / 2; numy ++) {
				for (var numx:int = 0; numx < widthInTiles / 2; numx ++) {
					if (interactableData[numy][numx] == 1) { 
						_redDoor = new FlxSprite(drawx, drawy);
						_redDoor.loadGraphic(Res.interactable_map_tiles_64x64, true, false, 64, 64);
						_redDoor.addAnimation("idle", [1]);
						_redDoor.play("idle");
					}
					if (interactableData[numy][numx] == 2) {
						_greenDoor = new FlxSprite(drawx, drawy);
						_greenDoor.loadGraphic(Res.interactable_map_tiles_64x64, true, false, 64, 64);
						_greenDoor.addAnimation("idle", [2]);
						_greenDoor.play("idle");
					}
					if (interactableData[numy][numx] == 3) {
						_blueDoor = new FlxSprite(drawx, drawy);
						_blueDoor.loadGraphic(Res.interactable_map_tiles_64x64, true, false, 64, 64);
						_blueDoor.addAnimation("idle", [3]);
						_blueDoor.play("idle");
					}
					drawx += 64;
				}
				drawx = 0;
				drawy += 64;
			}
			
			_hazards = new FlxGroup();
			
			var haazard:String = new Res.hazard_maps[map];
			
			var hazardData:Array = haazard.split(/\r\n|\n|\r/);
			for (var h:int = 0; h < hazardData.length; h++) {
				hazardData[h] = hazardData[h].split(",");
			}
			drawx = 0; drawy = 0;
				
			for (var nummy:int = 0; nummy < heightInTiles; nummy++) {
				for (var nummx:int = 0; nummx < widthInTiles; nummx++) {
					if (hazardData[nummy][nummx] == 1) { 
						for (var s:uint = 0; s < 8; s++) {
							var newspike:Spike = new Spike(drawx + s * 4, drawy + 27);
							_hazards.add(newspike);
						}
					}
					if (hazardData[nummy][nummx] == 2) { 
						var newpushbot:Pushbot = new Pushbot(drawx, drawy);
						_hazards.add(newpushbot);
					}
					if (hazardData[nummy][nummx] == 3) { 
						var newflybot:Flybot = new Flybot(drawx, drawy);
						_hazards.add(newflybot);
					}
					if (hazardData[nummy][nummx] == 4) { 
						var newcruisebot:Cruisebot = new Cruisebot(drawx, drawy);
						_hazards.add(newcruisebot);
					}
					if (hazardData[nummy][nummx] == 5) { 
						var newdeathblock:Deathblock = new Deathblock(drawx, drawy);
						_hazards.add(newdeathblock);
					}
					drawx += 32;
				}
				drawx = 0;
				drawy += 32;
			}
			
			_collectables = new FlxGroup();
			if(Res.collect_maps[map] != null){
				var collect:String = new Res.collect_maps[map];
				
				var collectData:Array = collect.split(/\r\n|\n|\r/);
				for (var c:int = 0; c < collectData.length; c++) {
					collectData[c] = collectData[c].split(",");
				}
				drawx = 0; drawy = 0;
					
				for (var nummmy:int = 0; nummmy < heightInTiles*2; nummmy++) {
					for (var nummmx:int = 0; nummmx < widthInTiles*2; nummmx++) {
						if (collectData[nummmy][nummmx] == 1) {
							var gun:GunPowerup = new GunPowerup(drawx, drawy);
							_collectables.add(gun);
						}
						if (collectData[nummmy][nummmx] == 2) { //gun
							var bullet:BulletPowerup = new BulletPowerup(drawx, drawy);
							_collectables.add(bullet);
						}
						drawx += 16;
					}
					drawx = 0;
					drawy += 16;
				}
			}
		}
		public function get width():uint {				return _tiles.width;		}
		public function get height():uint {				return _tiles.height;		}
		public function get tiles():FlxTilemap {		return _tiles;				}
		public function get redDoor():FlxSprite {		return _redDoor;			}
		public function get greenDoor():FlxSprite {		return _greenDoor;			}
		public function get blueDoor():FlxSprite {		return _blueDoor;			}
		public function get hazards():FlxGroup {		return _hazards;			}
		public function get collectables():FlxGroup {	return _collectables;		}
	}

}