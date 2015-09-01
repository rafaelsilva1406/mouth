package levelfactory.mouthstorevfinal.src
{//START PACKAGE
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;	
	

	/**
	 * ...
	 * @author rcl
	 */
	
	public class StoreMain extends Sprite 
	{//START MAIN CLASS
	
		private var _store:Store = new Store();

		
		//CONSTRUCTOR
		public function StoreMain():void 
		{//START CONSTRUCTOR
			
			addChild(_store);
			
		}//END CONSTRUCTOR
		

	}//END MAIN CLASS

}//END PACKAGE