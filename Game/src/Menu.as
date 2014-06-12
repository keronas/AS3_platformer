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
		public var startButtonBitmap:Bitmap = new Bitmap();  //deklarace bitmap a najetí myší pro start tlačítko
		public var startButton:Sprite = new Sprite();
		public var startMouseOver:Boolean = false;	
		public var startButtonBitmapData1:BitmapData;
		public var startButtonBitmapData2:BitmapData;
		
		public var creditsButtonBitmap:Bitmap = new Bitmap(); //deklarace bitmap a najetí myší pro credits tlačítko
		public var creditsButtonBitmapData1:BitmapData;
		public var creditsButtonBitmapData2:BitmapData;
		public var creditsMouseOver:Boolean = false;	
		public var creditsButton:Sprite = new Sprite();
		
				
		public var optionsButtonBitmap:Bitmap = new Bitmap(); //deklarace bitmap a najetí myší pro options tlačítko
		public var optionsButtonBitmapData1:BitmapData;
		public var optionsButtonBitmapData2:BitmapData;
		public var optionsMouseOver:Boolean = false;	
		public var optionsButton:Sprite = new Sprite();
		
		public var creditsCloseButtonBitmap:Bitmap = new Bitmap(); //deklarace bitmap a najetí myší pro tlačítko, které vypíná credits (viz. níže)
		public var creditsCloseButtonBitmapData1:BitmapData;
		public var creditsCloseButtonBitmapData2:BitmapData;
		public var creditsCloseMouseOver:Boolean = false;	
		public var creditsCloseButton:Sprite = new Sprite();
		public var creditstext:TextField = new TextField;
		
		public var englishButtonBitmap:Bitmap = new Bitmap(); //deklarace bitmap a najetí myší pro tlačítko, které nastavuje jazyk (toto je angličtina)
		public var englishButtonBitmapData1:BitmapData;
		public var englishButton:Sprite = new Sprite();
		
		public var czechButtonBitmap:Bitmap = new Bitmap(); //deklarace bitmap a najetí myší pro tlačítko, které nastavuje jazyk (pro češtinu (né čínštinu!))
		public var czechButtonBitmapData1:BitmapData;
		public var czechButton:Sprite = new Sprite();
		
		public var languageczech:Boolean = true; //čeština = true, angličtina = false
		
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
			
			
			
			startButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;  //info o start tlačítku, (obrázek, pozice...)
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
			
			optionsButtonBitmapData1 = (new Resources.MENU_BUTTON_UP() as Bitmap).bitmapData;  //jenom credits
			optionsButtonBitmapData2 = (new Resources.MENU_BUTTON_DOWN() as Bitmap).bitmapData;
			optionsButton.addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			optionsButton.addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			optionsButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			optionsButtonBitmap.bitmapData = optionsButtonBitmapData1;
			addChild(optionsButton);
			optionsButton.addChild(optionsButtonBitmap);
			optionsButton.x = 200;
			optionsButton.y = 300;
			optionsButton.name = "options";
			optionsButtonBitmap.bitmapData = optionsButtonBitmapData1;
			
			czechButtonBitmapData1 = (new Resources.LANGCZECH() as Bitmap).bitmapData;  //jenom tlačítko pro češtinu
			czechButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			czechButtonBitmap.bitmapData = czechButtonBitmapData1;
			addChild(czechButton);
			czechButton.addChild(czechButtonBitmap);
			czechButton.x = 20;
			czechButton.y = 500;
			czechButton.name = "czech";
			
			
			englishButtonBitmapData1 = (new Resources.LANGENG as Bitmap).bitmapData;  //jenom tlačítko pro inglištinu
			englishButton.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			englishButtonBitmap.bitmapData = englishButtonBitmapData1;
			addChild(englishButton);
			englishButton.addChild(englishButtonBitmap);
			englishButton.x = 100;
			englishButton.y = 500;
			englishButton.name = "english";
			
			creditstext.text = "tady jsou naše jména apod... zejtraa si s tím pohraju";
			creditstext.name = "creditstext";


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
			
				case "options":
					optionsMouseOver = false;
					optionsButtonBitmap.bitmapData = optionsButtonBitmapData2;
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
			
				case "options":
					optionsMouseOver = false;
					optionsButtonBitmap.bitmapData = optionsButtonBitmapData1;
				break;
				
			}
				
		
		
		}
		
		private function MouseUp (e:MouseEvent):void
		{
		
			switch ((e.target as Sprite).name) //toto dělá že když se a to klikne tak že to něco udělá ,přidá playState a smaže se
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
						var creditsBackGround:Bitmap = new Resources.OBRCREDITS();
						creditsBackGround.name = "creditsBackGround";
						addChild(creditsBackGround);
						buttonsActive = false;
					
						addChild(creditstext);
						creditstext.name = "creditstext";
						creditstext.x = 50;
						creditstext.y = 50;
						
						creditsCloseButtonBitmapData1 = (new Resources.MENU_STIT() as Bitmap).bitmapData;  //jenom credits
						creditsCloseButtonBitmapData2 = (new Resources.MENU_STIT() as Bitmap).bitmapData;
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
					removeChild(creditstext);
				break;
			
				case "options":
				
				//dunno co teď? plz. Valve upgrad tis 
				// budem chtít vytvořit nový tlačítka (i z obrázkem které přkrejou ty minulé tlačítka?) nebo to prostě udělá nějakou magii?
				//můj nápad:překrýt to jiným pozadím a vytvořit nový tlačítka jako v credits, poté jedním tlačítkem pozadí (i s tlačítky smáznout) 
				//a nebo udělat novou classu option která při vytvoření sama vytvoří pozadí a vygeneruje tlačítka (s nastavením úžasnosti a hlasitosti a kdoví co ještě)
				
				break;	
				
				case "czech":
					if (buttonsActive)
					{
						languageczech = true;
					}
				break;
				
				case "english":
					if (buttonsActive)
					{
						languageczech = false;
					}
				break;
			}
				
		
		
		}
	}


}
