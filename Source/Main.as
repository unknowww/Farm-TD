package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	/**
	 * ...
	 * @author DAGOEA STUDIOUS
	 */

	 
	public class Main extends Sprite 
	{
		
		//these set how high and wide the blocks of the map are
		private var WIDTH:int = 64;
		private var HEIGHT:int = 64;
		
		
		//code for importing images
		[Embed(source="../Images/grass.png")]
		private var GrassClass:Class;
		
		[Embed(source="../Images/path.png")]
		private var PathClass:Class;
		
		[Embed(source="../Images/enemy.png")]
		private var EnemyClass:Class;
		
		//create the image files currently in use
		public var image:Bitmap = new GrassClass(); 
		public var path:Bitmap = new PathClass();
		public var enemy:Bitmap = new EnemyClass();
		
		//create a player object of type player class
		public var player:Player;
		
		
		//create map array - 1 is a road, 0 is grass(aka unwalkable)
		private var map:Array = new Array(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
									      0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
										  0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0,
										  0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0,
										  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
										  0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0,
										  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
										  1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0);

		//frame counter
		public var Frames:int = 0;
		
		//text field for frame counter
		public var frameText:TextField = new TextField(); 
		
		public function Main():void 
		{
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
				
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// add the event listeners
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

			//trace to keep track of the stage
			trace(stage.stageWidth);

			this.addChild(frameText);//display frame count
			generateMap(map);
			//this.addChild(player.playerImage);

		
		}
		
		private function generateMap(mapSize:Array):void
		{
			//these control the amount every square is placed away from the next one
			var yAmount:int = HEIGHT;
			var xAmount:int = WIDTH;
			
			//loop through all of the array
			for (var i:int = 0; i < mapSize.length; i++)
			{
				//coordinates for each square
				var xCoord:int;
				var yCoord:int;
				//a bitmap which will be set either to grass or road
				var type:Bitmap;
				
				//every 13th square(aka new row), go down by HEIGHT
				if ((i % 13 == 0) && (i != 0))
					yAmount += HEIGHT;
					
				yCoord = yAmount;
				//place each square an exact distance away from each other
				xCoord = (i % 13) * xAmount;
				
				//0 = place grass
				if (mapSize[i] == 0)
				{
					type = new GrassClass();
					type.x = xCoord;
					type.y = yCoord;
				}
				//else(1) place road
				else
				{
					type = new PathClass();	
					type.x = xCoord;
					type.y = yCoord;
				}
				//add it to the stage
				this.addChild(type);
			}
		}
		private function enemyTrace(map:Array):void
		{
			//placeholder
		}
		private function update(event:Event):void
		{
		    //trace("update");
			frameText.text = "Frames: " + (Frames++);
			
		}
		private function onClick (event:MouseEvent):void
		{
		    //trace("onClick");

		}
		private function mouseMoveHandler (event:MouseEvent):void
		{
			//trace("mouseMoving");
		}
		private function onKeyDown (event:KeyboardEvent):void
		{
		    //trace("space is down");
			if (event.keyCode == Keyboard.A)
			{
				player.x--;
			}
			if (event.keyCode == Keyboard.D)
			{
				player.x++;
			}
		}

		
	}
}	