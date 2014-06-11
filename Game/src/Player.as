package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Suvoj
	 */
	public class Player extends Bitmap
	{
		
		
		public function Player() 
		{
			this.bitmapData = (new Resources.PLAYER_STAND() as Bitmap).bitmapData;
		}
		
	}

}