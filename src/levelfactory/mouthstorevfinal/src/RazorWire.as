package levelfactory.mouthstorevfinal.src
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Ricardo Limo
	 */
	public class RazorWire extends Tools
	{
		[Embed(source="assets/Store/RazorWire.png")]
		private const RAZORWIRE:Class;
		
		[Embed(source = "assets/Store/RazorWireGlow.png")]
		private const RAZORWIREGLOW:Class;
		
		public function RazorWire()
		{
			super(RAZORWIRE, RAZORWIREGLOW, "Razorwire", null);
		}

		
		
	}
	
}