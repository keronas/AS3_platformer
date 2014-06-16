package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	/**
	 * ...
	 * @author Suvoj
	 */
	public class Player extends Bitmap
	{
				
		public var ySpeed:Number = 0;
		public var xSpeed:Number = 0;
		
		public function Player() 
		{
			this.bitmapData = (new Resources.PLAYER_STAND() as Bitmap).bitmapData;			
			addEventListener(Event.ENTER_FRAME, EnterFrame);
		}
		public function EnterFrame(evt:Event):void
			{
				ySpeed += 0.4;
				ySpeed = (parent as PlayState).CheckCollision(this, true, ySpeed)
				y += ySpeed;
				if (KeyboardListener.spaceDown && (parent as PlayState).CheckCollision(this, true, 0.1) == 0)
				{
					ySpeed = -11;
				}
				
				
				xSpeed = 0;
				if (KeyboardListener.leftDown)
				{
					xSpeed += (parent as PlayState).CheckCollision(this, false, -3);
					
				}
				
				if (KeyboardListener.rightDown)
				{
					xSpeed += (parent as PlayState).CheckCollision(this, false, 3);
					
				}
				x += xSpeed;
			}
		
	}

}