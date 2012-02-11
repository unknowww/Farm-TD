package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var optionsButton:FlxButton;
		private var instructionsButton:FlxButton;

		public function MenuState()
		{
		}

		override public function create():void
		{
			FlxG.mouse.show();
			startButton = new FlxButton(120, 90, "Start Game", startGame);
			optionsButton = new FlxButton(120, 120, "Options", options);
			instructionsButton = new FlxButton(120, 150, "Instructions", instructions);
			add(startButton);
			add(optionsButton);
			add(instructionsButton);
		}

		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
		private function options():void
		{
			//possible add a new source file where player can edit options
		}
		private function instructions():void
		{
			//display instructions
		}
	}
}