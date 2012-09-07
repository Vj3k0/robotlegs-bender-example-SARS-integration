package robotlegs.bender.example.sarsintegration.signals
{
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.example.sarsintegration.views.button.IButton;
	
	public class ButtonActivated extends Signal
	{
		public function ButtonActivated()
		{
			super(IButton);
		}
	}
}