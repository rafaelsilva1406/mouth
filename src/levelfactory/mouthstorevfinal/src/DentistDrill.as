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
	public class DentistDrill extends Tools
	{
		[Embed(source="assets/Store/DentistDrill.png")]
		private const DENTISTDRILL:Class;
		
		[Embed(source = "assets/Store/DentistDrillGlow.png")]
		private const DENTISTDRILLGLOW:Class;
		
		
		[Embed(source = "assets/Store/DentistDrillTip.png")]
		private const DENTISTTIP:Class;
		
		public function DentistDrill()
		{
			super(DENTISTDRILL, DENTISTDRILLGLOW, "Dentistdrill",DENTISTTIP );
		}

		
		
	}
	
}