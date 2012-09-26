package robotlegs.bender.example.sarsintegration.views.button
{
	import flash.display.BitmapData;
	
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.extensions.sarsIntegration.api.IDisplayObject;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Button2D extends Sprite implements IButton, IDisplayObject
	{
		//---------------------------------------------------------------
		// Variables
		//---------------------------------------------------------------
		
		private var _triggered:Signal;
		private var _image:Image;
		
		//---------------------------------------------------------------
		// Constructor
		//---------------------------------------------------------------
		
		public function Button2D()
		{
			super();
			
			_triggered = new Signal();
		}
		
		//---------------------------------------------------------------
		// Public methods
		//---------------------------------------------------------------
		
		public function get triggered():Signal
		{
			return _triggered;
		}
		
		public function updateColor(color:uint):void
		{
			_image.texture = Texture.fromBitmapData(drawRandomColoredRectangle(color));
		}
		
		public function init():void
		{
			_image = new Image(Texture.fromBitmapData(drawRandomColoredRectangle(Math.random() * 0xFFFFFF)));
			_image.useHandCursor = true;
			_image.addEventListener(TouchEvent.TOUCH, handleTouch);
			addChild(_image);
		}
		
		public function destroy():void
		{
			_image.removeEventListener(TouchEvent.TOUCH, handleTouch);
			removeChild(_image, true);
		}
		
		//---------------------------------------------------------------
		// Private methods
		//---------------------------------------------------------------
		
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