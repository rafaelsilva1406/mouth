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
	public class CrowBar extends Tools
	{
		[Embed(source="assets/Store/CrowBar.png")]
		private const CROWBAR:Class;
		
		[Embed(source="assets/Store/CrowBarGlow.png")]
		private const CROWBARGLOW:Class;
		
		public function CrowBar()
		{
			super(CROWBAR, CROWBARGLOW, "Crowbar", null);
		}
		
	}
	
}