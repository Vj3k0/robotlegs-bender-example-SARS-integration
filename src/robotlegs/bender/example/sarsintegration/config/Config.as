package robotlegs.bender.example.sarsintegration.config
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.example.sarsintegration.commands.ChangeButtonColorCommand;
	import robotlegs.bender.example.sarsintegration.commands.SetupCommand;
	import robotlegs.bender.example.sarsintegration.signals.ButtonActivated;
	import robotlegs.bender.example.sarsintegration.signals.PerformSetup;
	import robotlegs.bender.example.sarsintegration.views.IMainApplication;
	import robotlegs.bender.example.sarsintegration.views.MainApplicationMediator;
	import robotlegs.bender.example.sarsintegration.views.button.ButtonMediator;
	import robotlegs.bender.example.sarsintegration.views.button.IButton;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;

	public class Config
	{
		[Inject]
		public var context:IContext;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		[Inject]
		public var injector:Injector;
		
		//---------------------------------------------------------------
		// Configuration
		//---------------------------------------------------------------
		
		[PostConstruct]
		public function init():void
		{
//            Provide fallback if something goes wrong...
            injector.fallbackProvider = new DefaultFallbackProvider();

			context.logLevel = LogLevel.DEBUG;

//            Hack since SignalCommandMap uses getInstance() instead od getOrCreateNewInstance()
//            which throws Error (ignore debug output from Logger)
            injector.map(ButtonActivated).asSingleton();
            injector.map(PerformSetup).asSingleton();

//			  Map commands

			commandMap.map(ButtonActivated).toCommand(ChangeButtonColorCommand);
			commandMap.map(PerformSetup, true).toCommand(SetupCommand);

//			  Map mediators

			mediatorMap.map(IButton).toMediator(ButtonMediator);
			mediatorMap.map(IMainApplication).toMediator(MainApplicationMediator);
		}
	}
}