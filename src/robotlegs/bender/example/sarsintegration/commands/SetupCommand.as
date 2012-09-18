package robotlegs.bender.example.sarsintegration.commands
{
	import away3d.containers.View3D;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.example.sarsintegration.views.button.Button2D;
	import robotlegs.bender.example.sarsintegration.views.button.Button3D;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class SetupCommand extends Command
	{
		[Inject]
		public var view3D:View3D;
		
		[Inject(name="ui")]
		public var starlingUI:starling.display.DisplayObjectContainer;
		
		[Inject(name="background")]
		public var starlingBackground:starling.display.DisplayObjectContainer;
		
		override public function execute():void
		{
			create3DButton();
			create2DButton();
			createBackground();
		}
		
		private function create3DButton():void
		{
			view3D.scene.addChild(new Button3D());
		}
		
		private function create2DButton():void
		{
			starlingUI.addChild(new Button2D());
		}
		
		private function createBackground():void
		{
			var gfx:flash.display.Sprite = new flash.display.Sprite();
			gfx.graphics.beginFill(0xFFFF00);
			gfx.graphics.drawRect(0, 0, 300, 300);
			gfx.graphics.endFill();
			
			var bd:BitmapData = new BitmapData(300, 300);
			bd.draw(gfx);
			
			var image:Image = new Image(Texture.fromBitmapData(bd));
			image.x = 50;
			image.y = 50;
			starlingBackground.addChild(image);
		}
		
	}
}