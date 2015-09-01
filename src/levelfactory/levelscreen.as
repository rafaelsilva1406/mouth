/* ricardo limo last update 8/20/2012*/


package levelfactory 
{//start package

	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.ui.Mouse;
	import flash.ui.Keyboard;
	
	public class levelscreen extends Sprite
	{//start class
	
		//public var currentTeeth:MovieClip;
		//class structure
		//statements
		public static const state_play:int = 1;
		public static const state_gameover:int = 2;
		public var gamestate:int;
		
		public var main_class:Main;
		public var gameinfo:GameInfo;
		
		
		//class objects
		//screen background image 
		public var background_screen_class:backgroundlayer;
		
		//hud 
		public var gui_screen_class:hud;
		//sound 
		//public var sound_screen_class:levelsound;
		
		//punchbag 
		public var punchbag_mc:punchbag = new punchbag;
		
		//score total class
		public var score_screen:scoremenuscreen;
		public var _currentTool:Sprite;
		public var _toolCount:int;
		//private var _lastFrame:int;
		public var _animate:Boolean;
		
		//TOP TEETH
		private var tt1_mc:tt1;
		private var tooth1:Tooth;
		private var tt2_mc:tt2;
		private var tooth2:Tooth;
		private var tt3_mc:tt3;
		private var tooth3:Tooth;
		private var tt4_mc:tt4;
		private var tooth4:Tooth;
		private var tt5_mc:tt5;
		private var tooth5:Tooth;
		private var tt6_mc:tt6;
		private var tooth6:Tooth;
		private var tt7_mc:tt7;
		private var tooth7:Tooth;
		private var tt8_mc:tt8;
		private var tooth8:Tooth;
		private var tt9_mc:tt9;
		private var tooth9:Tooth;
		private var tt10_mc:tt10;
		private var tooth10:Tooth;
		private var tt11_mc:tt11;
		private var tooth11:Tooth;
		private var tt12_mc:tt12;
		private var tooth12:Tooth;
		private var tt13_mc:tt13;
		private var tooth13:Tooth;
		private var tt14_mc:tt14;
		private var tooth14:Tooth;
		//===========================
		
		//BOTTOM TEETH
		private var bt1_mc:bt1;
		private var btooth1:Tooth;
		private var bt2_mc:bt2;
		private var btooth2:Tooth;
		private var bt3_mc:bt3;
		private var btooth3:Tooth;
		private var bt4_mc:bt4;
		private var btooth4:Tooth;
		private var bt5_mc:bt5;
		private var btooth5:Tooth;
		private var bt6_mc:bt6;
		private var btooth6:Tooth;
		private var bt7_mc:bt7;
		private var btooth7:Tooth;
		private var bt8_mc:bt8;
		private var btooth8:Tooth;
		private var bt9_mc:bt9;
		private var btooth9:Tooth;
		private var bt10_mc:bt10;
		private var btooth10:Tooth;
		private var bt11_mc:bt11;
		private var btooth11:Tooth;
		private var bt12_mc:bt12;
		private var btooth12:Tooth;
		private var bt13_mc:bt13;
		private var btooth13:Tooth;
		private var bt14_mc:bt14;
		private var btooth14:Tooth;
		//===========================

		
		//tool
		public var grinder_mc:grinder_class = new grinder_class();
		public var drill_mc:dentistdrill_class = new dentistdrill_class();
		public var hammer_mc:hammer_class = new hammer_class();
		public var plier:plier_mc = new plier_mc();
		
		//text 
		//score
		public var score_txt:TextField;
		
		//int
		private var i:int;
		//count how many clicks 
		public var clicks:int;
		
		public var soundPlaying:Boolean;
		
		public var sound_screen_class:levelsound;
		
		public static var _levelScreen:levelscreen;
		
		public function levelscreen(passed_class:Main) 
		{//start constructure
			// constructor code
			_levelScreen = this;
			gameinfo = new GameInfo();
			sound_screen_class = new levelsound();
			this.clicks = 0;
			this._toolCount = 0;
			this._animate = true;
			this.soundPlaying = false;
			//class structure
			main_class = passed_class;
			addEventListener(KeyboardEvent.KEY_DOWN, onkeydown);
			//draw assest to screen
			display();
			
		}//end construc
		
		private function onkeydown(event:KeyboardEvent):void
		{
			removeEventListener(KeyboardEvent.KEY_DOWN, onkeydown);
			if(event.keyCode == Keyboard.HOME || event.keyCode == Keyboard.BACK )
			{
				event.preventDefault();
				destroy();
				System.gc();
				NativeApplication.nativeApplication.exit();
			}
			
		}
		
		public function display():void
		{
			
			//draws punching bag
			drawuv();
			
			//draws mouth background
			drawbackground();
			
			//adds background sound
			addsound();
			
			//draws teeth and its hitboxes
			drawanimations();
			
			drawhud();
	
			gameplay();
			
		}
		
		public function drawuv():void
		{
			punchbag_mc.x = 330;
			punchbag_mc.y = 150;
			punchbag_mc.gotoAndStop(1);
			addChild(punchbag_mc);
		}
		
		public function drawbackground():void
		{
			background_screen_class = new backgroundlayer(this);
			addChild(background_screen_class);
		}
		
		public function addsound():void
		{
			addChild(sound_screen_class);
		}
		
		public function drawanimations():void
		{
			//TOOP TEETH
			tt1_mc = new tt1();
			this.tooth1 = new Tooth(57,147,this.tt1_mc,111,200,8,33);
			this.tooth1.setFrames(2,25,50,101,63,88,102,103);
			
			tt2_mc = new tt2();
			this.tooth2 = new Tooth(65,136,tt2_mc,129,204,10,25);
			this.tooth2.setFrames(2,27,52,114,76,101,115,116);
			
			tt3_mc = new tt3();
			this.tooth3 = new Tooth(87,136,tt3_mc,147,190,8,25);
			this.tooth3.setFrames(2,27,52,103,65,90,104,105);
			
			tt4_mc = new tt4();
			this.tooth4 = new Tooth(103,127,tt4_mc,162,180,23,25);
			this.tooth4.setFrames(2,27,52,151,89,114,152,153);
			
			tt5_mc = new tt5();
			this.tooth5 = new Tooth(145,105,tt5_mc,203,147,28,80);
			this.tooth5.setFrames(2,25,50,125,75,100,126,127);
			
			tt6_mc = new tt6();
			this.tooth6 = new Tooth(210,100,tt6_mc,260,133,40,95);
			this.tooth6.setFrames(2,27,52,199,113,138,200,201);
			
			tt7_mc = new tt7();
			this.tooth7 = new Tooth(292,106,tt7_mc,334,137,65,90);
			this.tooth7.setFrames(2,27,52,199,113,138,200,201);
			
			tt8_mc = new tt8();
			this.tooth8 = new Tooth(388,106,tt8_mc,425,137,72,94);
			this.tooth8.setFrames(2,27,52,175,101,126,176,177);
			
			tt9_mc = new tt9();
			this.tooth9 = new Tooth(470,107,tt9_mc,517,155,54,65);
			this.tooth9.setFrames(2,27,52,151,89,114,152,153);
			
			tt10_mc = new tt10();
			this.tooth10 = new Tooth(526,110,tt10_mc,580,158,37,60);
			this.tooth10.setFrames(2,27,52,223,125,150,224,225);
			
			tt11_mc = new tt11();
			this.tooth11 = new Tooth(562,120,tt11_mc,626,167,20, 58);
			this.tooth11.setFrames(2,27,52,175,101,126,176,177);
			
			tt12_mc = new tt12();
			this.tooth12 = new Tooth(577,132,tt12_mc,654,184,6,32);
			this.tooth12.setFrames(2,27,52,127,77,102,128,129);
			
			tt13_mc = new tt13();
			this.tooth13 = new Tooth(592,142,tt13_mc,665,198,6,30);
			this.tooth13.setFrames(2,27,50,101,63,88,102,103);
			
			tt14_mc = new tt14();
			this.tooth14 = new Tooth(610,132,tt14_mc,678,205,8,20);
			this.tooth14.setFrames(2,27,52,103,65,90,104,105);
			//====================================================
			
			//BOTTOM TEETH
			bt1_mc = new bt1();
			this.btooth1 = new Tooth(52,220,bt1_mc,103,272,25,35);
			this.btooth1.setFrames(2,27,52,151,89,114,152,153);
			
			bt2_mc = new bt2();
			this.btooth2 = new Tooth(80,248,bt2_mc,141,305,7,20);
			this.btooth2.setFrames(2,27,52,127,77,102,128,129);
			
			bt3_mc = new bt3();
			this.btooth3 = new Tooth(108,253,bt3_mc,172,305,10,40);
			this.btooth3.setFrames(2,27,52,79,53,78,80,81);
			
			bt4_mc = new bt4();
			this.btooth4 = new Tooth(141,257,bt4_mc,206,305,12,40);
			this.btooth4.setFrames(2,27,52,127,77,102,128,129);
			
			bt5_mc = new bt5();
			this.btooth5 = new Tooth(186,263,bt5_mc,246,295,34,42);
			this.btooth5.setFrames(2,27,52,151,89,114,152,153);
			
			bt6_mc = new bt6();
			this.btooth6 = new Tooth(251,254,bt6_mc,306,294,30,58);
			this.btooth6.setFrames(2,27,52,151,89,113,152,153);
			
			bt7_mc = new bt7();
			this.btooth7 = new Tooth(307,250,bt7_mc,362,290,35,64);
			this.btooth7.setFrames(2,27,52,175,101,126,176,177);
			
			bt8_mc = new bt8();
			this.btooth8 = new Tooth(366,256,bt8_mc,423,296,35,58);
			this.btooth8.setFrames(2,27,52,175,101,126,176,177);
			
			bt9_mc = new bt9();
			this.btooth9 = new Tooth(430,259,bt9_mc,484,298,37,56);
			this.btooth9.setFrames(2,27,52,175,101,126,176,177);
			
			bt10_mc = new bt10();
			this.btooth10 = new Tooth(475,257,bt10_mc,548,296,20,58);
			this.btooth10.setFrames(2,27,52,103,65,90,104,105);
			
			bt11_mc = new bt11();
			this.btooth11 = new Tooth(523,257,bt11_mc,590,310,13,40);
			this.btooth11.setFrames(2,27,52,151,89,114,152,153);
			
			bt12_mc = new bt12();
			this.btooth12 = new Tooth(553,260,bt12_mc,618,322,7,20);
			this.btooth12.setFrames(2,27,52,127,77,102,128,129);
			
			bt13_mc = new bt13();
			this.btooth13 = new Tooth(558,245,bt13_mc,624,304,15,18);
			this.btooth13.setFrames(2,27,52,139,89,114,140,141);
			
			bt14_mc = new bt14();
			this.btooth14 = new Tooth(579,208,bt14_mc,644,262,10,30);
			this.btooth14.setFrames(2,27,52,103,65,90,104,105);
			//====================================================
			
									
			addChild(tt1_mc);
			addChild(tt2_mc);
			addChild(tt3_mc);
			addChild(tt4_mc);
			addChild(tt5_mc);
			addChild(tt6_mc);
			addChild(tt7_mc);
			addChild(tt8_mc);
			addChild(tt9_mc);
			addChild(tt10_mc);
			addChild(tt11_mc);
			addChild(tt12_mc);
			addChild(tt13_mc);
			addChild(tt14_mc);
			addChild(bt1_mc);
			addChild(bt2_mc);
			addChild(bt3_mc);
			addChild(bt4_mc);
			addChild(bt5_mc);
			addChild(bt6_mc);
			addChild(bt7_mc);
			addChild(bt8_mc);
			addChild(bt9_mc);
			addChild(bt10_mc);
			addChild(bt11_mc);
			addChild(bt12_mc);
			addChild(bt13_mc);
			addChild(bt14_mc);
			
			addChild(tooth2);
			addChild(tooth1);
			addChild(tooth3);
			addChild(tooth4);
			addChild(tooth5);
			addChild(tooth6);
			addChild(tooth7);
			addChild(tooth8);
			addChild(tooth9);
			addChild(tooth10);
			addChild(tooth11);
			addChild(tooth12);
			addChild(tooth13);
			addChild(tooth14);
			addChild(btooth1);
			addChild(btooth2);
			addChild(btooth3);
			addChild(btooth4);
			addChild(btooth5);
			addChild(btooth6);
			addChild(btooth7);
			addChild(btooth8);
			addChild(btooth9);
			addChild(btooth10);
			addChild(btooth11);
			addChild(btooth12);
			addChild(btooth13);
			addChild(btooth14);
		}
		
		//REMOVES TOP AND BOTTOM TEETH
		public function resetteeth()
		{
			//top teeth
			//======================
			removeChild();
			
		}
		
		//removes game interface
		public function drawhud():void
		{
			
			//background score and level
			gui_screen_class = new hud(this);
			addChild(gui_screen_class);
			
			//text points
			var scoreFormat:TextFormat = new TextFormat();
			scoreFormat.size = 30;
			scoreFormat.align = TextFormatAlign.CENTER;
			score_txt = new TextField();
			score_txt.defaultTextFormat = scoreFormat;
			score_txt.x = -15;
			score_txt.y = 20;
			score_txt.textColor = 0x990099;
			addChild(score_txt);
			score_txt.text = "0";
			
		}
		
		//TOOLS
		//==============================
		
		//ADDS GRINDER TO SCREEN
		public function addgrinder()
		{	
			grinder_mc.x = 250;
			grinder_mc.y = 250;
			addChild(grinder_mc);
			grinder_mc.mouseEnabled = false;
			grinder_mc.mouseChildren = false;
			this._currentTool = this.grinder_mc;
			_toolCount+=1;
			
			
		}
		//=====================================
		//ADDS PLIER TO SCREEN
		public function addplier()
		{	
			plier.x = 250;
			plier.y = 250;
			addChild(plier);
			plier.mouseEnabled = false;
			plier.mouseChildren = false;
			this._currentTool = this.plier;
			_toolCount+=1;
			
			
		}
		//=====================================
		
		//ADDS DRILL TO SCREEN
		public function adddrill()
		{
			
			drill_mc.x = 250;
			drill_mc.y = 250;
			addChild(drill_mc);
			drill_mc.mouseEnabled = false;
			drill_mc.mouseChildren = false;
			this._currentTool = this.drill_mc;
			_toolCount+=1;
			
			
		}
		//=========================================
		
		//ADDS HAMMER TO SCREEN
		public function addhammer()
		{
			hammer_mc.x = 250;
			hammer_mc.y = 250;
			addChild(hammer_mc);
			hammer_mc.mouseEnabled = false;
			hammer_mc.mouseChildren = false;
			this._currentTool = this.hammer_mc;
			_toolCount+=1;
			
			
		}
		//============================================
		
		public function addeventtools()
		{
		
			this.addEventListener(Event.ENTER_FRAME,enterclick);
			this.addEventListener(MouseEvent.MOUSE_MOVE, toolfollow);
			//this.addEventListener(MouseEvent.CLICK,countclick);
			
		}
		
		public function removetool()
		{
			this.removeEventListener(Event.ENTER_FRAME,enterclick);
			this.removeEventListener(MouseEvent.MOUSE_MOVE, toolfollow);
			//this.removeEventListener(MouseEvent.CLICK,countclick);
			
			//remove if current tool
			if(this._currentTool == grinder_mc)
			{
				removeChild(grinder_mc);
				this._currentTool = null;
				
			}
			else if(this._currentTool == drill_mc)
			{
				removeChild(drill_mc);
				this._currentTool = null;
				
			}
			else if(this._currentTool == hammer_mc)
			{
				removeChild(hammer_mc);
				this._currentTool = null;
				
			}
			else if(this._currentTool == plier)
			{
				removeChild(plier);
				this._currentTool = null;
				
			}
			
		}
		
		//tool follow cursor
		private function toolfollow(evt:MouseEvent)
		{
			if(grinder_mc)
			{
				grinder_mc.x = mouseX;
				grinder_mc.y = mouseY;
			}
			if(drill_mc)
			{
				drill_mc.x = mouseX;
				drill_mc.y = mouseY;
			}
			if(hammer_mc)
			{
				hammer_mc.x = mouseX;
				hammer_mc.y = mouseY
			}
			if(plier)
			{
				plier.x = mouseX;
				plier.y = mouseY;
				
			}
		}
		
		//main gameplay logic
		public function gameplay():void
		{
			clicks = 0;
			
		}
		//enter frame counts clicks 
		private function enterclick(e:Event)
		{
			
			if(clicks >= 160)
			{
				this.sound_screen_class.stopToolSound();
				score_screen = new scoremenuscreen();
				score_screen.setFinalScore(clicks);
				score_screen.setToolUsed(this._toolCount);
				this.gui_screen_class.destroygui();
				this.gui_screen_class = null;
				destroy();
				addChild(score_screen);
				
			}
		}
	
		

	

	public function destroy():void
		{//start function destroy
		
			removetool();
			
			
			//destroy background sound
			sound_screen_class.sounddestroy();
			
			//background sound 
			removeChild(sound_screen_class);
			sound_screen_class = null;
			
			//background image
			removeChild(background_screen_class);
			background_screen_class = null;
			
			//remove punchbag
			removeChild(punchbag_mc);
			punchbag_mc = null;
			
			//remove score text
			removeChild(score_txt);
			score_txt = null;
			
			//top teeth
			tooth1.destroyTooth();
			tooth2.destroyTooth();
			tooth3.destroyTooth();
			tooth4.destroyTooth();
			tooth5.destroyTooth();
			tooth6.destroyTooth();
			tooth7.destroyTooth();
			tooth8.destroyTooth();
			tooth9.destroyTooth();
			tooth10.destroyTooth();
			tooth11.destroyTooth();
			tooth12.destroyTooth();
			tooth13.destroyTooth();
			tooth14.destroyTooth();
			//====================
			
			//bottom teeth
			btooth1.destroyTooth();
			btooth2.destroyTooth();
			btooth3.destroyTooth();
			btooth4.destroyTooth();
			btooth5.destroyTooth();
			btooth6.destroyTooth();
			btooth7.destroyTooth();
			btooth8.destroyTooth();
			btooth9.destroyTooth();
			btooth10.destroyTooth();
			btooth11.destroyTooth();
			btooth12.destroyTooth();
			btooth13.destroyTooth();
			btooth14.destroyTooth();
			//=====================
			
			removeChild(this.tt1_mc);
			tt1_mc = null;
			
			removeChild(this.tt2_mc);
			tt2_mc = null;
			
			removeChild(this.tt3_mc);
			tt3_mc = null;
			
			removeChild(this.tt4_mc);
			tt4_mc = null;
			
			removeChild(this.tt5_mc);
			tt5_mc = null;
			
			removeChild(this.tt6_mc);
			tt6_mc = null;
			
			removeChild(this.tt7_mc);
			tt7_mc = null;
			
			removeChild(this.tt8_mc);
			tt8_mc = null;
			
			removeChild(this.tt9_mc);
			tt9_mc = null;
			
			removeChild(this.tt10_mc);
			tt10_mc = null;
			
			removeChild(this.tt11_mc);
			tt11_mc = null;
			
			removeChild(this.tt12_mc);
			tt12_mc = null;
			
			removeChild(this.tt13_mc);
			tt13_mc = null;
			
			removeChild(this.tt14_mc);
			tt14_mc = null;
			
			removeChild(this.bt1_mc);
			bt1_mc = null;
			
			removeChild(this.bt2_mc);
			bt2_mc = null;
			
			removeChild(this.bt3_mc);
			bt3_mc = null;
			
			removeChild(this.bt4_mc);
			bt4_mc = null;
			
			removeChild(this.bt5_mc);
			bt5_mc = null;
			
			removeChild(this.bt6_mc);
			bt6_mc = null;
			
			removeChild(this.bt7_mc);
			bt7_mc = null;
			
			removeChild(this.bt8_mc);
			bt8_mc = null;
			
			removeChild(this.bt9_mc);
			bt9_mc = null;
			
			removeChild(this.bt10_mc);
			bt10_mc = null;
			
			removeChild(this.bt11_mc);
			bt11_mc = null;
			
			removeChild(this.bt12_mc);
			bt12_mc = null;
			
			removeChild(this.bt13_mc);
			bt13_mc = null;
			
			removeChild(this.bt14_mc);
			bt14_mc = null;
		}//end function 
		
		
		
		
		
		}//end class
}//end package