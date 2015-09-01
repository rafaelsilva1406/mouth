/* rafael silva last update 7/30/2012  */

//dir where class located
package startfactory
{
	//import flash builder libs
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class titlebackground extends Sprite{
		
		//background
		//embed image 
		[Embed(source = "assets/background/titlescreen.png", compression = true)]
		//make it a class
		private const background_class:Class;
		//point bitmap to  class
		private var background_bitmap:Bitmap = new background_class();
		//snapshot bitmap to bitmap
		private var background_bitmapdata:BitmapData = new BitmapData (background_bitmap.width, background_bitmap.height,true, 0x00000000);
		
		//set var to link class
		private var title_class:titlescreen;
		
		// constructor code
		public function titlebackground(link_class:titlescreen) {
			
			//link functionality to class
			title_class = link_class;
			
			//title background
			//store image to cache
			background_bitmap.cacheAsBitmap = true;
			//position screen
			background_bitmap.x = 0;
			background_bitmap.y = 0;
			//draw bitmap to bitmapdata
			background_bitmapdata.draw(background_bitmap);
			//add object
			addChild(background_bitmap);
		}
		public function destroybackground()
		{
			removeChild(background_bitmap);
			background_bitmap = null;
		}
//////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
