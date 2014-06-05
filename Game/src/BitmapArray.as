package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Suvoj
	 */
	public class BitmapArray 
	{
		public var bitmaps:Array = new Array();
		public function BitmapArray(bitmapClass:Class, frameWidth:int ) 
		{
			var bitmapData:BitmapData= (new bitmapClass() as Bitmap).bitmapData;
			for (var i:int = 0; i < bitmapData.width/frameWidth; i++) 
			{
				bitmaps[i] = new BitmapData(40, 40);
				(bitmaps[i] as BitmapData).copyPixels(bitmapData, new Rectangle(i * 40, 0, 40, 40), new Point());
			}
		}
		
	}

}