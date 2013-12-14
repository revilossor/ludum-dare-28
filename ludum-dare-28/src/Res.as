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
		
		[Embed(source = "../lib/gfx/tiles/collidable_map_tiles_32x32.png")] public static const collidable_map_tiles_32x32:Class;
		[Embed(source = "../lib/gfx/tiles/interactable_map_tiles_64x64.png")] public static const interactable_map_tiles_64x64:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map0_collidable.csv", mimeType = "application/octet-stream")] public static const map_0_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map0_interactable.csv", mimeType = "application/octet-stream")] public static const map_0_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map0_hazard.csv", mimeType = "application/octet-stream")] public static const map_0_hazard:Class;
		
		[Embed(source = "../lib/map/csv/mapCSV_map1_collidable.csv", mimeType = "application/octet-stream")] public static const map_1_collidable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map1_interactable.csv", mimeType = "application/octet-stream")] public static const map_1_interactable:Class;
		[Embed(source = "../lib/map/csv/mapCSV_map1_hazard.csv", mimeType = "application/octet-stream")] public static const map_1_hazard:Class;
		
		public static var collision_maps:Array = [
			map_0_collidable, 
			map_1_collidable
		]
		public static var interaction_maps:Array = [
			map_0_interactable, 
			map_1_interactable
		]
		public static var hazard_maps:Array = [
			map_0_hazard, 
			map_1_hazard
		]
		public static var startPositions:Array = [
			new FlxPoint(100, 50),
			new FlxPoint(310,210) 
		]
		public static var connections:Array = [
			[1,1,1]
		]
		
	}

}