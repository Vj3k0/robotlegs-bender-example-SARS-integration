package robotlegs.bender.example.sarsintegration.views.button
{
	import flash.display.BitmapData;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Button2D extends Sprite implements IButton
	{
		//---------------------------------------------------------------
		// Variables
		//---------------------------------------------------------------
		
		private var _triggered:Signal;
		private var _image:Image;
		
		public function Button2D()
		{
			super();
			
			_triggered = new Signal();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function get triggered():Signal
		{
			return _triggered;
		}
		
		public function updateColor(color:uint):void
		{
			_image.texture = Texture.fromBitmapData(drawRandomColoredRectangle(color));
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			init();
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			kill();
		}
		
		protected function init():void
		{
			_image = new Image(Texture.fromBitmapData(drawRandomColoredRectangle(Math.random() * 0xFFFFFF)));
			_image.useHandCursor = true;
			_image.addEventListener(TouchEvent.TOUCH, handleTouch);
			addChild(_image);
		}
		
		protected function kill():void
		{
			_image.removeEventListener(TouchEvent.TOUCH, handleTouch);
			removeChild(_image, true);
		}
		
		private function drawRandomColoredRectangle(color:uint):BitmapData
		{
			var gfx:flash.display.Sprite = new flash.display.Sprite();
			gfx.graphics.beginFill(color);
			gfx.graphics.drawRect(0, 0, 100, 100);
			gfx.graphics.endFill();
			var bd:BitmapData = new BitmapData(100, 100, true, 0xFF0000);
			bd.draw(gfx);
			return bd;
		}
		
		private function handleTouch(event:TouchEvent):void
		{
			if (Touch(event.touches[0]).phase == TouchPhase.BEGAN)
				_triggered.dispatch("Button 2D triggered");
		}
		
	}
}