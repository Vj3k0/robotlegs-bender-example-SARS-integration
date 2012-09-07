package robotlegs.bender.example.sarsintegration.commands
{
	import away3d.containers.View3D;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.example.sarsintegration.views.button.Button2D;
	import robotlegs.bender.example.sarsintegration.views.button.Button3D;
	
	import starling.display.DisplayObjectContainer;
	
	public class SetupCommand extends Command
	{
		[Inject]
		public var view3D:View3D;
		
		[Inject]
		public var starlingContextView:DisplayObjectContainer;
		
		override public function execute():void
		{
			setupAway3DDisplay();
			setupStarlingDisplay();
		}
		
		private function setupAway3DDisplay():void
		{
			view3D.scene.addChild(new Button3D());
		}
		
		private function setupStarlingDisplay():void
		{
			starlingContextView.addChild(new Button2D());
		}
		
	}
}