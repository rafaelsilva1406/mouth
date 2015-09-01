/* rafael silva last update 7/25/2012*/

//set dir folder name to locate class
package startfactory
{
	//call libs that need to compile 
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	
	public class characterclass extends Sprite
	{
		//character background
		//embed image
		[Embed(source = "assets/button/character_background.png", compression = true)]
		//make it a class
		private const character_background_class:Class;
		//point bitmap to class
		private var character_background_bitmap:Bitmap = new character_background_class();
		//snapshot bitmap to bitmapdata
		private var character_background_bitmapdata:BitmapData = new BitmapData (character_background_bitmap.width, character_background_bitmap.height,true, 0x00000000);
		
		
		//character button
		//embed image 
		[Embed(source = "assets/button/character_button.png", compression = true)]
		//make it a class 
		private const character_button_class:Class;
		//point bitmap to class
		private var character_button_bitmap:Bitmap = new character_button_class();
		//snapshot bitmap to bitmapdata 
		private var character_button_bitmapdata:BitmapData = new BitmapData (character_button_bitmap.width, character_button_bitmap.height,true, 0x00000000);
		//convert bitmap to movieclip
		public var character_mc:MovieClip = new MovieClip();
		
		private var title_class:titlescreen;
		
		public function characterclass(link_class:titlescreen) {
			// constructor code
			title_class = link_class;
			
			//button background
			//store image to cache 
			character_background_bitmap.cacheAsBitmap = true;
			//position screen
			character_background_bitmap.x = 210;
			character_background_bitmap.y = 230;
			//draw bitmap to bitmapdata
			character_background_bitmapdata.draw(character_background_bitmap);
			//add object
			addChild(character_background_bitmap);
			//set object to false
			character_background_bitmap.visible = false;
			
			//button mc
			//store image to cache 
			character_button_bitmap.cacheAsBitmap = true;
			//draw bitmap to bitmapdata
			character_button_bitmapdata.draw(character_button_bitmap);
			//attach bitmap to movieclip
			character_mc.addChild(character_button_bitmap);
			//position screen
			character_mc.x = 210;
			character_mc.y = 230;
			//events to movieclip
			character_mc.addEventListener(MouseEvent.CLICK, characterClick);
			character_mc.addEventListener(MouseEvent.MOUSE_OVER, characterHover);
			character_mc.addEventListener(MouseEvent.MOUSE_OUT, characterOut);
			//add movieclip
			addChild(character_mc);
		}
		//character button hover
		private function characterHover(e:MouseEvent):void
		{
			//set object to true
			character_background_bitmap.visible = true;

		}
		//character button out
		private function characterOut(e:MouseEvent):void
		{
			//set object to false
			character_background_bitmap.visible = false;
		}
		//character button click 
		private function characterClick(e:MouseEvent):void
		{
			//add next class structure
			title_class.main_class.show_level();
		}
		public function destroycharacter()
		{
			//remove image from screen 
			removeChild(character_background_bitmap);
			//remove click event listener
			character_mc.removeEventListener(MouseEvent.CLICK, characterClick);
			//remove hover event listener 
			character_mc.removeEventListener(MouseEvent.MOUSE_OVER, characterHover);
			//remove out event listener 
			character_mc.removeEventListener(MouseEvent.MOUSE_OUT, characterOut);
			//remove image 
			removeChild(character_mc);
		}
/////////////////////////////////////////////////////////////////////////////
	}
	
}
