package robotlegs.bender.example.sarsintegration.views.button
{
	import org.osflash.signals.Signal;

	public interface IButton
	{
		function get triggered():Signal;
		
		function updateColor(color:uint):void;
	}
}