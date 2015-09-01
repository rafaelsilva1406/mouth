package levelfactory  
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.display.SpreadMethod;
	
	public class hud extends Sprite
	{
		//level class
		public var level_class:levelscreen;
		
		//pause tab 
		public var pause_screen_class:pausemenu;
		
		//tool tab
		public var tool_tab_screen:toolsmenu;
		
		//scorebox
		[Embed(source = "assets/button/hud/score_background.png", compression = true)]
		private const scorebox_class:Class;
		private var scorebox_bitmap:Bitmap = new scorebox_class();
		private var scorebox_bitmapdata:BitmapData = new BitmapData (scorebox_bitmap.width, scorebox_bitmap.height,true, 0x00000000);
		
		//bell background
		//embed image
		[Embed(source = "assets/button/hud/bell_background.png", compression = true)]
		//set image to class
		private const bell_background_class:Class;
		//point class to bitmap
		private var bell_background_bitmap:Bitmap = new bell_background_class();
		//snapshot bitmap to bitmapdata
		private var bell_background_bitmapdata:BitmapData = new BitmapData (bell_background_bitmap.width, bell_background_bitmap.height,true, 0x00000000);
		
		//bell button
		//embed image 
		[Embed(source = "assets/button/hud/bell_button.png", compression = true)]
		//set image to class 
		private const bell_button_class:Class;
		//point class to bitmap 
		private var bell_button_bitmap:Bitmap = new bell_button_class();
		//snapshot bitmap to bitmapdata
		private var  bell_button_bitmapdata:BitmapData = new BitmapData (bell_button_bitmap.width, bell_button_bitmap.height,true, 0x00000000);
		//attach bitmap to movieclip
		public var bell_button_mc:MovieClip = new MovieClip();
		
		[Embed(source = "assets/button/hud/doneBtn.png",compression = true)]
		private const doneBtn:Class;
		private var _doneBtn:Bitmap = new doneBtn();
		private var doneBtHolder:Sprite = new Sprite();
		
		//drop button
		[Embed(source = "assets/button/hud/tools_button.png", compression = true)]
		private const tools_button_class:Class;
		private var tools_button_bitmap:Bitmap = new tools_button_class();
		private var tools_button_bitmapdata:BitmapData = new BitmapData (tools_button_bitmap.width, tools_button_bitmap.height,true, 0x00000000);
		public var tools_button_mc:MovieClip = new MovieClip();
		
		//music button
		[Embed(source = "assets/button/hud/music_button.png", compression = true)]
		private const music_button_class:Class;
		private var music_button_bitmap:Bitmap = new music_button_class();
		private var music_button_bitmapdata:BitmapData = new BitmapData (music_button_bitmap.width, music_button_bitmap.height,true, 0x00000000);
		public var music_mc:MovieClip = new MovieClip();
		
		//music background
		[Embed(source = "assets/button/hud/music_hover.png", compression = true)]
		private const music_background_class:Class;
		private var music_background_bitmap:Bitmap = new music_background_class();
		private var music_background_bitmapdata:BitmapData = new BitmapData (music_background_bitmap.width, music_background_bitmap.height,true, 0x00000000);
		public var music_hover_mc:MovieClip = new MovieClip();
		
		//effects button
		[Embed(source = "assets/button/hud/effects_button.png", compression = true)]
		private const effects_button_class:Class;
		private var effects_button_bitmap:Bitmap = new effects_button_class();
		private var effects_button_bitmapdata:BitmapData = new BitmapData (effects_button_bitmap.width, effects_button_bitmap.height,true, 0x00000000);
		public var effects_mc:MovieClip = new MovieClip();
		
		//effects background
		[Embed(source = "assets/button/hud/effects_hover.png", compression = true)]
		private const effects_background_class:Class;
		private var effects_background_bitmap:Bitmap = new effects_background_class();
		private var effects_background_bitmapdata:BitmapData = new BitmapData (effects_background_bitmap.width, effects_background_bitmap.height,true, 0x00000000);
		public var effects_hover_mc:MovieClip = new MovieClip();

		public var score_screen:scoremenuscreen;
		
		public function hud(attached_class:levelscreen) {
			// constructor code
			
			//level class
			level_class = attached_class;
			
			score_screen = new scoremenuscreen();
			//background to score 
			scorebox_bitmap.cacheAsBitmap = true;
			scorebox_bitmap.x = 10;
			scorebox_bitmap.y = 5;
			scorebox_bitmapdata.draw(scorebox_bitmap);
			addChild(scorebox_bitmap);
			
			//done button
			this._doneBtn.cacheAsBitmap = true;
			this.doneBtHolder.addChild(this._doneBtn);
			this.doneBtHolder.x = 358;
			this.doneBtHolder.y = 10;
			addChild(this.doneBtHolder);
			this.doneBtHolder.addEventListener(MouseEvent.CLICK, finishGame);
			
			//pause ringer
			bell_background_bitmap.cacheAsBitmap = true;
			bell_background_bitmapdata.draw(bell_background_bitmap);
			bell_background_bitmap.x = 3;
			bell_background_bitmap.y = 385;
			addChild(bell_background_bitmap);
			
			//pause button
			bell_button_bitmap.cacheAsBitmap = true;
			bell_button_bitmapdata.draw(bell_button_bitmap);
			bell_button_mc.addChild(bell_button_bitmap);
			bell_button_mc.x = 0;
			bell_button_mc.y = 400;
			bell_button_mc.addEventListener(MouseEvent.CLICK, pauseClick);
			bell_button_mc.addEventListener(MouseEvent.MOUSE_OVER, bellHover);
			addChild(bell_button_mc);
			
			//dropdown box
			//store object to cache 
			tools_button_bitmap.cacheAsBitmap = true;
			//draw image bitmap to bitmapdata
			tools_button_bitmapdata.draw(tools_button_bitmap);
			//add image bitmap object to movieclip
			tools_button_mc.addChild(tools_button_bitmap);
			//position movieclip x axis
			tools_button_mc.x = 690;
			//position movieclip y axis 
			tools_button_mc.y = 5;
			tools_button_mc.addEventListener(MouseEvent.MOUSE_OVER, toolhover);
			//add movieclip event mouseclick or touchevent 
			tools_button_mc.addEventListener(MouseEvent.CLICK, tooltxtClick);
			//add movieclip to stage
			addChild(tools_button_mc);
			
			//music button 
			music_button_bitmap.cacheAsBitmap = true;
			music_button_bitmapdata.draw(music_button_bitmap);
			music_mc.addChild(music_button_bitmap);
			music_mc.x = 100;
			music_mc.y = 430;
			music_mc.addEventListener(MouseEvent.CLICK, musicClick);
			addChild(music_mc);
			
			//music hover
			music_background_bitmap.cacheAsBitmap = true;
			music_background_bitmapdata.draw(music_background_bitmap);
			music_hover_mc.addChild(music_background_bitmap);
			music_hover_mc.x = 100;
			music_hover_mc.y = 430;
			music_hover_mc.addEventListener(MouseEvent.CLICK, musicbackgroundClick);
			
			//effects button 
			effects_button_bitmap.cacheAsBitmap = true;
			effects_button_bitmapdata.draw(effects_button_bitmap);
			effects_mc.addChild(effects_button_bitmap);
			effects_mc.x = 150;
			effects_mc.y = 430;
			effects_mc.addEventListener(MouseEvent.CLICK, effectsClick);
			addChild(effects_mc);
			
			//effects hover
			effects_background_bitmap.cacheAsBitmap = true;
			effects_background_bitmapdata.draw(effects_background_bitmap);
			effects_hover_mc.addChild(effects_background_bitmap);
			effects_hover_mc.x = 150;
			effects_hover_mc.y = 430;
			effects_hover_mc.addEventListener(MouseEvent.CLICK, effectsbackgroundClick);
			
		}
		
		private function finishGame(e:Event):void
		{
			this.doneBtHolder.removeEventListener(MouseEvent.CLICK,finishGame);
			score_screen.setFinalScore(level_class.clicks);
			score_screen.setToolUsed(level_class._toolCount);
			addChild(score_screen);
			this.level_class.destroy();
			this.destroygui();
			
			
			
			
		}
		//options button clicked
		private function pauseClick(event:MouseEvent):void
		{
			//sleep event that can effect the gameplay 
			//sleepon();
			//this.bell_button_mc.removeEventListener(MouseEvent.CLICK, pauseClick);
			level_class.sound_screen_class.bellsoundon();
			
			//tween to bell ringer
			var ringerTween:Tween = new Tween(bell_background_bitmap, "y", Strong.easeOut,  385, 389, 0.3, true);
		
			ringerTween.start();
			ringerTween.addEventListener(TweenEvent.MOTION_FINISH, onFinish);
			
			function onFinish(e:TweenEvent):void {
				bell_background_bitmap.x = 3;
				bell_background_bitmap.y = 385;
				
			}
			pause_screen_class = new pausemenu(this);
			addChild(pause_screen_class);
			
			
		}
		private function bellHover(e:Event):void
		{
			level_class.removetool();
			
		}
		
		public function addBellListener():void
		{
			this.bell_button_mc.addEventListener(MouseEvent.CLICK,pauseClick);
			trace("event bell  added");
			
		}
		//function for toolboxcollision event
		private function toolhover(event:MouseEvent):void
		{
			level_class.removetool();
		}
		//function for tools_button_mc event
		private function tooltxtClick(event:MouseEvent):void
		{
			//remove bell_button_mc event
			tools_button_mc.removeEventListener(MouseEvent.CLICK, tooltxtClick);
			//bell_button_mc.removeEventListener(MouseEvent.CLICK, pauseClick);
			//add extended class to stage 
			tool_tab_screen = new toolsmenu(this);
			addChild(tool_tab_screen);
		}
		public function addtoolboxevent()
		{
			tools_button_mc.addEventListener(MouseEvent.CLICK, tooltxtClick);
		}
		//music click button 
		private function musicClick(event:MouseEvent):void
		{
			
			removeChild(music_mc);
			addChild(music_hover_mc);
			level_class.sound_screen_class.sounddestroy();
			
		}
		private function musicbackgroundClick(event:MouseEvent):void
		{
			removeChild(music_hover_mc);
			addChild(music_mc);
			level_class.addsound();
		}
		//effects click button 
		private function effectsClick(event:MouseEvent):void
		{
			
			removeChild(effects_mc);
			addChild(effects_hover_mc);
			
			
		}
		private function effectsbackgroundClick(event:MouseEvent):void
		{
			removeChild(effects_hover_mc);
			addChild(effects_mc);
		}
		public function destroygui ()
		{
			//remove bell background
			removeChild(bell_background_bitmap);
			bell_background_bitmap = null;
			
			removeChild(this.doneBtHolder);
			this.doneBtHolder = null;
			
			//remove bell movieclip
			bell_button_mc.removeEventListener(MouseEvent.CLICK, pauseClick);
			removeChild(bell_button_mc);
			bell_button_mc = null;
			//remove score background
			removeChild(scorebox_bitmap);
			scorebox_bitmap = null;
			//remove tool button
			tools_button_mc.removeEventListener(MouseEvent.MOUSE_OVER, toolhover);
			//add movieclip event mouseclick or touchevent 
			tools_button_mc.removeEventListener(MouseEvent.CLICK, tooltxtClick);
			//add movieclip to stage
			removeChild(tools_button_mc);
			tools_button_mc = null;
			if(music_mc.parent)
			{
				music_mc.removeEventListener(MouseEvent.CLICK, musicClick);
				removeChild(music_mc);
			}
			if(music_hover_mc.parent)
			{
				music_hover_mc.removeEventListener(MouseEvent.CLICK, musicbackgroundClick);
				removeChild(music_hover_mc);
				music_hover_mc = null;
			}
			if(effects_mc.parent)
			{
				effects_mc.removeEventListener(MouseEvent.CLICK, effectsClick);
				removeChild(effects_mc);
			}
			if(effects_hover_mc.parent)
			{
				effects_hover_mc.removeEventListener(MouseEvent.CLICK, effectsbackgroundClick);
				removeChild(effects_hover_mc);
				effects_hover_mc = null;
			}
			
		}
///////////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
