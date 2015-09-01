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
	public class BaseballBat extends Tools
	{
		[Embed(source="assets/Store/BaseballBat.png")]
		private const BASEBALLBAT:Class;
		
		[Embed(source = "assets/Store/BaseballBatGlow.png")]
		private const BASEBALLBATGLOW:Class;
		
		public function BaseballBat()
		{
			super(BASEBALLBAT, BASEBALLBATGLOW, "Baseballbat",null);
		}
	}
	
	
	
}