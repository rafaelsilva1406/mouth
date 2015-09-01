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
	public class Grinder extends Tools
	{
		[Embed(source="assets/Store/Grinder.png")]
		private const GRINDER:Class;
		
		[Embed(source="assets/Store/GrinderGlow.png")]
		private const GRINDERGLOW:Class;
		
		[Embed(source = "assets/Store/GrinderTip.png")]
		private const GRINDERTIP:Class;
		
		public function Grinder()
		{
			super(GRINDER, GRINDERGLOW,"Grinder", GRINDERTIP);
		}

		
		
	}
	
}