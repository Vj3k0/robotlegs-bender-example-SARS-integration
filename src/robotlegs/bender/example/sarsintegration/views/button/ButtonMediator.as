package robotlegs.bender.example.sarsintegration.views.button
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.example.sarsintegration.signals.ButtonActivated;
	import robotlegs.bender.framework.api.ILogger;
	
	public class ButtonMediator extends Mediator
	{
		
		//---------------------------------------------------------------
		// Injections
		//---------------------------------------------------------------
		
		[Inject]
		public var view:IButton;
		
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var buttonActivated:ButtonActivated;
		
		
		override public function initialize():void
		{
			super.initialize();
			
			view.triggered.add(onTriggered);
		}
		
		private function onTriggered(message:String):void
		{
			logger.debug(message);
			buttonActivated.dispatch(view);
		}
		
		
		
	}
}