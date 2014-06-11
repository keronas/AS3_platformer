package  
{
		import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Grayfoox
	 */
	public class KeyboardListener extends Sprite
	{
		public static var upDown:Boolean = false;
		public static var downDown:Boolean = false;
		public static var leftDown:Boolean = false;
		public static var rightDown:Boolean = false;
		
		public function KeyboardListener()
		{			
		stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp)
		}
		private function KeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.UP:
					upDown = true;
					
				break;
				case Keyboard.DOWN:
					downDown = true;
				break;
				case Keyboard.LEFT:
					leftDown = true; 
				break;
				case Keyboard.RIGHT:
					rightDown = true;
				break;
			}
		}
		private function KeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.UP:
					upDown = false;
				break;
				case Keyboard.DOWN:
					downDown = false;
				break;
				case Keyboard.LEFT:
					leftDown = false;
				break;
				case Keyboard.RIGHT:
					rightDown = false;
				break;
			
			}
		}
		
	}

}