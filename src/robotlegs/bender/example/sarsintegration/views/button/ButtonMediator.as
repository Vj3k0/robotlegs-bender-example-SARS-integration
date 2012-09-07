package robotlegs.bender.example.sarsintegration.views.button
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.api.ILogger;
	
	public class ButtonMediator extends Mediator
	{
		
		//---------------------------------------------------------------
		// Injections
		//---------------------------------------------------------------
		
		[Inject]
		public var view:IButton;
		
		[Inject]
		public var _logger:ILogger;
		
		override public function initialize():void
		{
			super.initialize();
			
			view.triggered.add(onTriggered);
		}
		
		private function onTriggered(message:String):void
		{
			_logger.debug(message);
		}
		
		
		
	}
}