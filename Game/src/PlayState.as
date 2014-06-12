package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	
	/**
	 * ...
	 * @author Zoovoj
	 */
	public class PlayState extends Sprite
	{
		public var tileSet:BitmapArray;
		public var tileMap:Array = new Array();
		public var tilesPerRow:uint = 20;
		public var tileSolid:int = 2;
		public var player:Player = new Player();
		public var solidTiles:Array = new Array();
		
		
		
		public function PlayState() 
		{
			tileSet=new BitmapArray(Resources.TILE_SET_1, 40)
			tileMap = 
		   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,2,2,2,2,1,1,1,2,1,1,1,1,1,2,2,2,2,2,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,1,1,
			2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,1,1,1,1,1,
			1,1,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,
			2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
			
			for (var i:int = 0; i < tileMap.length; i++) 
			{
				var tile:Bitmap = new Bitmap(tileSet.bitmaps[tileMap[i]]);
				tile.x = (i % tilesPerRow) * 40;
				tile.y = Math.floor(i / 20) * 40;
				if (!(tileMap[i] < tileSolid))
				{
					solidTiles.push(new Bitmap(tileSet.bitmaps[tileMap[i]]));
				}				
								
				addChild(tile);
			}
			
			
			player.x = 120;
			player.y = 100;
			addChild(player);
			
			
		}
		public function checkCollision(obj:Bitmap,xMove:Number,yMove:Number):Number
		{
			var fXMove:Number = xMove;
			var fYMove:Number = yMove;
			for (var i:int = 0; i < solidTiles.length ; i++) 
			{
				if (solidTiles[i].x-39<(obj.x + xMove)<solidTiles[i].x+40)
				{
					var cMove:Number = xMove;
					if (xMove>0)
					{
						cMove = obj.x - solidTiles[i].x - 40;
					}
					else
					{
						cMove = obj.x - solidTiles[i].x + 41;
					}
					if (cMove < fXMove)
					{
						fXMove = cMove;
					}
					
				}
			}
		}
		
		
	}

}