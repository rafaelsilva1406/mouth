/* Rafael Silva 7/25/2012 last update to this class */
/***draw splash image to screen*/
/* give dir folder name to find the class location   */
package splashfactory
{
	/* import all the libs that will us from flash builder */
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class splashbackground extends Sprite{
		
		//embed image
		[Embed(source = "assets/background/splash.png", compression = true )]
		//turn image to class
		private const splash_background:Class;
		//point bitmap to class
		private var splash_bitmap:Bitmap = new splash_background();
		//snapshot bitmap to bitmapdata
		private var splash_bitmapdata:BitmapData = new BitmapData (splash_bitmap.width, splash_bitmap.height,true, 0x00000000);
		
		//class structure
		public var splash_class:splashscreen;
		
		// constructor code
		public function splashbackground(object_link:splashscreen) {
			//link functinality to other class
			splash_class = object_link;
			
			//store image to cache
			splash_bitmap.cacheAsBitmap = true;
			//position to screen
			splash_bitmap.x = 0;
			splash_bitmap.y = 0;
			//draw bitmap to bitmapdata
			splash_bitmapdata.draw(splash_bitmap);
			//add object
			addChild(splash_bitmap);
		}
		// free up memory 
		public function destroysplashbackground()
		{
			//remove image 
			removeChild(splash_bitmap);
			//set image to null
			splash_bitmap = null;
		}
		
///////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
