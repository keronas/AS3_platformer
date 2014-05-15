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
	
	public class Main extends Sprite 
	{
		//public var mLoader:Loader = new Loader();
		[Embed(source = "ColorsSurvivalStartUp.png")] protected var startUpPNG:Class;
		[Embed(source = "ColorsSurvivalEnding.png")] protected var endingPNG:Class;
		public var player1:Player;
		public var player2:Player;
		public var player3:Player;
		public var enemy_spawner1:EnemySpawner;
		public var active_icon1:ActiveIcon;
		public var active_icon2:ActiveIcon;
		public var active_icon3:ActiveIcon;
		public var active_key1:TextField;
		public var active_key2:TextField;
		public var active_key3:TextField;
		public var active_highlight:Sprite;
		public var bottom_bar:Sprite;
		public var game_area:Sprite;
		public var active_player:uint;
		public var timer_text:TextField;
		public var startUpBitmap:Bitmap;
		public var endingBitmap:Bitmap;
		public var startUp:Sprite = new Sprite();
		public var ending:Sprite = new Sprite();
		public var is_starting:Boolean = true;
		
		public var up_down:Boolean = false;
		public var down_down:Boolean = false;
		public var left_down:Boolean = false;
		public var right_down:Boolean = false;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, StartGame);
			
			
			//mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onBitmapLoaderComplete);
			//mLoader.load(new URLRequest("../src/ColorsSurvivalStartUp.png"));
			startUpBitmap = new startUpPNG();
			endingBitmap = new endingPNG();
			
			
			startUp.graphics.beginFill(0x000000, 0.05);
			startUp.graphics.drawRect(0, 0, 800, 600);
			startUp.graphics.beginBitmapFill(startUpBitmap.bitmapData);
			startUp.graphics.drawRect(0, 0, 800, 600);
			addChild(startUp);
			
			ending.graphics.beginFill(0x000000, 0.05);
			ending.graphics.drawRect(0, 0, 800, 600);
			ending.graphics.beginBitmapFill(endingBitmap.bitmapData);
			ending.graphics.drawRect(0, 0, 800, 600);
			
			/*player1.x = 370;
			player1.y = 302;
			player2.x = 386;
			player2.y = 270;
			player3.x = 402;
			player3.y = 302;
			
			active_icon1.x = 150;
			active_icon1.y = 550;
			active_icon2.x = 350;
			active_icon2.y = 550;
			active_icon3.x = 550;
			active_icon3.y = 550;
			
			active_key1.text = "1";
			active_key1.scaleX = 2.5;
			active_key1.scaleY = 2.5;
			active_key1.x = 200 - 11;
			active_key1.y = 560;
			active_key2.text = "2";
			active_key2.scaleX = 2.5;
			active_key2.scaleY = 2.5;
			active_key2.x = 400 - 11;
			active_key2.y = 560;
			active_key3.text = "3";
			active_key3.scaleX = 2.5;
			active_key3.scaleY = 2.5;
			active_key3.x = 600 - 11;
			active_key3.y = 560;
			
			active_highlight.y = 560;
			active_highlight.x = 150;
			active_highlight.graphics.beginFill(0xFFFF22);
			active_highlight.graphics.drawRect(0, 0, 100, 40);
			
			bottom_bar.y = 548;
			bottom_bar.graphics.beginFill(0xF8F8F8);
			bottom_bar.graphics.drawRect(0, 0, 800, 151);
			bottom_bar.graphics.beginFill(0xAAAAAA);
			bottom_bar.graphics.drawRect(0, 0, 800, 1);
			
			game_area.graphics.lineStyle(3, 0xAAAAAA);
			game_area.graphics.drawRect(0, 0, 800, 548);
			
			timer_text.text = "Time: 0";
			timer_text.scaleX = 2;
			timer_text.scaleY = 1.8;*/
			
		}
		
		public function addGameListeners():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
			stage.addEventListener(Event.ENTER_FRAME, GameLoop);
		}
		
		public function addGameObjects():void
		{
			addChild(timer_text);
			addChild(player1);
			addChild(player2);
			addChild(player3);
			addChild(bottom_bar);
			addChild(active_highlight);
			addChild(active_icon1);
			addChild(active_icon2);
			addChild(active_icon3);
			addChild(active_key1);
			addChild(active_key2);
			addChild(active_key3);
			addChild(enemy_spawner1);
			addChild(game_area);
			this.setChildIndex(enemy_spawner1, 0);
			this.setChildIndex(game_area, 1);
		}
		
		public function StartGame(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				trace("Starting new game");
				SetDefaultGameValues();
				addGameListeners();
				addGameObjects();
				
				if (is_starting)
				{
					removeChild(startUp);
					is_starting = false;
				}
				else
				{
					removeChild(ending);
				}
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, StartGame);
			}
		}
		
		public function SetDefaultGameValues():void
		{
			if (!is_starting)
			{
				removeChild(timer_text);
			}
			player1 = new Player(1);
			player2 = new Player(2);
			player3 = new Player(3);
			enemy_spawner1 = new EnemySpawner();
			active_icon1 = new ActiveIcon(1);
			active_icon2 = new ActiveIcon(2);
			active_icon3 = new ActiveIcon(3);
			active_key1 = new TextField();
			active_key2 = new TextField();
			active_key3 = new TextField();
			active_highlight = new Sprite();
			bottom_bar = new Sprite();
			game_area = new Sprite();
			active_player = 1;
			timer_text = new TextField();
			
			up_down = false;
			down_down = false;
			left_down = false;
			right_down = false;
			
			// ***********
			
			player1.x = 370;
			player1.y = 302;
			player2.x = 386;
			player2.y = 270;
			player3.x = 402;
			player3.y = 302;
			
			active_icon1.x = 150;
			active_icon1.y = 550;
			active_icon2.x = 350;
			active_icon2.y = 550;
			active_icon3.x = 550;
			active_icon3.y = 550;
			
			active_key1.text = "1";
			active_key1.scaleX = 2.5;
			active_key1.scaleY = 2.5;
			active_key1.x = 200 - 11;
			active_key1.y = 560;
			active_key2.text = "2";
			active_key2.scaleX = 2.5;
			active_key2.scaleY = 2.5;
			active_key2.x = 400 - 11;
			active_key2.y = 560;
			active_key3.text = "3";
			active_key3.scaleX = 2.5;
			active_key3.scaleY = 2.5;
			active_key3.x = 600 - 11;
			active_key3.y = 560;
			
			active_highlight.y = 560;
			active_highlight.x = 150;
			active_highlight.graphics.beginFill(0xFFFF22);
			active_highlight.graphics.drawRect(0, 0, 100, 40);
			
			bottom_bar.y = 548;
			bottom_bar.graphics.beginFill(0xF8F8F8);
			bottom_bar.graphics.drawRect(0, 0, 800, 151);
			bottom_bar.graphics.beginFill(0xAAAAAA);
			bottom_bar.graphics.drawRect(0, 0, 800, 1);
			
			game_area.graphics.lineStyle(3, 0xAAAAAA);
			game_area.graphics.drawRect(0, 0, 800, 548);
			
			timer_text.text = "Time: 0";
			timer_text.scaleX = 2;
			timer_text.scaleY = 1.8;
			if (is_starting)
			{
				addChild(timer_text);
			}
			
		}
		
		public function KeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.UP:
					up_down = true;
				break;
				case Keyboard.DOWN:
					down_down = true;
				break;
				case Keyboard.LEFT:
					left_down = true;
				break;
				case Keyboard.RIGHT:
					right_down = true;
				break;
				
				case Keyboard.NUMBER_1:
					active_player = 1;
					active_highlight.x = 150;
				break;
				case Keyboard.NUMBER_2:
					active_player = 2;
					active_highlight.x = 350;
				break;
				case Keyboard.NUMBER_3:
					active_player = 3;
					active_highlight.x = 550;
				break;
			}
		}
		
		public function KeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.UP:
					up_down = false;
				break;
				case Keyboard.DOWN:
					down_down = false;
				break;
				case Keyboard.LEFT:
					left_down = false;
				break;
				case Keyboard.RIGHT:
					right_down = false;
				break;
			}
		}
		
		public function GameLoop(e:Event):void
		{
			timer_text.text = "Time: " + Math.floor(enemy_spawner1.level_timer / 60);
			if (down_down) 
			{
				switch (active_player) 
				{
					case 1:
						if (CheckMoveCollision(2, player1, player2, player1.speed) == false && CheckMoveCollision(2, player1, player3, player1.speed) == false && player1.y <= 520 - player1.speed) 
						{
							player1.y += player1.speed;
						}
					break;
					case 2:
						if (CheckMoveCollision(2, player2, player1, player2.speed) == false && CheckMoveCollision(2, player2, player3, player2.speed) == false && player2.y <= 520 - player2.speed) 
						{
							player2.y += player2.speed;
						}
					break;
					case 3:
						if (CheckMoveCollision(2, player3, player1, player3.speed) == false && CheckMoveCollision(2, player3, player2, player3.speed) == false && player3.y <= 520 - player3.speed) 
						{
							player3.y += player3.speed;
						}
					break;
				}
			}
			
			if (up_down) 
			{
				switch (active_player) 
				{
					case 1:
						if (CheckMoveCollision(1, player1, player2, player1.speed) == false && CheckMoveCollision(1, player1, player3, player1.speed) == false && player1.y >= player1.speed)
						{
							player1.y -= player1.speed;
						}
					break;
					case 2:
						if (CheckMoveCollision(1, player2, player1, player2.speed) == false && CheckMoveCollision(1, player2, player3, player2.speed) == false && player2.y >= player2.speed) 
						{
							player2.y -= player2.speed;
						}
					break;
					case 3:
						if (CheckMoveCollision(1, player3, player1, player3.speed) == false && CheckMoveCollision(1, player3, player2, player3.speed) == false && player3.y >= player3.speed) 
						{
							player3.y -= player3.speed;
						}
					break;
					
				}
			}
			
			if (left_down) 
			{
				switch (active_player) 
				{
					case 1:
						if (CheckMoveCollision(3, player1, player2, player1.speed) == false && CheckMoveCollision(3, player1, player3, player1.speed) == false && player1.x >= player1.speed) 
						{
							player1.x -= player1.speed;
						}
					break;
					case 2:
						if (CheckMoveCollision(3, player2, player1, player2.speed) == false && CheckMoveCollision(3, player2, player3, player2.speed) == false && player2.x >= player2.speed) 
						{
							player2.x -= player2.speed;
						}
					break;
					case 3:
						if (CheckMoveCollision(3, player3, player1, player3.speed) == false && CheckMoveCollision(3, player3, player2, player3.speed) == false && player3.x >= player3.speed) 
						{
							player3.x -= player3.speed;
						}
					break;
				}
			}
			
			if (right_down) 
			{
				switch (active_player) 
				{
					case 1:
						if (CheckMoveCollision(4, player1, player2, player1.speed) == false && CheckMoveCollision(4, player1, player3, player1.speed) == false && player1.x <= 772 - player1.speed) 
						{
							player1.x += player1.speed;
						}
					break;
					case 2:
						if (CheckMoveCollision(4, player2, player1, player2.speed) == false && CheckMoveCollision(4, player2, player3, player2.speed) == false && player2.x <= 772 - player2.speed) 
						{
							player2.x += player2.speed;
						}
					break;
					case 3:
						if (CheckMoveCollision(4, player3, player1, player3.speed) == false && CheckMoveCollision(4, player3, player2, player3.speed) == false && player3.x <= 772 - player3.speed) 
						{
							player3.x += player3.speed;
						}
					break;
				}
			}
			
		}
		
		public function CheckMoveCollision(way:uint, playerA:Player, playerB:Player, speed:Number):Boolean
		{
			var check:Boolean = false;
			switch (way) 
			{
				case 1:
					if (playerB.x > playerA.x - 28 && playerB.x < playerA.x + 28) 
					{
						if (playerB.y > playerA.y - (28+speed) && playerB.y < playerA.y + 28) 
						{
							check = true
						}
					}
					else 
					{
						check = false
					}
				break;
				
				case 2:
					if (playerB.x > playerA.x - 28 && playerB.x < playerA.x + 28) 
					{
						if (playerB.y < playerA.y + (28+speed) && playerB.y > playerA.y - 28) 
						{
							check = true
						}
					}
					else 
					{
						check = false
					}
				break;
				
				case 3:
					if (playerB.y > playerA.y - 28 && playerB.y < playerA.y + 28) 
					{
						if (playerB.x < playerA.x + 28 && playerB.x > playerA.x - (28+speed)) 
						{
							check = true
						}
					}
					else 
					{
						check = false
					}
				break;
				
				case 4:
					if (playerB.y > playerA.y - 28 && playerB.y < playerA.y + 28) 
					{
						if (playerB.x > playerA.x - 28 && playerB.x < playerA.x + (28+speed)) 
						{
							check = true
						}
					}
					else 
					{
						check = false
					}
				break;
			}
			return check;
		}
		
		public function CheckEnemyCollision(enemy:Sprite, player:uint):Boolean 
		{
			var check:Boolean = false;
			switch (player) 
			{
				case 1:
					check = enemy.hitTestObject(player1);
				break;
				case 2:
					check = enemy.hitTestObject(player2);
				break;
				case 3:
					check = enemy.hitTestObject(player3);
				break;
			}
			return check;
			
		}
		public function GameOver():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_UP, KeyUp);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.removeEventListener(Event.ENTER_FRAME, GameLoop);
			
			addChild(ending);
			timer_text.x = 410;
			timer_text.y = 211;
			timer_text.scaleX = 2.3;
			timer_text.scaleY = 2.3;
			timer_text.antiAliasType = "advanced";
			timer_text.text = Math.floor(enemy_spawner1.level_timer / 60) + " seconds"
			
			removeChild(player1);
			removeChild(player2);
			removeChild(player3);
			removeChild(bottom_bar);
			removeChild(active_highlight);
			removeChild(active_icon1);
			removeChild(active_icon2);
			removeChild(active_icon3);
			removeChild(active_key1);
			removeChild(active_key2);
			removeChild(active_key3);
			removeChild(enemy_spawner1);
			//removeChild(timer_text);
			removeChild(game_area);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, StartGame);
			trace("GAME OVER NOOB");
		}
	}
	
}