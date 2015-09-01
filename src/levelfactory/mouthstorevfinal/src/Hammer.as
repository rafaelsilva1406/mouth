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
	public class Hammer extends Tools
	{
		[Embed(source="assets/Store/Hammer.png")]
		private const HAMMER:Class;
		
		[Embed(source="assets/Store/HammerGlow.png")]
		private const HAMMERGLOW:Class;
		
		[Embed(source = "assets/Store/HammerTip.png")]
		private const HAMMERTIP:Class;
		
		public function Hammer()
		{
			super(HAMMER, HAMMERGLOW, "Hammer", HAMMERTIP);
		}

		
		
	}
	
}