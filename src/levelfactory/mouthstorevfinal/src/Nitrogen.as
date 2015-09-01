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
	public class Nitrogen extends Tools
	{
		[Embed(source="assets/Store/Nitrogen.png")]
		private const NITROGEN:Class;
		
		[Embed(source = "assets/Store/NitrogenGlow.png")]
		private const NITROGENGLOW:Class;
		
		public function Nitrogen()
		{
			super(NITROGEN, NITROGENGLOW, "Nitrogen", null);
		}

		
		
	}
	
}