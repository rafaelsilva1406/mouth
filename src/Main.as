package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.system.System;
	import flash.desktop.NativeApplication;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import splashfactory.splashscreen;
	import startfactory.titlescreen;
	import instructionfactory.instructionscreen;
	import levelfactory.levelscreen;
	
	public class Main extends Sprite{
		//low frame when splash, start, and instruction screen
		public static const low_frame:int = 12;
		public static var _Main:Main;
		private var startframerate;
		
		//call existing object classes
		public var splash_screen_class:splashscreen;
		public var title_screen_class:titlescreen;
		public var instruction_screen_class:instructionscreen;
		public var level_screen_class:levelscreen;
			
		public function Main()
		{
			_Main = this;
			//show_title();
			// constructor code
			
			//TAKE THE STAGE CONDITION OFF FOR AIR APPS
			//if(stage==null)
			//{
				this.addEventListener(Event.ADDED_TO_STAGE,added);
			//}
			//else
			//{
				stage.addEventListener(Event.DEACTIVATE, gameDeactive);
				
			//}
			
		}
		
		public function added(e:Event):void
		{
			trace("sweet");
			removeEventListener(Event.ADDED_TO_STAGE,added);
			startframerate = stage.frameRate;
			show_splash();
		}
		//check to see if window in not active
		public function gameDeactive(event:Event):void
		{
			trace("bye");
			removeEventListener(Event.DEACTIVATE, gameDeactive);
			System.gc();
			NativeApplication.nativeApplication.exit();
		}
		public function show_splash()
		{
			//call splash class
			splash_screen_class = new splashscreen(this);
			//add splash class
			addChild(splash_screen_class);
			
			startframerate = low_frame;
			
		}
		//show title class after class
		public function show_title()
		{
			//remove splash class
			//removeChild(splash_screen_class);
			//splash_screen_class = null;
			title_screen_class = new titlescreen(_Main);
			//add title class
			addChild(title_screen_class);
			//stage.frameRate = low_frame;
		}
		//show start after insruction is done
		public function show_maintitle()
		{
			//remove instruction objects
			removeChild(instruction_screen_class);
			instruction_screen_class = null;
			
			//add title class
			title_screen_class = new titlescreen(this);
			addChild(title_screen_class);
			startframerate = low_frame;
		}
		//show strat from level screen 
		public function show_starttitle()
		{
			//remove level screen 
			removeChild(level_screen_class);
			
			//add start screen 
			title_screen_class = new titlescreen(this);
			addChild(title_screen_class);
			startframerate = low_frame;
			
		}
		//instructions class show 
		public function show_instruction()
		{
			 //remove title class
			 title_screen_class.destroystart();
			 removeChild(title_screen_class);
			
			 
			 //add instructions
			 instruction_screen_class = new instructionscreen(this);
			 addChild(instruction_screen_class);
			 startframerate = low_frame;
		}
		public function show_level()
		{
			//remove title
			title_screen_class.destroystart();
			removeChild(title_screen_class);
			
			
			//add level
			level_screen_class = new levelscreen(this);
			addChild(level_screen_class);
			startframerate = startframerate;
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////

	}
	
}
