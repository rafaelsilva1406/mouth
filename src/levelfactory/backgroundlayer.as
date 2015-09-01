/* rafael silva last update 7/30/2012 */

//dir where class located
package levelfactory  
{
	//import flash builder libs
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	
	public class backgroundlayer extends Sprite{
		//level class
		public var level_class:levelscreen;
		
		//background
		//embed image
		[Embed(source = "assets/background/mouthbk.png", compression = true)]
		//set image to class
		private const mouth_class:Class;
		//set class to bitmap
		private var mouth_bitmap:Bitmap = new mouth_class();
		//snapshot bitmap to bitmap data
		private var mouth_bitmapdata:BitmapData = new BitmapData (mouth_bitmap.width, mouth_bitmap.height,true, 0x00000000);
		
		public function backgroundlayer(attached_class:levelscreen) {
			// constructor code
			
			//level class
			level_class = attached_class;
			
			//cache image 
			mouth_bitmap.cacheAsBitmap = true;
			//position on screen
			mouth_bitmap.x = 0;
			mouth_bitmap.y = 0;
			//set bitmap to bitmapdata
			mouth_bitmapdata.draw(mouth_bitmap);
			//add object
			addChild(mouth_bitmap);
			
		}
		
	}
	
}
