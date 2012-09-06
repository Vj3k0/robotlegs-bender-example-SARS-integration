package robotlegs.bender.example.sarsintegration.config
{
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;

	public class Config
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var context:IContext;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		[Inject]
		public var injector:Injector;
		
		[Inject]
		public var contextView:DisplayObjectContainer;
		
		//---------------------------------------------------------------
		// Configuration
		//---------------------------------------------------------------
		
		[PostConstruct]
		public function init():void
		{
			context.logLevel = LogLevel.DEBUG;
			
			
			context.lifecycle.afterInitializing(initComplete);
		}
		
		private function initComplete():void
		{
		}
	}
}