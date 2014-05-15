package Menu 
{
	/**
	 * ...
	 * @author Píča
	 */
	public class Menu 
	{
		
		public function Menu extends Sprite
		{
			public var cudlikBitmap:Bitmap;
			public var cudlik:Sprite = new Sprite();
		}
		public function Menu():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}

	}

}
		}
		
	}

}