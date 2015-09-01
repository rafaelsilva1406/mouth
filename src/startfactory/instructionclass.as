/* rafael silva last update 7/25/2012  */
//give dir name where class located 
package startfactory
{
	//set libs flash builder wiil use 
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	
	public class instructionclass extends Sprite
	{
		
		//instuction background
		[Embed(source = "assets/button/instructions_background.png", compression = true)]
		//make it a class
		private const instructions_background_class:Class;
		//point bitmap to class
		private var instructions_background_bitmap:Bitmap = new instructions_background_class();
		//convert bitmap to movieclip
		private var instructions_background_bitmapdata:BitmapData = new BitmapData (instructions_background_bitmap.width, instructions_background_bitmap.height,true, 0x00000000);
		
		//embed instuction button
		[Embed(source = "assets/button/instructions_button.png", compression = true)]
		//make it a class
		private const instructions_button_class:Class;
		//point bitmap to class
		private var instructions_button_bitmap:Bitmap = new instructions_button_class();
		//snapshot bitmap to bitmapdata
		private var instructions_button_bitmapdata:BitmapData = new BitmapData (instructions_button_bitmap.width, instructions_button_bitmap.height,true, 0x00000000);
		//convert bitmap to movieclip
		public var  instructions_mc:MovieClip = new MovieClip();
		
		private var title_class:titlescreen;
		
		public function instructionclass(link_class:titlescreen)
		{
			// constructor code
			title_class = link_class;
			
			//button background
			//store image to cache 
			instructions_background_bitmap.cacheAsBitmap = true;
			//position screen
			instructions_background_bitmap.x = 320;
			instructions_background_bitmap.y = 293;
			//draw bitmap to bitmapdata
			instructions_background_bitmapdata.draw(instructions_background_bitmap);
			//add object
			addChild(instructions_background_bitmap);
			instructions_background_bitmap.visible = false;
			
			//button mc
			//store image to cache 
			instructions_button_bitmap.cacheAsBitmap = true;
			//draw bitmap to bitmapdata
			instructions_button_bitmapdata.draw(instructions_button_bitmap);
			//attach bitmap to movieclip
			instructions_mc.addChild(instructions_button_bitmap);
			//position screen
			instructions_mc.x = 320;
			instructions_mc.y = 295;
			//movieclip events
			instructions_mc.addEventListener(MouseEvent.CLICK, instructionClick);
			instructions_mc.addEventListener(MouseEvent.MOUSE_OVER, instructionHover);
			instructions_mc.addEventListener(MouseEvent.MOUSE_OUT, instructionOut);
			//add movieclip
			addChild(instructions_mc);
		}
		//instruction button hover
		private function instructionHover(e:MouseEvent):void
		{
			//set object to true
			instructions_background_bitmap.visible = true;
		}
		//instruction button out
		private function instructionOut(e:MouseEvent):void
		{
			//set object to false
			instructions_background_bitmap.visible = false;
		}
		//instruction button  click 
		private function instructionClick(e:MouseEvent):void
		{
			//add next class structure
			title_class.main_class.show_instruction();
		}
		public function destroyinstruction()
		{
			//remove image 
			removeChild(instructions_background_bitmap);
			//remove click event listener 
			instructions_mc.removeEventListener(MouseEvent.CLICK, instructionClick);
			//remove over event listener
			instructions_mc.removeEventListener(MouseEvent.MOUSE_OVER, instructionHover);
			//remove out event listener
			instructions_mc.removeEventListener(MouseEvent.MOUSE_OUT, instructionOut);
			//remove image
			removeChild(instructions_mc);
			
		}
/////////////////////////////////////////////////////////////////////////////
	}
	
}
