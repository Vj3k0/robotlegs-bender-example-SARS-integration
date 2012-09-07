package robotlegs.bender.example.sarsintegration.views
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.example.sarsintegration.signals.PerformSetup;
	
	public class MainApplicationMediator extends Mediator
	{
		[Inject]
		public var view:IMainApplication;
		
		[Inject]
		public var performSetup:PerformSetup;
		
		override public function initialize():void
		{
			super.initialize();
			
			performSetup.dispatch();
		}
		
	}
}