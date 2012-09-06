package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import robotlegs.bender.example.sarsintegration.SARSIntegrationDemo;
	
	public class SARSIntegration extends Sprite
	{
		public function SARSIntegration()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addChild(new SARSIntegrationDemo());
		}
	}
}