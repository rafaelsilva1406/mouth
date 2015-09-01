package levelfactory
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.*;
	
	
	public class Tooth extends MovieClip
	{
		private var _mcArt:MovieClip;
		private var _lastFrame:int;
		private var _defaultFrame:int;
		private var _SharpenFrame:int;
		private var _SharpenCrackFrame:int;
		private var _CrackSharpFrame:int;
		private var _CrackFrame:int;
		private var _CrackDrilled:int;
		private var _DrilledFrame:int;
		private var _DrilledCrackFrame:int;
		private var _RemovedFrame:int;
		public var _collisionbox:Sprite;

		public function Tooth(_X:int, _Y:int, _mc:MovieClip, _boxX:int, _boxY:int, _boxWidth:int, _boxHeight:int) 
		{
			// constructor code
			this._mcArt = _mc;
			this._mcArt.x = _X;
			this._mcArt.y = _Y;
			this._collisionbox = new Sprite();
			this._defaultFrame = 1;
			setBoxCollision(_boxX, _boxY, _boxWidth, _boxHeight);
			
		}
		
		//SETS COLLISION BOX 
		public function setBoxCollision(_X:int, _Y:int,_Width:int, _Height:int):void
		{
			_collisionbox.graphics.beginFill(0x000000);
			_collisionbox.graphics.drawRect(_X,_Y, _Width, _Height);
			_collisionbox.graphics.endFill();
			_collisionbox.alpha = 0.0;
			addChild(_collisionbox);
			this._collisionbox.addEventListener(MouseEvent.CLICK, clicked,false, 0, true);
		}
	
		public function clicked(e:Event):void
		{
			if(levelscreen._levelScreen._animate)
			{
			//IF GRINDER IS THE CURRENT TOOL
			if(levelscreen._levelScreen._currentTool == levelscreen._levelScreen.grinder_mc)
			{
				//IF GRINDER IS HITTING THE COLLISION BOX
				if(levelscreen._levelScreen.grinder_mc.hitTestObject(this._collisionbox))
				{
					//checks if current tooth is on first frame
					if(this._mcArt.currentFrame == this._defaultFrame)
					{
							levelscreen._levelScreen._animate = false;
							//count clicks on object
							levelscreen._levelScreen.clicks +=5;
							//add clicks to the score 
							levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
							//plays the sharpen tween
							this._mcArt.gotoAndPlay("Sharpen");
							//PLAYS GRINDER SOUND
							levelscreen._levelScreen.sound_screen_class.grinderSound();
							//PLAYS PUNCHBAG
							levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
							//PLAYS SCREAM
							this.randomShortScream(randomNumber(7));
									
					}
					else if(_mcArt.currentFrame == this._CrackFrame)
					{
						levelscreen._levelScreen._animate = false;
						//count clicks on object
						levelscreen._levelScreen.clicks+=5;
						//add clicks to the score 
						levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
						//plays the cracksharp tween			
						this._mcArt.gotoAndPlay("CrackSharp");
						levelscreen._levelScreen.sound_screen_class.grinderSound();
						levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
						this.randomShortScream(randomNumber(7));
					}
				
				}
			}
			//IF HAMMER IS THE CURRENT TOOL
			if(levelscreen._levelScreen._currentTool == levelscreen._levelScreen.hammer_mc)
			{
				//IF HAMMER IS HITTING THE COLLISION BOX
				if(levelscreen._levelScreen.hammer_mc.hitTestObject(this._collisionbox))
				{
					//checks if current tooth is on first frame
					if(this._mcArt.currentFrame == this._defaultFrame)
					{
							
							//count clicks on object
							levelscreen._levelScreen.clicks +=5;
							//add clicks to the score 
							levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
							//plays the sharpen tween
							this._mcArt.gotoAndPlay("NormCrack");
							levelscreen._levelScreen.sound_screen_class.hammerSound();
							levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
							this.randomShortScream(randomNumber(7));
							setLastFrame(this._CrackFrame);
							checkAnimate();
									
					}
					else if(_mcArt.currentFrame == this._SharpenFrame)
					{
						
						//count clicks on object
						levelscreen._levelScreen.clicks+=5;
						//add clicks to the score 
						levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
						//plays the cracksharp tween			
						this._mcArt.gotoAndPlay("SharpCrack");
						levelscreen._levelScreen.sound_screen_class.hammerSound();
						levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
						this.randomShortScream(randomNumber(7));
						setLastFrame(this._SharpenCrackFrame);
						checkAnimate();
					}
					else if(_mcArt.currentFrame == this._DrilledFrame)
					{
						
						//count clicks on object
						levelscreen._levelScreen.clicks+=5;
						//add clicks to the score 
						levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
						//plays the cracksharp tween			
						this._mcArt.gotoAndPlay("DrilledCrack");
						levelscreen._levelScreen.sound_screen_class.hammerSound();
						levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
						this.randomShortScream(randomNumber(7));
						setLastFrame(this._DrilledCrackFrame);
						checkAnimate();
					}
				
				}
			}
			//IF DRILL IS THE CURRENT TOOL
			if(levelscreen._levelScreen._currentTool == levelscreen._levelScreen.drill_mc)
			{
				//IF DRILL IS HITTING THE COLLISION BOX
				if(levelscreen._levelScreen.drill_mc.hitTestObject(this._collisionbox))
				{
					//checks if current tooth is on first frame
					if(this._mcArt.currentFrame == this._defaultFrame)
					{
							
							//count clicks on object
							levelscreen._levelScreen.clicks +=5;
							//add clicks to the score 
							levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
							//plays the sharpen tween
							this._mcArt.gotoAndPlay("Drilled");
							levelscreen._levelScreen.sound_screen_class.drillSound();
							levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
							this.randomLongScream(randomNumber(5));
							setLastFrame(this._DrilledFrame);
							checkAnimate();
									
					}
					else if(_mcArt.currentFrame == this._CrackFrame)
					{
						//count clicks on object
						levelscreen._levelScreen.clicks+=5;
						//add clicks to the score 
						levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
						//plays the cracksharp tween			
						this._mcArt.gotoAndPlay("CrackDrilled");
						levelscreen._levelScreen.sound_screen_class.drillSound();
						levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
						this.randomLongScream(randomNumber(5));
						setLastFrame(this._CrackDrilled);
						checkAnimate();
					}
				
				}
			}
			}
			if(levelscreen._levelScreen._currentTool == levelscreen._levelScreen.plier)
			{
				//IF DRILL IS HITTING THE COLLISION BOX
				if(levelscreen._levelScreen.plier.hitTestObject(this._collisionbox))
				{
					if(this._mcArt.currentFrame != this._RemovedFrame)
					{
						levelscreen._levelScreen.clicks+=5;
						levelscreen._levelScreen.score_txt.text = levelscreen._levelScreen.clicks.toString();
						this._mcArt.gotoAndPlay("Removed");
						levelscreen._levelScreen.punchbag_mc.gotoAndPlay(2);
						setLastFrame(this._RemovedFrame);
					}
				}
			}
		}
	
		//THIS FUNCTION ADDS EVENT LISTENER TO CLICKED TEETH
		//IN ORDER TO STOP OTHER TEETH FROM BEING CLICKED UNTIL
		//CURRENT TEETH IS BEIN ANIMATED
		public function checkAnimate():void
		{
			this._mcArt.addEventListener(Event.ENTER_FRAME,animationFinish);
			levelscreen._levelScreen._animate = false;
		}
		
		//EVENT HANDLER OF THE FUNCTION 
		public function animationFinish(e:Event):void
		{
			if(this._mcArt != null)
			{
				//CHECKS CURRENT FRAME TO LAST FRAME
				if(this._mcArt.currentFrame == getLastFrame())
				{
					if(levelscreen._levelScreen.soundPlaying == false)
					{
						levelscreen._levelScreen._animate = true;
					}
					this._mcArt.removeEventListener(Event.ENTER_FRAME, animationFinish);
				}
			}
		}
		
		public function removeCheckFrame():void
		{
			this._mcArt.removeEventListener(Event.ENTER_FRAME, animationFinish);
			
		}
		public function randomNumber(_number):int
		{
			var _num:int;
			var randomN:int = Math.ceil(Math.random() * _number);
			trace(randomN);
			return randomN;
		}
		
		public function randomLongScream(_randomNumber:int):void
		{
			var rNumber:int = _randomNumber;
			
			if(rNumber == 1)
			{
				levelscreen._levelScreen.sound_screen_class.scream1Sound();
			}
			else if(rNumber == 2)
			{
				levelscreen._levelScreen.sound_screen_class.scream2Sound();
				
			}
			else if(rNumber == 3)
			{
				levelscreen._levelScreen.sound_screen_class.scream4Sound();
				
			}
			else if(rNumber == 4)
			{
				levelscreen._levelScreen.sound_screen_class.scream5Sound();
				
			}
			else if(rNumber == 5)
			{
				levelscreen._levelScreen.sound_screen_class.scream6Sound();
				
			}
			
		}
		
		public function randomShortScream(_randomNumber:int):void
		{
			var rNumber:int = _randomNumber;
			
			if(rNumber == 1)
			{
				levelscreen._levelScreen.sound_screen_class.sScream1Sound();
			}
			else if(rNumber == 2)
			{
				levelscreen._levelScreen.sound_screen_class.sScream2Sound();
				
			}
			else if(rNumber == 3)
			{
				levelscreen._levelScreen.sound_screen_class.sScream3Sound();
				
			}
			else if(rNumber == 4)
			{
				levelscreen._levelScreen.sound_screen_class.sScream4Sound();
				
			}
			else if(rNumber == 5)
			{
				levelscreen._levelScreen.sound_screen_class.sScream5Sound();
				
			}
			else if(rNumber == 6)
			{
				levelscreen._levelScreen.sound_screen_class.sScream6Sound();
				
			}
			else if(rNumber == 7)
			{
				levelscreen._levelScreen.sound_screen_class.sScream7Sound();
				
			}
			
		}
		
		//THIS FUNCTION SETS THE NUMBER OF THE TEETH FRAME IT SHOULD STOP ON
		public function setLastFrame(_frame:int):void
		{
			
				_lastFrame = _frame;
			
		}
		//THIS FUNCTION GETS LAST FRAME
		public function getLastFrame():int
		{
			return _lastFrame;
			
		}
		//sets the last frame of each tooth tween
		public function setFrames(sharpen:int, sharpcrack:int, crack:int, crackDrilled:int ,drilled:int, drilledCrack:int, crackSharp:int, removedFrame:int):void
		{
			_SharpenFrame = sharpen;
		    _SharpenCrackFrame = sharpcrack;
			_CrackSharpFrame = crackSharp;
		    _CrackFrame = crack;
		    _CrackDrilled = crackDrilled;
		    _DrilledFrame = drilled;
		    _DrilledCrackFrame = drilledCrack;
			_RemovedFrame = removedFrame;
 		}
		
		//destroys the tooth
		public function destroyTooth():void
		{
			
			this.removeChild(this._collisionbox);
			this._collisionbox = null;
			this._mcArt = null;
		
		}
		
		

	}
	
}
