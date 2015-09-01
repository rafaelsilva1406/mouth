/*rafael silva last update 7/25/2012*/
//set how much time to display image on screen
//give dir folder name to find the class location
package splashfactory
{
	/* import all the libs that will us from flash builder */
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class splashscreen extends Sprite {
		
		//splash background
		private var splash_background_obj:splashbackground;
		
		//time 1800 ms 
		private var myTimer:Timer = new Timer(1000,1);
		
		//class structure
		public var main_class:Main;
		
		public function splashscreen(passed_class:Main) {
			// constructor code
			
			//set structure
			main_class = passed_class;
			
			//add background image object
			splash_background_obj = new splashbackground(this);
			addChild(splash_background_obj);
			
			//add timer event
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			
			//start timer event
			myTimer.start();
			
		}
		//event function for timer
		private function timerListener (e:TimerEvent):void
		{
				//remove event
				myTimer.removeEventListener(TimerEvent.TIMER, timerListener);
				
				//destroy
				//var remove object
				removeChild(splash_background_obj);
				//object release memory
				splash_background_obj.destroysplashbackground();
				
				//start next class structure
				main_class.show_title();
		}
/////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
