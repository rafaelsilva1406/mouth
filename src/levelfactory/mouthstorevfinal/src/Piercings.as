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
	public class Piercings extends Tools
	{
		[Embed(source="assets/Store/Piercings.png")]
		private const PIERCINGS:Class;
		
		[Embed(source = "assets/Store/PiercingsGlow.png")]
		private const PIERCINGSGLOW:Class;
		
		public function Piercings()
		{
			super(PIERCINGS, PIERCINGSGLOW, "Piercings", null);
		}

		
		
	}
	
}