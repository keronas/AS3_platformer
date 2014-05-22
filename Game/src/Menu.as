package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Píča
	 */
	public class Menu extends Sprite
	{
		public var cudlikBitmap:Bitmap = new Bitmap();
		public var cudlik:Sprite = new Sprite();
		public var startDown:Boolean = false;		
		
		public function Menu():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			cudlikBitmap.bitmapData = (new Resources.MENU_BUTTON() as Bitmap).bitmapData;
			cudlik.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			cudlik.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			addChild(cudlik);
			cudlik.addChild(cudlikBitmap);
			cudlik.x = 400;
			cudlik.y = 300;
		}
		private function MouseDown(e:MouseEvent):void
		{
			
			startDown = true;
			
		}
		private function MouseUp(e:MouseEvent):void
		{
			
			startDown = false;
			
		}
	}


}
