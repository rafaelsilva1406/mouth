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
	public class Thread extends Tools
	{
		[Embed(source="assets/Store/Thread.png")]
		private const THREAD:Class;
		
		[Embed(source = "assets/Store/ThreadGlow.png")]
		private const THREADGLOW:Class;
		
		[Embed(source = "assets/Store/Sowing.png")]
		private const THREADTIP:Class;
		
		public function Thread()
		{
			super(THREAD, THREADGLOW, "Thread", THREADTIP);
		}

		
		
	}
	
}