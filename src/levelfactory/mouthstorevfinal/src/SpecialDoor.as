package levelfactory.mouthstorevfinal.src
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SpecialDoor extends SlidingDoor
	{
		
		[Embed(source = "assets/Store/BackBoard.png")]
		private const BACKBOARD:Class;
		public var _backBoard:Bitmap = new BACKBOARD();
		
		
		public function SpecialDoor(_X:Number, _Y:Number, _Speed:Number, _MoveY:Boolean)
		{
			
			super(_X, _Y, _Speed, _MoveY, false);
			setAsset(BACKBOARD);
			this.addEventListener(MouseEvent.CLICK, update);
		
		}
		
		public function update(e:Event):void
		{
			
			this.setSlide(true);
	
			if (Store._currentOpenDoor != this)
			{
				if (Store._currentOpenDoor != null)
				{
					Store._currentOpenDoor.setSlide(false);
					
				}
				Store._currentOpenDoor = this;
			}
		}
	
		
	}
	
}