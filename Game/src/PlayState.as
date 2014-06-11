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
	 * @author Suvoj
	 */
	public class PlayState extends Sprite
	{
		public var tileSet:BitmapArray;
		public var tileMap:Array = new Array();
		public var tilesPerRow:uint = 20;
		public var tileSolid:int = 2;
		public var player:Player = new Player();
		
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
				addChild(tile);
			}
			
			player.x = 120;
			player.y = 160;
			addChild(player);
		}
		
	}

}