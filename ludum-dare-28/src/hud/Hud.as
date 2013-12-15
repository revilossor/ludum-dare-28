package hud 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Oliver Ross
	 */
	public class Hud extends FlxGroup
	{
		private var _textBoxes:FlxGroup;
		private var _ammoText:FlxText;
		
		public function Hud() 
		{
			_textBoxes = new FlxGroup();
			add(_textBoxes);
			_ammoText = new FlxText(0, 0, 720, "ammo : " + FlxG.gameData.ammo);
			_ammoText.setFormat(null, 16, 0xfffffc00, "left", 0xffccc900);
			_ammoText.scrollFactor.x = _ammoText.scrollFactor.y = 0;
			if(FlxG.gameData.hasGun){
				add(_ammoText);
			}
		}
		override public function update():void
		{
			super.update();
			updateTextBoxes();
			if (FlxG.gameData.ammo == 1) {
				_ammoText.text = "ammo : YOU ONLY HAVE ONE! ";
			}else {
				_ammoText.text = "ammo : YOU HAVE NONE!";
			}
			
			
		}
		public function addAmmoText():void
		{
			add(_ammoText);
		}
		private function updateTextBoxes():void
		{
			for (var t:uint = 0; t < _textBoxes.length; t++) {
				if (!_textBoxes.members[t].alive) {
					_textBoxes.members[t].destroy();
					_textBoxes.remove(_textBoxes.members[t], true);
				}
			}
		}
		public function showMessage(xp:int, yp:int, message:String, duration:uint):void
		{
			_textBoxes.add(new HudText(xp, yp, message, duration));
		}
	}

}