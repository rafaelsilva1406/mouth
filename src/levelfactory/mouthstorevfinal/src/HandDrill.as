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
	public class HandDrill extends Tools
	{
		[Embed(source="assets/Store/HandDrill.png")]
		private const HANDDRILL:Class;
		
		[Embed(source="assets/Store/HandDrillGlow.png")]
		private const HANDDRILLGLOW:Class;
		
		public function HandDrill()
		{
			super(HANDDRILL, HANDDRILLGLOW, "Handdrill", null);
		}

		
		
	}
	
}