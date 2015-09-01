package levelfactory.mouthstorevfinal.src
{
	import flash.automation.StageCaptureEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Tools extends Sprite 
	{
		
		private var Asset:Class;
		private var AssetGlow:Class;
		private var _toolArt:Bitmap;
		private var OriginalX:Number;
		private var OriginalY:Number;
		private var _clickCounter:Number;
		private var _Name:String;
		private var _tipArt:Bitmap;
		private var _tipArtHolder:Class;
		
		public function Tools(_Asset:Class, _AssetGlow:Class, Name:String, _Tip:Class)
		{
			
			Asset = _Asset;
			AssetGlow = _AssetGlow;
			_Name = Name;

			_tipArtHolder = _Tip;
			_toolArt = new _Asset();
			
			this.OriginalX = 0;
			this.OriginalY = 0;
			
			this._clickCounter = 0;
			
			this.x = this.OriginalX;
			this.y = this.OriginalY;
			
			this.buttonMode = true;
			
			addChild(_toolArt);
			this.addEventListener(MouseEvent.CLICK, _click);
			this.addEventListener(MouseEvent.MOUSE_OVER, _glow);
			this.addEventListener(MouseEvent.MOUSE_OUT, _stopGlow);
		}
		public function setXY(_X:Number, _Y:Number):void
		{
			this.x = _X;
			this.y = _Y;
		}
		public function setOriginalXY(_X:Number,_Y:Number):void
		{
			this.OriginalX = _X;
			this.OriginalY = _Y;
			
		}
		public function getX():Number
		{
			return this.x;
		}
		public function getY():Number
		{
			return this.y;
		}
		public function getOriginalX():Number
		{
			return this.OriginalX;
			
		}
		public function getOriginalY():Number
		{
			return this.OriginalY;
			
		}
		
		//STARTS DRAGGING THE TOOLS
		public function _click(e:Event):void
		{
			
			//SETS THE ART TO GLOWING MODE
			if (_clickCounter == 0 && Store._toolLimit <3)
			{
				_clickCounter++;
				Store._toolLimit++;
				Store._instance.pushTool(_Name);
				removeChild(_toolArt);
				_toolArt = new AssetGlow();
				addChild(_toolArt);	
				
			}
			//SETS THE ART BACK TO NORMAL
			else if (_clickCounter == 1)
			{
				removeChild(_toolArt);
				_toolArt = new Asset();
				addChild(_toolArt);
				_clickCounter = 0;
				Store._toolLimit--;
			}
		
			
		}
		public function _glow(e:Event):void
		{
			removeChild(_toolArt);
			_toolArt = new AssetGlow();
			addChild(_toolArt);
			
			_tipArt = new _tipArtHolder();
			_tipArt.x = 0;
			_tipArt.y = -90;
			addChild(_tipArt);
			
		}
		public function _stopGlow(e:Event):void
		{
			removeChild(_tipArt);
			if (_clickCounter != 1)
			{
			removeChild(_toolArt);
			_toolArt = new Asset();
			addChild(_toolArt);
			}
		}
		
		
		
		//DELETES THE TOOL
		public function deleteTool():void
		{
			this.OriginalX = 0;
			this.OriginalY = 0;
			this.Asset = null;
			this.removeEventListener(MouseEvent.MOUSE_DOWN, _click);
			this.parent.removeChild(this);
			
		}
	}
	
}