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
	 * @author Píča, opravil já
	 */
	public class Menu extends Sprite
	{
		public var startButtonBitmap:Bitmap = new Bitmap();
		public var startButton:Sprite = new Sprite();
		public var startMouseOver:Boolean = false;	
		public var startButtonBitmapData1:BitmapData;
		public var startButtonBitmapData2:BitmapData;
		
		public var creditsButtonBitmap:Bitmap = new Bitmap();
		public var creditsButtonBitmapData1:BitmapData;
		public var creditsButtonBitmapData2:BitmapData;
		public var creditsMouseOver:Boolean = false;	
		public var creditsButton:Sprite = new Sprite();
		
		public var creditsCloseButtonBitmap:Bitmap = new Bitmap();
		public var creditsCloseButtonBitmapData1:BitmapData;
		public var creditsCloseButtonBitmapData2:BitmapData;
		public var creditsCloseMouseOver:Boolean = false;	
		public var creditsCloseButton:Sprite = new Sprite();
		
		public var buttonsActive:Boolean = true;
		
		public function Menu():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point, turn down for what?
			var backGround:Bitmap = new Resources.MENU_BACKGROUND();
			addChild(backGround);
			
			
			
			startButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;  //jenom start
			startButtonBitmapData2 = (new Resources.MENU_BUTTON_DOWN() as Bitmap).bitmapData;
			startButton.addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			startButton.addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			startButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			startButtonBitmap.bitmapData = startButtonBitmapData1;
			addChild(startButton);
			startButton.addChild(startButtonBitmap);
			startButton.x = 400;
			startButton.y = 300;
			startButton.name = "start";
			startButtonBitmap.bitmapData = startButtonBitmapData1;
			
			creditsButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;  //jenom credits
			creditsButtonBitmapData2 = (new Resources.MENU_BUTTON_DOWN() as Bitmap).bitmapData;
			creditsButton.addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			creditsButton.addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			creditsButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			creditsButtonBitmap.bitmapData = creditsButtonBitmapData1;
			addChild(creditsButton);
			creditsButton.addChild(creditsButtonBitmap);
			creditsButton.x = 600;
			creditsButton.y = 300;
			creditsButton.name = "credits";
			creditsButtonBitmap.bitmapData = creditsButtonBitmapData1;

		}
		private function MouseOver(e:MouseEvent):void
		{
			switch ((e.target as Sprite).name) 
			{
				case "start":
					startMouseOver = true;
					startButtonBitmap.bitmapData = startButtonBitmapData2;
					
				break;
				
				case "credits":
					creditsMouseOver = true;
					creditsButtonBitmap.bitmapData = creditsButtonBitmapData2;
				break;
				
				case "creditsClose":
					creditsCloseMouseOver = true;
					creditsCloseButtonBitmap.bitmapData = creditsCloseButtonBitmapData2;
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
				 
				case "credits":
					creditsMouseOver = false;
					creditsButtonBitmap.bitmapData = creditsButtonBitmapData1;
				break;
				
				case "creditsClose":
					creditsCloseMouseOver = false;
					creditsCloseButtonBitmap.bitmapData = creditsCloseButtonBitmapData1;
				break;
			}
				
		
		
		}
		
		private function MouseUp (e:MouseEvent):void
		{
		
			switch ((e.target as Sprite).name) //toto dělá že když se a to klikne tak že to něco udělá (přidá playState a smaže se
			{
				
				case "start":
					if (buttonsActive)
					{
						var playState:PlayState = new PlayState();
						(parent as Main).addChild(playState);
						(parent as Main).removeChild(this); //this is spartáááá!
					}
				break;
				
				case "credits": //neplést s penězi, toto jsou titulky
					if (buttonsActive)	
					{	
						var creditsBackGround:Bitmap = new Resources.MENU_BACKGROUND();
						creditsBackGround.name = "creditsBackGround";
						addChild(creditsBackGround);
						buttonsActive = false;
					
						creditsCloseButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;  //jenom credits
						creditsCloseButtonBitmapData2 = (new Resources.MENU_BUTTON_DOWN() as Bitmap).bitmapData;
						creditsCloseButton.addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
						creditsCloseButton.addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
						creditsCloseButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
						creditsCloseButtonBitmap.bitmapData = creditsCloseButtonBitmapData1;
						addChild(creditsCloseButton);
						creditsCloseButton.addChild(creditsCloseButtonBitmap);
						creditsCloseButton.x = 700;
						creditsCloseButton.y = 500;
						creditsCloseButton.name = "creditsClose";
						creditsCloseButtonBitmap.bitmapData = creditsCloseButtonBitmapData1;
					}
				break;
			
				case "creditsClose":
					removeChild(getChildByName("creditsBackGround"));
					removeChild(getChildByName("creditsClose"));
					buttonsActive = true;
				break;
			}
				
		
		
		}
	}


}
