package robotlegs.bender.example.sarsintegration.config
{
	import away3d.containers.View3D;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.example.sarsintegration.views.button.Button2D;
	import robotlegs.bender.example.sarsintegration.views.button.Button3D;
	import robotlegs.bender.example.sarsintegration.views.button.ButtonMediator;
	import robotlegs.bender.example.sarsintegration.views.button.IButton;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	
	import starling.display.DisplayObjectContainer;

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
		public var contextView:flash.display.DisplayObjectContainer;
		
		[Inject]
		public var starlingView:starling.display.DisplayObjectContainer;
		
		[Inject]
		public var view3D:View3D;
		
		//---------------------------------------------------------------
		// Configuration
		//---------------------------------------------------------------
		
		[PostConstruct]
		public function init():void
		{
			context.logLevel = LogLevel.DEBUG;
			
//			Map commands
			
			
			
//			Map mediators
			
			mediatorMap
			.map(IButton)
				.toMediator(ButtonMediator);
			
			context.lifecycle.afterInitializing(initComplete);
		}
		
		private function initComplete():void
		{
			starlingView.addChild(new Button2D());
			view3D.scene.addChild(new Button3D());
		}
	}
}