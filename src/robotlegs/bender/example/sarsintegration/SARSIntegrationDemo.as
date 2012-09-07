package robotlegs.bender.example.sarsintegration
{
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.core.managers.Stage3DManager;
	import away3d.core.managers.Stage3DProxy;
	import away3d.debug.AwayStats;
	import away3d.debug.Trident;
	import away3d.events.Stage3DEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.SARSBundle;
	import robotlegs.bender.example.sarsintegration.config.Config;
	import robotlegs.bender.example.sarsintegration.views.MainApplication;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import starling.core.Starling;
	
	public class SARSIntegrationDemo extends Sprite
	{
		
		//---------------------------------------------------------------
		// Away3D variables
		//---------------------------------------------------------------
		
		private var _view:View3D;
		private var _camera:Camera3D;
		private var _scene:Scene3D;
		private var _cameraController:HoverController;
		private var _stats:AwayStats;
		private var _trident:Trident;
		
		//---------------------------------------------------------------
		// Starling variables
		//---------------------------------------------------------------
		
		private var _starling:Starling;
		
		//---------------------------------------------------------------
		// Common variables
		//---------------------------------------------------------------
		
		private var _stage3DManager:Stage3DManager;
		private var _stage3DProxy:Stage3DProxy;
		private var _context:IContext;
		
		//---------------------------------------------------------------
		// Constructor
		//---------------------------------------------------------------
		
		public function SARSIntegrationDemo()
		{
			super();
			addEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//---------------------------------------------------------------
		// Private methods
		//---------------------------------------------------------------
		
		private function onAddedToStage(event:flash.events.Event):void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_stage3DManager = Stage3DManager.getInstance(stage);
			
			_stage3DProxy = _stage3DManager.getFreeStage3DProxy();
			_stage3DProxy.addEventListener(Stage3DEvent.CONTEXT3D_CREATED, onCreate);
		}
		
		private function onCreate(event:Stage3DEvent):void
		{
			initAway3D();
			initStarling();
			
			_context = new Context();
			
			_context.extend(SARSBundle).configure(_view, _starling, Config, this);
			
			stage.addEventListener( flash.events.Event.RESIZE, onResize, false, 0, true );
			stage.addEventListener( flash.events.Event.ENTER_FRAME, onEnterFrame, false, 0, true );
		}
		
		private function initAway3D():void
		{
//			Setup Scene
			_scene = new Scene3D();
			
//			Setup Camera
			_camera = new Camera3D();
			_camera.z = -600;
			_camera.y = 500;
			
//			Setup view
			_view = new View3D();
			_view.camera = _camera;
			_view.scene = _scene;
			_view.stage3DProxy = _stage3DProxy;
			_view.shareContext = true;
			addChild(_view);
			
//			Setup a HoverController (aka HoverCamera3D in older versions of Away3D)
			_cameraController = new HoverController(_camera, null, 150, 10, 2000);
			
//			Show Away3D stats
			_stats = new AwayStats(_view,true);
			_stats.mouseEnabled = false;
			_stats.x = 5;
			_stats.y = 5;
			this.addChild(_stats);
			
			_trident = new Trident();
			_trident.mouseEnabled = false;
			_view.scene.addChild(_trident);
		}
		
		private function initStarling():void
		{
			_starling = new Starling(MainApplication, stage, _stage3DProxy.viewPort, _stage3DProxy.stage3D);
			
			_starling.start();
		}
		
		private function onResize( event:flash.events.Event = null ):void
		{
			_view.width = stage.stageWidth;
			_view.height = stage.stageHeight;
		}
		
		private function onEnterFrame( event:flash.events.Event ):void
		{
			_stage3DProxy.clear();
			
			_view.render();
			
			_starling.nextFrame();
			
			_stage3DProxy.present();
		}
	}
}