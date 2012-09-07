package robotlegs.bender.example.sarsintegration.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.example.sarsintegration.views.button.IButton;
	
	public class ChangeButtonColorCommand extends Command
	{
		[Inject]
		public var button:IButton;
		
		override public function execute():void
		{
			button.updateColor(Math.random() * 0xFFFFFF);
		}
		
		
	}
}