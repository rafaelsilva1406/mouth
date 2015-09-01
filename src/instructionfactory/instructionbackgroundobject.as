/* rafael silva last update 7/25/2012 */
//create button object


//set the dir where the class located
package instructionfactory
{
	//import flash builder libs
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Bitmap;

	public class instructionbackgroundobject extends Sprite 
	{
		//instuction background
		//embed image
		[Embed(source = "assets/background/instructions_text.png", compression = true)]
		//turn image to class
		private const instruction_background_class:Class;
		//point class to bitmap
		private var instruction_background_bitmap:Bitmap = new instruction_background_class();
		//snapshot bitmap to bitmapdata
		private var instruction_background_bitmapdata:BitmapData = new BitmapData (instruction_background_bitmap.width, instruction_background_bitmap.height,true, 0x00000000);
		
		//title screen link
		instruction_class:instructionscreen;
		// constructor code
		public function instructionbackgroundobject(link_class:instructionscreen) {
			//link functanality to class
			instruction_class = link_class;
			
			//screen background
			//store image to cache
			instruction_background_bitmap.cacheAsBitmap = true;
			//draw bitmap to bitmapdata
			instruction_background_bitmapdata.draw(instruction_background_bitmap);
			//position screen
			instruction_background_bitmap.x = 4;
			instruction_background_bitmap.y = 10;
			//add object
			addChild(instruction_background_bitmap);
		}
		
		
		
///////////////////////////////////////////////////////////////////////////
	}
	
}
