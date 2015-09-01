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
	public class Scapel extends Tools
	{
		[Embed(source="assets/Store/Scapel.png")]
		private const SCAPEL:Class;
		
		[Embed(source = "assets/Store/Scapel.png")]
		private const SCAPELGLOW:Class;
		
		public function Scapel()
		{
			super(SCAPEL, SCAPELGLOW, "Scapel", null);
		}

		
		
	}
	
}