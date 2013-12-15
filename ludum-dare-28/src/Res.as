package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Res 
	{
		[Embed(source = "../lib/gfx/player/char_28x40.png")] public static const player_28x40:Class;
		
		[Embed(source = "../lib/gfx/entities/spike.png")] public static const spike:Class;
		[Embed(source = "../lib/gfx/entities/gun.png")] public static const gun:Class;
		[Embed(source = "../lib/gfx/entities/bullet.png")] public static const bullet:Class;
		[Embed(source = "../lib/gfx/entities/pushbot_32x32.png")] public static const pushbot:Class;
		[Embed(source = "../lib/gfx/entities/flybot_32x32.png")] public static const flybot:Class;
		[Embed(source = "../lib/gfx/entities/cruisebot_32x32.png")] public static const cruisebot:Class;
		[Embed(source = "../lib/gfx/entities/deathblock_32x32.png")] public static const dethblock:Class;
		
		[Embed(source = "../lib/gfx/bg/death_bg.png")] public static const death_bg:Class;
		[Embed(source = "../lib/gfx/bg/menu_bg.png")] public static const menu_bg:Class;
		
		[Embed(source = "../lib/sfx/title_bgm.mp3")] public static const menu_bgm:Class; 
		[Embed(source = "../lib/sfx/gameover_bgm.mp3")] public static const gover_bgm:Class;
		
		[Embed(source = "../lib/sfx/buletget.mp3")] public static const bulletget:Class;
		[Embed(source = "../lib/sfx/click.mp3")] public static const click:Class;
		[Embed(source = "../lib/sfx/door.mp3")] public static const door:Class;
		[Embed(source = "../lib/sfx/enemydie.mp3")] public static const enemydie:Class;
		[Embed(source = "../lib/sfx/gunget.mp3")] public static const gunget:Class;
		[Embed(source = "../lib/sfx/jump.mp3")] public static const jump:Class;
		[Embed(source = "../lib/sfx/playerdie.mp3")] public static const playerdie:Class;
		[Embed(source = "../lib/sfx/shoot.mp3")] public static const shoot:Class;
		[Embed(source = "../lib/sfx/bulletwall.mp3")] public static const bulletwall:Class;
		[Embed(source = "../lib/sfx/pickupbullet.mp3")] public static const pickupBullet:Class;
		[Embed(source = "../lib/sfx/land.mp3")] public static const land:Class;
		
		[Embed(source = "../lib/gfx/tiles/collidable_map_tiles_32x32.png")] public static const collidable_map_tiles_32x32:Class;
		[Embed(source = "../lib/gfx/tiles/interactable_map_tiles_64x64.png")] public static const interactable_map_tiles_64x64:Class;
		
		[Embed(source = "../lib/gfx/tiles/collectable_map_tiles_16x16.png")] public static const collectable_map_tiles_16x16:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map0_collidable.csv", mimeType = "application/octet-stream")] public static const map_0_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map0_interactable.csv", mimeType = "application/octet-stream")] public static const map_0_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map0_hazard.csv", mimeType = "application/octet-stream")] public static const map_0_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map1_collidable.csv", mimeType = "application/octet-stream")] public static const map_1_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map1_interactable.csv", mimeType = "application/octet-stream")] public static const map_1_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map1_hazard.csv", mimeType = "application/octet-stream")] public static const map_1_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map2_collidable.csv", mimeType = "application/octet-stream")] public static const map_2_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map2_interactable.csv", mimeType = "application/octet-stream")] public static const map_2_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map2_hazard.csv", mimeType = "application/octet-stream")] public static const map_2_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map3_collidable.csv", mimeType = "application/octet-stream")] public static const map_3_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map3_interactable.csv", mimeType = "application/octet-stream")] public static const map_3_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map3_hazard.csv", mimeType = "application/octet-stream")] public static const map_3_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map4_collidable.csv", mimeType = "application/octet-stream")] public static const map_4_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map4_interactable.csv", mimeType = "application/octet-stream")] public static const map_4_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map4_hazard.csv", mimeType = "application/octet-stream")] public static const map_4_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map5_collidable.csv", mimeType = "application/octet-stream")] public static const map_5_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map5_interactable.csv", mimeType = "application/octet-stream")] public static const map_5_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map5_hazard.csv", mimeType = "application/octet-stream")] public static const map_5_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map6_collidable.csv", mimeType = "application/octet-stream")] public static const map_6_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map6_interactable.csv", mimeType = "application/octet-stream")] public static const map_6_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map6_hazard.csv", mimeType = "application/octet-stream")] public static const map_6_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map6_collectable.csv", mimeType = "application/octet-stream")] public static const map_6_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map7_collidable.csv", mimeType = "application/octet-stream")] public static const map_7_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map7_interactable.csv", mimeType = "application/octet-stream")] public static const map_7_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map7_hazard.csv", mimeType = "application/octet-stream")] public static const map_7_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map7_collectable.csv", mimeType = "application/octet-stream")] public static const map_7_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map8_collidable.csv", mimeType = "application/octet-stream")] public static const map_8_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map8_interactable.csv", mimeType = "application/octet-stream")] public static const map_8_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map8_hazard.csv", mimeType = "application/octet-stream")] public static const map_8_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map8_collectable.csv", mimeType = "application/octet-stream")] public static const map_8_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map9_collidable.csv", mimeType = "application/octet-stream")] public static const map_9_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map9_interactable.csv", mimeType = "application/octet-stream")] public static const map_9_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map9_hazard.csv", mimeType = "application/octet-stream")] public static const map_9_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map9_collectable.csv", mimeType = "application/octet-stream")] public static const map_9_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map10_collidable.csv", mimeType = "application/octet-stream")] public static const map_10_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map10_interactable.csv", mimeType = "application/octet-stream")] public static const map_10_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map10_hazard.csv", mimeType = "application/octet-stream")] public static const map_10_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map10_collectable.csv", mimeType = "application/octet-stream")] public static const map_10_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map11_collidable.csv", mimeType = "application/octet-stream")] public static const map_11_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map11_interactable.csv", mimeType = "application/octet-stream")] public static const map_11_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map11_hazard.csv", mimeType = "application/octet-stream")] public static const map_11_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map11_collectable.csv", mimeType = "application/octet-stream")] public static const map_11_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map12_collidable.csv", mimeType = "application/octet-stream")] public static const map_12_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map12_interactable.csv", mimeType = "application/octet-stream")] public static const map_12_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map12_hazard.csv", mimeType = "application/octet-stream")] public static const map_12_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map12_collectable.csv", mimeType = "application/octet-stream")] public static const map_12_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map13_collidable.csv", mimeType = "application/octet-stream")] public static const map_13_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map13_interactable.csv", mimeType = "application/octet-stream")] public static const map_13_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map13_hazard.csv", mimeType = "application/octet-stream")] public static const map_13_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map13_collectable.csv", mimeType = "application/octet-stream")] public static const map_13_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map14_collidable.csv", mimeType = "application/octet-stream")] public static const map_14_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map14_interactable.csv", mimeType = "application/octet-stream")] public static const map_14_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map14_hazard.csv", mimeType = "application/octet-stream")] public static const map_14_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map14_collectable.csv", mimeType = "application/octet-stream")] public static const map_14_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map15_collidable.csv", mimeType = "application/octet-stream")] public static const map_15_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map15_interactable.csv", mimeType = "application/octet-stream")] public static const map_15_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map15_hazard.csv", mimeType = "application/octet-stream")] public static const map_15_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map15_collectable.csv", mimeType = "application/octet-stream")] public static const map_15_collectable:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map16_collidable.csv", mimeType = "application/octet-stream")] public static const map_16_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map16_interactable.csv", mimeType = "application/octet-stream")] public static const map_16_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map16_hazard.csv", mimeType = "application/octet-stream")] public static const map_16_hazard:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map16_collectable.csv", mimeType = "application/octet-stream")] public static const map_16_collectable:Class;
		
		public static var collision_maps:Array = [
			map_0_collidable, 
			map_1_collidable,
			map_2_collidable,
			map_3_collidable,
			map_4_collidable,
			map_5_collidable,
			map_6_collidable,
			map_7_collidable,
			map_8_collidable,
			map_9_collidable,
			map_10_collidable,
			map_11_collidable,
			map_12_collidable,
			map_13_collidable,
			map_14_collidable,
			map_15_collidable,
			map_16_collidable
		]
		public static var interaction_maps:Array = [
			map_0_interactable, 
			map_1_interactable,
			map_2_interactable,
			map_3_interactable,
			map_4_interactable,
			map_5_interactable,
			map_6_interactable,
			map_7_interactable,
			map_8_interactable,
			map_9_interactable,
			map_10_interactable,
			map_11_interactable,
			map_12_interactable,
			map_13_interactable,
			map_14_interactable,
			map_15_interactable,
			map_16_interactable
		]
		public static var hazard_maps:Array = [
			map_0_hazard, 
			map_1_hazard,
			map_2_hazard,
			map_3_hazard,
			map_4_hazard,
			map_5_hazard,
			map_6_hazard,
			map_7_hazard,
			map_8_hazard,
			map_9_hazard,
			map_10_hazard,
			map_11_hazard,
			map_12_hazard,
			map_13_hazard,
			map_14_hazard,
			map_15_hazard,
			map_16_hazard
		]
		public static var collect_maps:Array = [
			null, 
			null,
			null,
			null,
			null,
			null,
			map_6_collectable,
			map_7_collectable,
			map_8_collectable,
			map_9_collectable,
			map_10_collectable,
			map_11_collectable,
			map_12_collectable,
			null,
			null,
			null,
			null
		]
		public static var startPositions:Array = [
			new FlxPoint(317, 200),
			new FlxPoint(200, 208), 
			new FlxPoint(200, 208), 
			new FlxPoint(200, 165), 
			new FlxPoint(200, 215), 
			new FlxPoint(710, 80), 
			new FlxPoint(228, 380), 
			new FlxPoint(288, 80), 
			new FlxPoint(240, 144), 
			new FlxPoint(67, 280), 
			new FlxPoint(480, 565), 
			new FlxPoint(166, 150), 
			new FlxPoint(162, 50), 
			new FlxPoint(210, 84), 
			new FlxPoint(548, 120),
			new FlxPoint(69, 133),
			new FlxPoint(73, 552),
		]
		public static var connections:Array = [
			[1, 2, 3],
			[4, 0, 0],
			[4, 5, 0],
			[5, 0, 0],
			[6, 0, 0],
			[6, 0, 0],
			[7, 0, 0],
			[9, 0, 0],
			[9, 0, 0],
			[10, 0, 0],
			[11, 12, 0],
			[13, 12, 0],
			[15, 11, 0],
			[16, 15, 0],
			[16, 15, 15],
			[16, 0, 0],
			[0, 0, 0]
		]
		public static var tutorialMessages:Array = [
			"arrow keys to move\ndown to go through doors",
			"up arrow to jump",
			"jump by pressing the up key",
			"press the up key\nto jump",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"" 
		]
		
	}

}