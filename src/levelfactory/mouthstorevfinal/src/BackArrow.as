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
	public class BackArrow extends Sprite 
	{
		[Embed(source="assets/Store/BackArrow.png")]
		private const BACKARROW:Class
		private var _backArrow:Bitmap = new BACKARROW();
		private var spriteHolder:Sprite = new Sprite();
		
		public function BackArrow(_X:Number, _Y:Number)
		{
			this.x = _X;
			this.y = _Y;
			
			spriteHolder.addChild(_backArrow);
			addChild(spriteHolder);
			spriteHolder.addEventListener(MouseEvent.CLICK,goBack);			
			
		}
		
		public function deleteBtn():void
		{
			this.parent.removeChild(this);
			
		}
		public function goBack(e:Event)
		{
			Store._instance.deleteStore();
			
		}
		
	}
	
}