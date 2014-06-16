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
			
		   /*[1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,2,2,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1]*/
			trace(1);
			for (var i:int = 0; i < tileMap.length; i++) 
			{
				var tile:Bitmap = new Bitmap(tileSet.bitmaps[tileMap[i]]);
				tile.x = (i % tilesPerRow) * 40;
				tile.y = Math.floor(i / 20) * 40;
				
				if (tileMap[i] >= tileSolid)
				{
					solidTiles.push(tile);
				}				
				
				addChild(tile);
			}
			
			
			player.x = 400;
			player.y = 100;
			addChild(player);
			
			
		}
		public function CheckCollision(obj:Bitmap,YAxis:Boolean ,distance:Number):Number
		{
			var fDistance:Number = distance;
			if (YAxis) 
			{
				for (var i:int = 0; i < solidTiles.length ; i++) 
				{
					if ((solidTiles[i].x + 40) > obj.x && (solidTiles[i].x - 40) < obj.x && (obj.y + distance) < (solidTiles[i].y + 40) && (solidTiles[i].y - 40) < (obj.y + distance))
					{
						//trace(solidTiles[i].x-40, (obj.x + distance), solidTiles[i].x+40);
						var cMove:Number = distance;
						if (distance>0)
						{
							cMove = (solidTiles[i].y - 40) - obj.y;
							//trace(cMove);
						}
						else
						{
							cMove = (solidTiles[i].y + 40) - obj.y;
							//trace(cMove);
						}
						if (Math.abs(cMove) < Math.abs(fDistance))
						{
							fDistance = cMove;
						}
						
					}
					
				}
			}
			else 
			{
				for (var i:int = 0; i < solidTiles.length ; i++) 
				{
					if ((solidTiles[i].y + 40) > obj.y && (solidTiles[i].y - 40) < obj.y && (obj.x + distance) < (solidTiles[i].x + 40) && (solidTiles[i].x - 40) < (obj.x + distance))
					{
						//trace(solidTiles[i].x-40, (obj.x + distance), solidTiles[i].x+40);
						var cMove:Number = distance;
						if (distance>0)
						{
							cMove = (solidTiles[i].x - 40) - obj.x;
							//trace(cMove);
						}
						else
						{
							cMove = (solidTiles[i].x + 40) - obj.x;
							//trace(cMove);
						}
						if (Math.abs(cMove) < Math.abs(fDistance))
						{
							fDistance = cMove;
						}
						
					}
					
				}
				
			}
			return fDistance;
		}
		
		
	}

}