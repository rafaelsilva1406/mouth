/* rafael silva last update 7/30/2012 */

//dir where class location
package levelfactory  
{
	//import flash builder libs
	import flash.display.Sprite;
	import flash.events.*;
	import flash.media.*;
	
	
	public class levelsound extends Sprite 
	{
		//level class
		public var level_class:levelscreen;
		private var hammerplaying:Boolean;
		private var drillplaying:Boolean;
		private var grinderplaying:Boolean;
		private var _scream1:Boolean;
		private var _scream2:Boolean;
		private var _scream4:Boolean;
		private var _scream5:Boolean;
		private var _scream6:Boolean;
		private var _sScream1:Boolean;
		private var _sScream2:Boolean;
		private var _sScream3:Boolean;
		private var _sScream4:Boolean;
		private var _sScream5:Boolean;
		private var _sScream6:Boolean;
		private var _sScream7:Boolean;
		
		
		/***sounds****/
		private var _volumeAdjust:SoundTransform = new SoundTransform();
		
		//background song
		[Embed(source = "sound/background.mp3")]
		private var background_song_class:Class;
		private var background_sound:Sound = new background_song_class();
		private var background_channel:SoundChannel= new SoundChannel();
		
		/***pause button**/
		//bell song
		//embed song
		[Embed(source = "sound/bell_ting.mp3")]
		//set song class
		private var bell_class:Class;
		//point class to sound 
		private var bell_sound:Sound = new bell_class();
		//add sound to soundchannel controller
		private var bell_soundchannel:SoundChannel= new SoundChannel();
		
		//button click song
		[Embed(source = "sound/button_click.mp3")]
		private var button_class:Class;
		private var button_sound:Sound = new button_class();
		private var button_soundchannel:SoundChannel= new SoundChannel();
		
		//grinder sound
		[Embed(source = "sound/Grinder.mp3")]
		private var grinder:Class;
		private var grinder_sound:Sound = new grinder();
		private var grinder_soundChannel:SoundChannel = new SoundChannel();
		
		//drill sound
		[Embed(source = "sound/Dentist_Drill.mp3")]
		private var drill:Class;
		private var drill_sound:Sound = new drill();
		private var drill_soundChannel:SoundChannel = new SoundChannel();
		
		//hammer sound
		[Embed(source = "sound/ToothCrush.mp3")]
		private var hammer:Class;
		private var hammer_sound:Sound = new hammer();
		private var hammer_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_LongScream1.mp3")]
		private var scream1:Class;
		private var scream1_sound:Sound = new scream1();
		private var scream1_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_LongScream2.mp3")]
		private var scream2:Class;
		private var scream2_sound:Sound = new scream1();
		private var scream2_soundChannel:SoundChannel = new SoundChannel();
		
		
		[Embed(source = "sound/VO_LongScream4.mp3")]
		private var scream4:Class;
		private var scream4_sound:Sound = new scream4();
		private var scream4_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_LongScream5.mp3")]
		private var scream5:Class;
		private var scream5_sound:Sound = new scream5();
		private var scream5_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_LongScream6.mp3")]
		private var scream6:Class;
		private var scream6_sound:Sound = new scream6();
		private var scream6_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream1.mp3")]
		private var sScream1:Class;
		private var sScream1_sound:Sound = new sScream1();
		private var sScream1_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream2.mp3")]
		private var sScream2:Class;
		private var sScream2_sound:Sound = new sScream2();
		private var sScream2_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream3.mp3")]
		private var sScream3:Class;
		private var sScream3_sound:Sound = new sScream3();
		private var sScream3_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream4.mp3")]
		private var sScream4:Class;
		private var sScream4_sound:Sound = new sScream4();
		private var sScream4_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream5.mp3")]
		private var sScream5:Class;
		private var sScream5_sound:Sound = new sScream5();
		private var sScream5_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream6.mp3")]
		private var sScream6:Class;
		private var sScream6_sound:Sound = new sScream6();
		private var sScream6_soundChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "sound/VO_ShortScream7.mp3")]
		private var sScream7:Class;
		private var sScream7_sound:Sound = new sScream7();
		private var sScream7_soundChannel:SoundChannel = new SoundChannel();
		
		public function levelsound()
		{
			//create and play background sound 
			this.hammerplaying = false;
			background_channel = background_sound.play();
			background_channel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
		}
		
		//loop through sound when done again
		private function loopMusic(e:Event):void
		{
			if (background_channel != null)
			{
				background_channel.removeEventListener(Event.SOUND_COMPLETE, loopMusic);
				background_channel = background_sound.play();
				background_channel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
			}
		}
		
		//LONG SCREAMS
		public function scream1Sound():void
		{
			this._scream1 = true;
			this.scream1_soundChannel = this.scream1_sound.play();
			
		}
		
		public function scream2Sound():void
		{
			this._scream2 = true;
			this.scream2_soundChannel = this.scream2_sound.play();
			
		}
		
		public function scream4Sound():void
		{
			this._scream4 = true;
			this.scream4_soundChannel = this.scream4_sound.play();
			
		}
		public function scream5Sound():void
		{
			this._scream5 = true;
			this.scream5_soundChannel = this.scream5_sound.play();
			
		}
		public function scream6Sound():void
		{
			this._scream6 = true;
			this.scream6_soundChannel = this.scream6_sound.play();
			
		}
		//==========================================================
		
		
		//SHORT SCREAMS
		public function sScream1Sound():void
		{
			this._sScream1 = true;
			this.sScream1_soundChannel = this.sScream1_sound.play();
			
		}
		public function sScream2Sound():void
		{
			this._sScream2 = true;
			this.sScream2_soundChannel = this.sScream2_sound.play();
			
		}
		public function sScream3Sound():void
		{
			this._sScream3 = true;
			this.sScream3_soundChannel = this.sScream3_sound.play();
			
		}
		public function sScream4Sound():void
		{
			this._sScream4 = true;
			this.sScream4_soundChannel = this.sScream4_sound.play();
			
		}
		public function sScream5Sound():void
		{
			this._sScream5 = true;
			this.sScream5_soundChannel = this.sScream5_sound.play();
			
		}
		public function sScream6Sound():void
		{
			this._sScream6 = true;
			this.sScream6_soundChannel = this.sScream6_sound.play();
			
		}
		public function sScream7Sound():void
		{
			this._sScream7 = true;
			this.sScream7_soundChannel = this.sScream7_sound.play();
			
		}
		//===========================================================
		
		//TOOL SOUNDS
		public function grinderSound():void
		{
			this.grinderplaying = true;
			this.grinder_soundChannel = this.grinder_sound.play();
			this.grinder_soundChannel.addEventListener(Event.SOUND_COMPLETE, setAnimate);
		}
		
		public function drillSound():void
		{
			this.drillplaying = true;
			levelscreen._levelScreen.soundPlaying = true;
			this.drill_soundChannel = this.drill_sound.play();
			this.drill_soundChannel.addEventListener(Event.SOUND_COMPLETE,setAnimate);
		}
		public function hammerSound():void
		{
			this.hammerplaying = true;
			this.hammer_soundChannel = this.hammer_sound.play();
			this.hammer_soundChannel.addEventListener(Event.SOUND_COMPLETE,setAnimate);
			
		}
		//=============================================================================
		
		public function setAnimate(e:Event):void
		{
			e.target.removeEventListener(Event.SOUND_COMPLETE,setAnimate);
			levelscreen._levelScreen.soundPlaying = false;
			
			if(grinderplaying)
			{
				this.grinderplaying = false;
			}
			else if(drillplaying)
			{
				this.drillplaying = false;
			}
			
			if(hammerplaying == true)
			{
				levelscreen._levelScreen._animate = false;
				hammerplaying = false;
			}
			else
			{
				levelscreen._levelScreen._animate = true;
			}
			
		}
		
		//create and play button
		public function buttonsoundon():void
		{
			button_soundchannel = button_sound.play();
		}
		//create and play bell
		public function bellsoundon():void
		{
			bell_soundchannel = bell_sound.play();
		}
		//destroy background sound
		public function sounddestroy():void
		{
			//stop background sound
			background_channel.stop();
			//event to loop song over and over
			background_channel.removeEventListener(Event.SOUND_COMPLETE, loopMusic);
			
		}
		
		public function stopToolSound():void
		{
			if(grinderplaying)
			{
				this.grinder_soundChannel.stop();
			}
			else if(this.drillplaying)
			{
				this.drill_soundChannel.stop();
				
			}
			else if(this.hammerplaying)
			{
				this.hammer_soundChannel.stop();
				
			}
			else if(this._scream1)
			{
				this.scream1_soundChannel.stop();
				
			}
			else if(this._scream2)
			{
				this.scream2_soundChannel.stop();
				
			}
			else if(this._scream3)
			{
				this.scream3_soundChannel.stop();
				
			}
			else if(this._scream4)
			{
				this.scream4_soundChannel.stop();
				
			}
			else if(this._scream5)
			{
				this.scream5_soundChannel.stop();
				
			}
			else if(this._scream6)
			{
				this.scream6_soundChannel.stop();
				
			}
			else if(this._sScream1)
			{
				this.sScream1_soundChannel.stop();
				
			}
			else if(this._sScream2)
			{
				this.sScream2_soundChannel.stop();
				
			}
			else if(this._sScream3)
			{
				this.sScream3_soundChannel.stop();
				
			}
			else if(this._sScream4)
			{
				this.sScream4_soundChannel.stop();
				
			}
			else if(this._sScream5)
			{
				this.sScream5_soundChannel.stop();
				
			}
			else if(this._sScream6)
			{
				this.sScream6_soundChannel.stop();
				
			}
			
		}
		
//////////////////////////////////////////////////////////////////////////////////////////////		
	}
	
}
