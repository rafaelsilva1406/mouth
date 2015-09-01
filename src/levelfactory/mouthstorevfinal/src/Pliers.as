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
	public class Pliers extends Tools
	{
		[Embed(source="assets/Store/Pliers.png")]
		private const PLIERS:Class;
		
		[Embed(source = "assets/Store/PliersGlow.png")]
		private const PLIERSGLOW:Class;
		
		[Embed(source = "assets/Store/PliersTip.png")]
		private const PLIERSTIP:Class;
		
		public function Pliers()
		{
			super(PLIERS, PLIERSGLOW, "Pliers", PLIERSTIP);
		}

		
		
	}
	
}