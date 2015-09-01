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
	public class JawTrap extends Tools
	{
		[Embed(source="assets/Store/JawTrap.png")]
		private const JAWTRAP:Class;
		
		[Embed(source = "assets/Store/JawTrapGlow.png")]
		private const JAWTRAPGLOW:Class;
		
		public function JawTrap()
		{
			super(JAWTRAP, JAWTRAPGLOW, "Jawtrap", null);
		}

		
		
	}
	
}