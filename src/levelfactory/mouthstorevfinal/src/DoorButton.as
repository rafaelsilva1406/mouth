package levelfactory.mouthstorevfinal.src
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.ButtonAsset;
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class DoorButton extends Sprite 
	{
		//BUTTON ASSET
		[Embed(source="assets/Store/buttonPushed.png")]
		private const BUTTON:Class
		private var _Button:Bitmap = new BUTTON();
		
		[Embed(source = "assets/Store/Button 1-1.png")]
		private const BUTTON2:Class
		private var _button2:Bitmap = new BUTTON2();
		
		//VARIABLE TO HOLD DOOR CONTROLLED BY THIS BUTTON
		private var _SlidingDoor:SlidingDoor;
		public static var _doorButtonInstance:DoorButton;
		
		
		//CONSTRUCTOR 
		public function DoorButton(_X:Number, _Y:Number, _slidingDoor:SlidingDoor)
		{
			//SETS THE DOOR THAT THIS BUTTON WILL HANDLE
			_SlidingDoor = _slidingDoor;
			_doorButtonInstance = this;
			
			//SET THE X AND Y OF THE BUTTON ON THE STAGE/STORE
			this.x = _X;
			this.y = _Y;
			//CHANGES THE CURSOR OF THE MOUSE TO INDICATE THIS BUTTON CAN BE CLICKED
			this.buttonMode = true;
			//ADDS THE BUTTON TO THE SCREEN
			
			addChild(_Button);
			//ADDS A LISTENER TO THE BUTTON AND PERFORMS THE SLIDEDOOR FUNCTION WHEN CLICKED
			this.addEventListener(MouseEvent.CLICK, SlideDoor);
			
			
		}
		
		//WHEN THE BUTTON IS CLICKED
		public function SlideDoor(e:Event):void
		{//START SLIDE DOOR EVENT
			
			//SETS THE SLIDE VARIABLE IN SLIDING DOOR CLASS TO ALLOW DOOR TO OPEN
			_SlidingDoor.setSlide(true);
			
			//IF THE CURRENT DOOR IN THE STORE IS NOT THIS DOOR
			if (Store._currentOpenDoor != this._SlidingDoor)
			{
					
					
					//IF THE VARIABLE CURRENTOPEN DOOR IS NOT NULL
					if (Store._currentOpenDoor != null)
					{
						
		
							//SETS THE VARIABLE IN SLIDING DOOR CLASS TO FALSE TO CLOSE THE OPENED DOOR
							Store._currentOpenDoor.setSlide(false);
						
						
					}
					
					//MAKES THE DOOR THAT WAS OPENED WITH THIS BUTTON THE CURRENT OPENED DOOR
					Store._currentOpenDoor = this._SlidingDoor; 
					
						
			}
			//IF THE CURRENT OPENED DOOR IS THIS DOOR AND THE VARIABLE SLIDE IS TRUE MEANING THAT IS OPEN
			else if(Store._currentOpenDoor == this._SlidingDoor && this._SlidingDoor.getSlide() == true)
			{
	

					//SETS THE VARIABLE SLIDE TO FALSE TO CLOSE THE DOOR
					_SlidingDoor.setSlide(false);
					//SETS THE CURRENT OPEN DOOR TO NULL TO ALLOW THE DOOR TO OPEN NEXT TIME THE BUTTON IS CLICKED
					Store._currentOpenDoor = null;
				
			}
			
		}//END SLIDE DOOR EVENT
		
		
		public function deleteDoorButton():void
		{
			this.removeEventListener(MouseEvent.CLICK, SlideDoor);
			this.parent.removeChild(this);
			_Button = null;
			_button2 = null;
			_SlidingDoor = null;
			
		}
		
		
		
	}
	
}