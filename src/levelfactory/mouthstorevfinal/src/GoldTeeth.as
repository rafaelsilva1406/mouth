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
	public class GoldTeeth extends Tools
	{
		[Embed(source="assets/Store/GoldTeeth.png")]
		private const GOLDTEETH:Class;
		
		[Embed(source = "assets/Store/GoldTeethGlow.png")]
		private const GOLDTEETHGLOW:Class;
		
		[Embed(source = "assets/Store/GoldTeethTip.png")]
		private const GOLDTEETHTIP:Class;
		
		public function GoldTeeth()
		{
			super(GOLDTEETH, GOLDTEETHGLOW, "Goldteeth", GOLDTEETHTIP);
		}

		
		
	}
	
}