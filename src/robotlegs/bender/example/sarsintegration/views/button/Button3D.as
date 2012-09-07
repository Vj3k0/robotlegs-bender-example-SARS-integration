package robotlegs.bender.example.sarsintegration.views.button
{
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.entities.Sprite3D;
	import away3d.events.MouseEvent3D;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MaterialBase;
	import away3d.primitives.PlaneGeometry;
	
	import org.osflash.signals.Signal;
	
	public class Button3D extends ObjectContainer3D implements IButton
	{
		//---------------------------------------------------------------
		// Variables
		//---------------------------------------------------------------
		
		private var _triggered:Signal;
		private var _mesh:Mesh;
		private var _planeGeometry:PlaneGeometry;
		private var _material:ColorMaterial;
		
		//---------------------------------------------------------------
		// Constructor
		//---------------------------------------------------------------
		
		public function Button3D()
		{
			super();
			
			_triggered = new Signal();
			
//			Create view when object is create
			_planeGeometry = new PlaneGeometry(700, 700);
			_material = new ColorMaterial(0xFF0000);
			_mesh = new Mesh(_planeGeometry, _material);
			_mesh.mouseEnabled = true;
			_planeGeometry = null;
			addChild(_mesh);
			
			_mesh.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown, false, 0, true);
			updateColor(Math.random() * 0xFFFFFF);
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
			_material.color = color;
		}
		
		//---------------------------------------------------------------
		// Private methods
		//---------------------------------------------------------------
		
		private function onMouseDown(event:MouseEvent3D):void
		{
			_triggered.dispatch("Button 3D triggered");
		}
		
		
	}
}