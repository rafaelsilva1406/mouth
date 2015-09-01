package levelfactory.mouthstorevfinal.src
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SlidingDoor extends Sprite 
	{
		
		//VARIABLE HOLDING THE STARTING X AND Y VALUES OF THE SLIDING DOOR
		private var _Xorigin:Number;
		private var _Yorigin:Number;
		//VARIABLE HOLDING THE SPEED IN WHICH THE DOOR SHOULD SLIDE
		private var _slideSpeed:Number;
		//VARIABLE THAT TELLS THE DOOR IF IT SHOULD BE OPEN OR CLOSED
		private var _slide:Boolean;
		//VARIABLE HOLDING THE LIMIT ON HOW FAR THE DOOR SHOULD SLIDE
		private var _slideLimit:Number;
		//VARIABLE TO USE IN CONJUNCTION WITH SLIDE LIMIT
		private var _slideCounter:Number;
		private var _SlidingDoor:Bitmap;
		private var _moveY:Boolean;
		private var _moveLeft:Boolean;
		//CONSTRUCTOR PASSING X, Y, AND SLIDING SPEED
		public function SlidingDoor(_X:Number, _Y:Number, _speed:Number, _MoveY:Boolean, _MoveLeft:Boolean)
		{
			//SETS THE X AND Y TO BECOME THE ORIGINS
			_Xorigin = _X;
			_Yorigin = _Y;
			//SETS THE X AND Y STARTING LOCATION
			this.x = _Xorigin;
			this.y = _Yorigin;
			
			_moveY = _MoveY;
			_moveLeft = _MoveLeft;
			//SETS SPEED OF DOOR
			_slideSpeed = _speed;
			//SETS SLIDE TO FALSE
			//_slide = false;
			//SETS THE SLIDE LIMIT
			_slideLimit = 27;
			//SETS THE SLIDE COUNTER
			_slideCounter = 0;
			//ADD A LISTENER TO THE DOOR THAT WILL HANDLE THE SLIDING
			this.addEventListener(Event.ENTER_FRAME, updateDoor);
		}
		
		public function setAsset(_asset:Class):void
		{
			_SlidingDoor = new _asset();
			addChild(_SlidingDoor);
			
		}
		
		//FUNCTION WILL HELP SET THE SLIDE VARIABLE TO TRUE OR FALSE TO ALLOW MOVEMENT
		public function setSlide(_setSlide:Boolean):void
		{
			//SETS SLIDE TO THE VARIABLE THAT WAS PASSED
			this._slide = _setSlide;
			
		}
		//FUNCTION WILL RETURN THE VALUE OF SLIDE 
		public function getSlide():Boolean
		{
			return this._slide;
			
		}
		//THIS FUNCTION IS IN CHARGE OF OPENING THE DOOR
		public function openDoor():void
		{
			//IF SLIDE IS TRUE
			if (this._slide == true)
			{
				
				
				//ADDS ONE TO THE COUNTER
				_slideCounter++;
				
				//AS LONG AS THE COUNTER IS LESS THAN THE LIMIT 
				if(_slideCounter <=_slideLimit) 
					{
						if(_moveY)
						{
							this.y += _slideSpeed;
							
						}
						
						if(_moveLeft)
						{
							this.x -= _slideSpeed;
							
						}
						if (!_moveLeft && !_moveY)
						{
						//SLIDE THE DOOR TO THE RIGHT DEPENDING ON THE SLIDING SPEED
						this.x += _slideSpeed;
						}
						
					}
			}
		}
		//THIS FUNCTION IS IN CHARGE OF CLOSING THE DOOR
		public function closeDoor():void
		{
			//IF SLIDE IS FALSE
			if (this._slide == false)
			{
			
				//RESETS THE COUNTER
				_slideCounter = 0;
				
				
				if (this.y >= this._Yorigin)
				{
					this.y -= _slideSpeed;
				}
				//IF THE CURRENT X LOCATION OF THE DOOR IS GREATHER THAN THE ORIGING
				if (this.x >= this._Xorigin)
				{
				
					//SLIDE THE DOOR TO THE LEFT DEPENDING ON THE SLIDING SPEED
					this.x -= _slideSpeed;
					
				}
				if(this.x <= this._Xorigin && this._moveLeft)
				{
					
					this.x += _slideSpeed;
				}
			}
		}
		
		//THIS IS THE FUNCTION THAT WILL UPDATE THE OPENING AND CLOSING OF THE DOOR
		public function updateDoor(e:Event):void
		{
			//OPENS DOOR IF REQUIREMENTS ARE MEET
			openDoor();
			//CLOSES DOOR IF REQUIREMENTS ARE MEET
			closeDoor();
			
		}
		//THIS FUNCTION IS IN CHARGE OF REMOVING THE DOOR AND ITS COMPONENTS
		public function deleteDoor():void
		{
			this.removeEventListener(Event.ENTER_FRAME, updateDoor);
			this.parent.removeChild(this);
			trace(this);
		}
		
	}
	
}