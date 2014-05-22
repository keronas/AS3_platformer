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
		public var startButton:Sprite = new Sprite();
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
			startButtonBitmap.bitmapData = (new Resources.MENU_BUTTON() as Bitmap).bitmapData;
			startButton.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			startButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			addChild(startButton);
			startButton.addChild(startButtonBitmap);
			startButton.x = 400;
			startButton.y = 300;
			startButton.name = "start";
		}
		private function MouseDown(e:MouseEvent):void
		{
			switch ((e.target as Sprite).name) 
			{
				case "start":
					startDown = true;
				break;
				
			}
			
				
		
			
		}
		private function MouseUp(e:MouseEvent):void
		{
			switch ((e.target as Sprite).name)
			{
				case "start":
					startDown = false;
				break;
				
			}
				
		
		
		}
	}


}
