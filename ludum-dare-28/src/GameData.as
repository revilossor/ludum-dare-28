package  
{
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class GameData 
	{
		private var _currentLevel:uint = 0;
		private var _ammo:uint = 1;
		
		public function GameData() 
		{
			
		}
		public function get currentLevel():uint 			{ return _currentLevel; }
		public function set currentLevel(v:uint):void 		{ _currentLevel = v; }
		public function get ammo():uint						{ return _ammo; }
		public function set ammo(v:uint):void				{ _ammo = v; }
	}

}