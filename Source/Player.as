package  
{
	import flash.display.Bitmap;

	/**
	 * ...
	 * @author DAGOEA STUDIOUS
	 */
	public class Player 
	{
		[Embed(source = "../Images/player.png")]
		private var PlayerImageClass:Class;	
		
		//what bitmap the player is going to be
		public var playerImage:Bitmap;
		
		//variables for the position
		public var x:int;
		public var y:int; 
		
		
		//constructor
		public function Player() 
		{
			x = y = 50;
			playerImage = new PlayerImageClass();
			playerImage.x = x;
			playerImage.y = y;
		}
		
	}

}