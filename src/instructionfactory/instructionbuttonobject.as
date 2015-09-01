/* rafael silva 7/25/2012  */
//create background object


//set dir to find where class located
package instructionfactory
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class instructionbuttonobject extends Sprite
	{
		//button mc
		//embed image 
		[Embed(source = "assets/button/back_button.png", compression = true)]
		//turn image to class
		private const back_mc_class:Class;
		//point class to bitmap
		private var back_mc_bitmap:Bitmap = new back_mc_class();
		//snapshot bitmap to bitmapdata
		private var back_mc_bitmapdata:BitmapData = new BitmapData (back_mc_bitmap.width, back_mc_bitmap.height,true, 0x00000000);
		//turn bitmap to movieclip
		public var back_mc:MovieClip = new MovieClip();
		
		//button background
		//embed image 
		[Embed(source = "assets/button/back_background.png", compression = true)]
		//turn image to class
		private const back_background_class:Class;
		//point class to bitmap
		private var back_background_bitmap:Bitmap = new back_background_class();
		//snapshot bitmap to bitmapdata
		private var back_background_bitmapdata:BitmapData = new BitmapData (back_background_bitmap.width, back_background_bitmap.height,true, 0x00000000);
		
		//button click song
		//embed song
		[Embed(source = "assets/sound/button_click.mp3")]
		//turn song to class
		private var button_class:Class;
		//point class to sound
		private var button_sound:Sound = new button_class();
		//control sound with soundchannel
		private var button_soundchannel:SoundChannel= new SoundChannel();
		
		//title screen link
		instruction_class:instructionscreen;
		
		public function instructionbuttonobject(link_class:instructionscreen) 
		{
			// constructor code
			instruction_class = link_class;
			
			//button mc
			//store image to cache
			back_mc_bitmap.cacheAsBitmap = true;
			//draw bitmap to bitmapdata
			back_mc_bitmapdata.draw(back_mc_bitmap);
			//attach bitmap to movieclip
			back_mc.addChild(back_mc_bitmap);
			//position screen
			back_mc.x = 322;
			back_mc.y = 360;
			//movieclip events
			back_mc.addEventListener(MouseEvent.CLICK, backClick);
			back_mc.addEventListener(MouseEvent.MOUSE_OVER, backHover);
			back_mc.addEventListener(MouseEvent.MOUSE_OUT, backout);
			//add movieclip
			addChild(back_mc);
			
			//button background
			//store image to cache
			back_background_bitmap.cacheAsBitmap = true;
			//position screen
			back_background_bitmap.x = 322;
			back_background_bitmap.y = 360;
			//draw bitmap to bitmapdata
			back_background_bitmapdata.draw(back_background_bitmap);
			//add object
			addChild(back_background_bitmap);
			//set object to false
			back_background_bitmap.visible = false;
			
		}
		//back button hover
		private function backHover(e:MouseEvent):void {
			//add sound and control it with soundchannel
			button_soundchannel = button_sound.play();
			//set object to true
			back_background_bitmap.visible = true;
		}
		//back button out
		private function backout(e:MouseEvent):void
		{
			//set object to false
			back_background_bitmap.visible = false;
		}
		//back button click
		private function backClick(e:MouseEvent):void 
		{
			//add next class structure
			instruction_class.main_class.show_maintitle();
			
		}
	
/////////////////////////////////////////////////////////////////////
	}
	
}
