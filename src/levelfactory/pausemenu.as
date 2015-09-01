package levelfactory  
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.ui.Mouse;
	import flash.system.System;
	import flash.system.fscommand;
	import flash.desktop.NativeApplication;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import levelfactory.mouthstorevfinal.src.StoreMain;
	
	public class pausemenu extends Sprite{
		//level class
		public var hud_class:hud;
		//public var store_class:storemain;
		
		//optionbox
		[Embed(source = "assets/button/pause/pause_background.png", compression = true)]
		private const pausetab_class:Class;
		private var pausetab_bitmap:Bitmap = new pausetab_class();
		private var  pausetab_bitmapdata:BitmapData = new BitmapData (pausetab_bitmap.width, pausetab_bitmap.height,true, 0x00000000);
		
		//store button
		[Embed(source = "assets/button/pause/store_button.png", compression = true)]
		private const store_button_class:Class;
		private var store_button_bitmap:Bitmap = new store_button_class();
		private var  store_button_bitmapdata:BitmapData = new BitmapData (store_button_bitmap.width, store_button_bitmap.height,true, 0x00000000);
		public var store_mc:MovieClip = new MovieClip();
		
		//store background button 
		[Embed(source = "assets/button/pause/store_background.png", compression = true)]
		private const store_background_class:Class;
		private var store_background_bitmap:Bitmap = new store_background_class();
		private var  store_background_bitmapdata:BitmapData = new BitmapData (store_background_bitmap.width, store_background_bitmap.height,true, 0x00000000);
		
		//quit background button 
		[Embed(source = "assets/button/pause/quit_background.png", compression = true)]
		private const quit_background_class:Class;
		private var quit_background_bitmap:Bitmap = new quit_background_class();
		private var  quit_background_bitmapdata:BitmapData = new BitmapData (quit_background_bitmap.width, quit_background_bitmap.height,true, 0x00000000);
		
		//quit button
		[Embed(source = "assets/button/pause/quit_button.png", compression = true)]
		private const quit_button_class:Class;
		private var quit_button_bitmap:Bitmap = new quit_button_class();
		private var  quit_button_bitmapdata:BitmapData = new BitmapData (quit_button_bitmap.width, quit_button_bitmap.height,true, 0x00000000);
		public var quit_mc:MovieClip = new MovieClip();
		
		//menu background button 
		[Embed(source = "assets/button/pause/menu_background.png", compression = true)]
		private const menu_background_class:Class;
		private var menu_background_bitmap:Bitmap = new menu_background_class();
		private var  menu_background_bitmapdata:BitmapData = new BitmapData (menu_background_bitmap.width, menu_background_bitmap.height,true, 0x00000000);
		
		//menu button
		[Embed(source = "assets/button/pause/menu_button.png", compression = true)]
		private const menu_button_class:Class;
		private var menu_button_bitmap:Bitmap = new menu_button_class();
		private var  menu_button_bitmapdata:BitmapData = new BitmapData (menu_button_bitmap.width, menu_button_bitmap.height,true, 0x00000000);
		public var menu_mc:MovieClip = new MovieClip();
		
		//back button
		[Embed(source = "assets/button/pause/back_button.png", compression = true)]
		private const back_button_class:Class;
		private var back_button_bitmap:Bitmap = new back_button_class();
		private var  back_button_bitmapdata:BitmapData = new BitmapData (back_button_bitmap.width, back_button_bitmap.height,true, 0x00000000);
		public var back_mc:MovieClip = new MovieClip();
		
		//back background
		[Embed(source = "assets/button/pause/back_background.png", compression = true)]
		private const back_background_class:Class;
		private var back_background_bitmap:Bitmap = new back_background_class();
		private var  back_background_bitmapdata:BitmapData = new BitmapData (back_background_bitmap.width, back_background_bitmap.height,true, 0x00000000);
		
		
		public function pausemenu(attached_class:hud) {
			// constructor code
			
			//level class
			hud_class = attached_class;
			
			//pause background
			pausetab_bitmap.cacheAsBitmap = true;
			pausetab_bitmap.x = 180;
			pausetab_bitmap.y = 60
			pausetab_bitmapdata.draw(pausetab_bitmap);
			addChild(pausetab_bitmap);
			
			//pause store button			
			//store button 
			store_button_bitmap.cacheAsBitmap = true;
			//store_button_bitmapdata.draw(store_button_bitmap);
			store_mc.addChild(store_button_bitmap);
			store_mc.x = 300;
			store_mc.y = 110;
			//store_mc.addEventListener(MouseEvent.MOUSE_OVER, storeover);
			//store_mc.addEventListener(MouseEvent.MOUSE_OUT, storeout);
			store_mc.addEventListener(MouseEvent.CLICK, storeClick);
			addChild(store_mc);
			//store background
			//store background button 
			
			//quit button 
			quit_button_bitmap.cacheAsBitmap = true;
			quit_button_bitmapdata.draw(quit_button_bitmap);
			quit_mc.addChild(quit_button_bitmap);
			quit_mc.x = 300;
			quit_mc.y = 250;
			quit_mc.addEventListener(MouseEvent.MOUSE_OVER, quitover);
			quit_mc.addEventListener(MouseEvent.MOUSE_OUT, quitout);
			quit_mc.addEventListener(MouseEvent.CLICK, quitClick);
			addChild(quit_mc);
			//quit background  
			quit_background_bitmap.cacheAsBitmap = true;
			quit_background_bitmap.x = 300;
			quit_background_bitmap.y = 250;
			quit_background_bitmapdata.draw(quit_background_bitmap);
			addChild(quit_background_bitmap);
			quit_background_bitmap.visible = false;
			
			//menu button 
			menu_button_bitmap.cacheAsBitmap = true;
			menu_button_bitmapdata.draw(menu_button_bitmap);
			menu_mc.addChild(menu_button_bitmap);
			menu_mc.x = 300;
			menu_mc.y = 180;
			menu_mc.addEventListener(MouseEvent.MOUSE_OVER, menuover);
			menu_mc.addEventListener(MouseEvent.MOUSE_OUT, menuout);
			menu_mc.addEventListener(MouseEvent.CLICK, menuClick);
			addChild(menu_mc);
			
			//back button 
			back_button_bitmap.cacheAsBitmap = true;
			back_button_bitmapdata.draw(back_button_bitmap);
			back_mc.addChild(back_button_bitmap);
			back_mc.x = 300;
			back_mc.y = 320;
			back_mc.addEventListener(MouseEvent.MOUSE_OVER, backover);
			back_mc.addEventListener(MouseEvent.MOUSE_OUT, backout);
			back_mc.addEventListener(MouseEvent.CLICK, backClick);
			addChild(back_mc);

			
		}
		//store over button
		private function storeover(event:MouseEvent):void
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			store_background_bitmap.visible = true;
		}
		//store out button
		private function storeout(event:MouseEvent):void
		{
			store_background_bitmap.visible = false;
		}
		//store button 
		private function storeClick(event:MouseEvent):void
		{
			
			destroymenu();
			store_class = new StoreMain();
			addChild(store_class);
			
		}
		//quit over button
		private function quitover(event:MouseEvent):void
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			quit_background_bitmap.visible = true;
		}
		//store out button
		private function quitout(event:MouseEvent):void
		{
			quit_background_bitmap.visible = false;
		}
		//store button 
		private function quitClick(event:MouseEvent):void
		{
			
			
			hud_class.level_class.destroy();
			hud_class.destroygui();
			this.destroymenu();
			System.gc();
			//ANDROID EXIT COMMAND
			//NativeApplication.nativeApplication.exit();
			//DESKTOP EXIT COMMAND
			fscommand("quit");
		}
		//menu events
		//menu over button
		private function menuover(event:MouseEvent):void
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			
			//menu background button 
			menu_background_bitmap.cacheAsBitmap = true;
			menu_background_bitmap.x = 300;
			menu_background_bitmap.y = 180;
			menu_background_bitmapdata.draw(menu_background_bitmap);
			addChild(menu_background_bitmap);
		}
		//menu out button
		private function menuout(event:MouseEvent):void
		{
			removeChild(menu_background_bitmap);
		}
		//menu click button 
		private function menuClick(event:MouseEvent):void
		{
			destroymenu();
			hud_class.level_class.destroy();
			hud_class.level_class.main_class.show_starttitle(); 
		}
		//back events
		//back over button
		private function backover(event:MouseEvent):void
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			
			//back background
			back_background_bitmap.cacheAsBitmap = true;
			back_background_bitmap.x = 300;
			back_background_bitmap.y = 320;
			back_background_bitmapdata.draw(back_background_bitmap);
			addChild(back_background_bitmap);
		}
		//back out button
		private function backout(event:MouseEvent):void
		{
			removeChild(back_background_bitmap);
		}
		//back click button 
		private function backClick(event:MouseEvent):void
		{
			removeChild(back_background_bitmap);
			//remove pause background and store
			destroymenu();
			//ADDS BELL BUTTON LISTENER
			//hud_class.addBellListener();
			//===========================
		}
		
		public function destroymenu()
		{
			//pause background image
			removeChild(pausetab_bitmap);
			pausetab_bitmap = null;
			//============================
			
			//store events
			//store_mc.removeEventListener(MouseEvent.MOUSE_OVER, storeover);
			//store_mc.removeEventListener(MouseEvent.MOUSE_OUT, storeout);
			store_mc.removeEventListener(MouseEvent.CLICK, storeClick);
			//store button 
			removeChild(store_mc);
			store_mc = null;
			//store background
			//removeChild(store_background_bitmap);
			//store_background_bitmap = null;
			
			//REMOVE QUIT BUTTON EVENTS
			quit_mc.removeEventListener(MouseEvent.MOUSE_OVER, quitover);
			quit_mc.removeEventListener(MouseEvent.MOUSE_OUT, quitout);
			quit_mc.removeEventListener(MouseEvent.CLICK, quitClick);
			//REMOVE QUIT BUTTON
			removeChild(quit_background_bitmap);
			quit_background_bitmap = null;
			removeChild(quit_mc);
			quit_mc = null;
			//===========================================================
			
			//REMOVE MENU BUTTON EVENTS
			menu_mc.removeEventListener(MouseEvent.MOUSE_OVER, menuover);
			menu_mc.removeEventListener(MouseEvent.MOUSE_OUT, menuout);
			menu_mc.removeEventListener(MouseEvent.CLICK, menuClick);
			//REMOVE MENU BUTTON
			removeChild(menu_mc);
			menu_mc = null;
			//===========================================================
			
			//REMOVE BACK BUTTON EVENTS
			back_mc.removeEventListener(MouseEvent.MOUSE_OVER, backover);
			back_mc.removeEventListener(MouseEvent.MOUSE_OUT, backout);
			back_mc.removeEventListener(MouseEvent.CLICK, backClick);
			//REMOVE BACK BUTTON
			removeChild(back_mc);
			back_mc = null;
			//============================================================
			
		}
////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
