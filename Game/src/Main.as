package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.net.URLRequest;

	/**
	 * ...
	 * @author Píča
	 */
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends Sprite
	{
		
		
    
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new KeyboardListener());
			var menu:Menu = new Menu();
			addChild(menu);
			
		}

	}

}