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
		public var startButtonBitmap:Bitmap = new Bitmap();
		public var startButtonBitmapData1:BitmapData;
		public var startButtonBitmapData2:BitmapData;
		public var startButton:Sprite = new Sprite();
		public var startMouseOver:Boolean = false;		
		
		public function Menu():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			startButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;
			startButtonBitmapData2 = (new Resources.MENU_BUTTON_DOWN() as Bitmap).bitmapData;
			startButton.addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			startButton.addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			startButtonBitmap.bitmapData = startButtonBitmapData1;
			addChild(startButton);
			startButton.addChild(startButtonBitmap);
			startButton.x = 400;
			startButton.y = 300;
			startButton.name = "start";
			startButtonBitmap.bitmapData = startButtonBitmapData1;

		}
		private function MouseOver(e:MouseEvent):void
		{
			switch ((e.target as Sprite).name) 
			{
				case "start":
					startMouseOver = true;
					startButtonBitmap.bitmapData = startButtonBitmapData2;
					
				break;
				
			}
			
				
		
			
		}
		private function MouseOut(e:MouseEvent):void
		{
			switch ((e.target as Sprite).name)
			{
				case "start":
					startMouseOver = false;
					startButtonBitmap.bitmapData = startButtonBitmapData1;
				break;
				
			}
				
		
		
		}
	}


}
