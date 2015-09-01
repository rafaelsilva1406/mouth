package levelfactory.mouthstorevfinal.src
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author Ricardo Limo
	 */
	public class ToolsBox extends Sprite
	{
		private var _spriteHolder:Sprite;
		private var _onScreen:Boolean;
		
		public function ToolsBox(_X:Number, _Y:Number )
		{
			_onScreen = false;
			this._spriteHolder = new Sprite();
			this._spriteHolder.x = _X;
			this._spriteHolder.y = _Y;
			addChild(_spriteHolder);
				
		}
		public function setOnScreen(_onscreen:Boolean):void
		{
			this._onScreen = _onscreen;
			
		}
		
		public function getOnScreen():Boolean
		{
			return this._onScreen;
			
		}
		
		public function addTool(_Tool:Sprite):void
		{
			this._spriteHolder.addChild(_Tool);
		}
		
		public function deleteBox():void
		{
		
			this.removeChild(_spriteHolder);
			
			
		}
	}
	
}