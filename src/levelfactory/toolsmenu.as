package levelfactory 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent; 
	import flash.ui.Mouse;
	
	public class toolsmenu extends Sprite{
		//level class
		public var hud_class:hud;
		
		//icons tools tab
		//public var tools_icon_class:icontools;
		
		//background
		[Embed(source = "assets/background/background_tab.png", compression = true)]
		private const background_tab_class:Class;
		private var background_tab_bitmap:Bitmap = new background_tab_class();
		private var background_tab_bitmapdata:BitmapData = new BitmapData (background_tab_bitmap.width, background_tab_bitmap.height,true, 0x00000000);
		
		
		//arrow right
		//[Embed(source = "assets/button/tools/rightarrow_button.png", compression = true)]
		//private const rightarrow_button_class:Class;
		//private var rightarrow_button_bitmap:Bitmap = new rightarrow_button_class();
		//private var  rightarrow_button_bitmapdata:BitmapData = new BitmapData (rightarrow_button_bitmap.width, rightarrow_button_bitmap.height,true, 0x00000000);
		//public var rightarrow_button_mc:Sprite = new Sprite();
		
		//arrow left
		//[Embed(source = "assets/button/tools/leftarrow_button.png", compression = true)]
		//private const leftarrow_button_class:Class;
		//private var leftarrow_button_bitmap:Bitmap = new leftarrow_button_class();
		//private var  leftarrow_button_bitmapdata:BitmapData = new BitmapData (leftarrow_button_bitmap.width, leftarrow_button_bitmap.height,true, 0x00000000);
		//public var leftarrow_button_mc:Sprite = new Sprite();
		
		//grinder button
		[Embed(source = "assets/button/tools/grinder_button.png", compression = true)]
		private const grinder_button_class:Class;
		private var grinder_button_bitmap:Bitmap = new grinder_button_class();
		public var grinder_button_mc:Sprite = new Sprite();
		
		//grinder background
		//[Embed(source = "assets/button/tools/grinder_hover.png", compression = true)]
		//private const grinder_background_class:Class;
		//private var grinder_background_bitmap:Bitmap = new grinder_background_class();
		//private var  grinder_background_bitmapdata:BitmapData = new BitmapData (grinder_background_bitmap.width, grinder_background_bitmap.height,true, 0x00000000);
		
		//hand-drill button
		[Embed(source = "assets/button/tools/dentistdrill_button.png", compression = true)]
		private const drill_button_class:Class;
		private var drill_button_bitmap:Bitmap = new drill_button_class();
		public var drill_button_mc:Sprite = new Sprite();
		
		//hand-drill background
		//[Embed(source = "assets/button/tools/dentistdrill_hover.png", compression = true)]
		//private const drill_background_class:Class;
		//private var drill_background_bitmap:Bitmap = new drill_background_class();
		//private var  drill_background_bitmapdata:BitmapData = new BitmapData (drill_background_bitmap.width, drill_background_bitmap.height,true, 0x00000000);
		
		//hammer button
		[Embed(source = "assets/button/tools/hammer_button.png", compression = true)]
		private const hammer_button_class:Class;
		private var hammer_button_bitmap:Bitmap = new hammer_button_class();
		public var hammer_button_mc:Sprite = new Sprite();
		
		//hammer background
		//[Embed(source = "assets/button/tools/hammer_hover.png", compression = true)]
		//private const hammer_background_class:Class;
		//private var hammer_background_bitmap:Bitmap = new hammer_background_class();
		//private var  hammer_background_bitmapdata:BitmapData = new BitmapData (hammer_background_bitmap.width, hammer_background_bitmap.height,true, 0x00000000);
		
		//suturing button
		[Embed(source = "assets/button/tools/suturing_button.png", compression = true)]
		private const suturing_button_class:Class;
		public var threadButton:Bitmap = new suturing_button_class();
		public var threadSprite:Sprite = new Sprite();
		
		[Embed(source = "assets/button/tools/PlierBox.png", compression = true)]
		private const PLIERBUTTON:Class;
		private var plierButton:Bitmap = new PLIERBUTTON();
		public var plierSprite:Sprite = new Sprite();
		
		//default tools
		private var _defaultTools:Array = new Array();
		//=============================================
		
		//tools added through store
		public var _storeTools:Array = new Array();
		//=========================================
		
		public function toolsmenu(attach_class:hud) 
		{
			// constructor code
			count = 0;
			//level class
			hud_class = attach_class;
			
			//add background  
			backgroundimage();
			 
			//GRINDER
			//=========================================
			//cache image 
			grinder_button_bitmap.cacheAsBitmap = true;
			//ADDS GRINDER BUTTON TO ITS HOLDER
			grinder_button_mc.addChild(grinder_button_bitmap);
			//ADDS GRINDER TO THE TOOL DEFAULT ARRAY
			this.addTool(this.grinder_button_mc,this._defaultTools);
			//===========================================
			
			//HAMMER
			//=========================================
			//cache image 
			hammer_button_bitmap.cacheAsBitmap = true;
			//ADDS GRINDER BUTTON TO ITS HOLDER
			hammer_button_mc.addChild(hammer_button_bitmap);
			//ADDS GRINDER TO THE TOOL DEFAULT ARRAY
			this.addTool(this.hammer_button_mc,this._defaultTools);
			//===========================================
			
			//DRILL
			//=========================================
			//cache image 
			drill_button_bitmap.cacheAsBitmap = true;
			//ADDS GRINDER BUTTON TO ITS HOLDER
			drill_button_mc.addChild(drill_button_bitmap);
			//ADDS GRINDER TO THE TOOL DEFAULT ARRAY
			this.addTool(this.drill_button_mc,this._defaultTools);
			//===========================================
			
			//PLIERS
			//===============================================
			//cache image
			this.plierButton.cacheAsBitmap = true;
			//ADDS THE PLIER BUTTON TO ITS HOLDER
			this.plierSprite.addChild(this.plierButton);
			//ADDS THE PLIER TO THE TOOL DEFAULT ARRAY
			this.addTool(this.plierSprite,this._defaultTools);
			//===============================================
			
			//DISPLAYS THE DEFAULT TOOLS
			this.displayTools(this._defaultTools,140);
			this.setStoreArray();
			this.displayTools(this._storeTools,200);
			//============================
			
			
			//call icon tools class
			//tools_icon_class = new icontools(this);
			//addChild(tools_icon_class);
		
		}
		//FUNCTION TO PUSH DEFAULT TOOLS INTO ITS ARRAY
		public function addTool(tool:Sprite,arrayHolder:Array):void
		{
			arrayHolder.push(tool);
		}
		//=============================================
		
		//sets the store array to display tool buttons according to what the player chose on the store
		public function setStoreArray():void
		{
			//checks for then name of the tool clicked on the store
			for(var i:int = 0; i<GameInfo.storeArray.length; i++)
			{
				//makes the button matching to the tool that was chosen
				if(GameInfo.storeArray[i] == "Thread")
				{
					//adds the button bimap to the sprite holder and adds it to the screen 
					this.threadSprite.addChild(this.threadButton);
					this._storeTools.push(threadSprite);
				}
			}
		}
		//=========================================================================================
		
		//DISPLAYS THE DEFAULT TOOLS
		public function displayTools(arrayHolder:Array, _initialY:int):void
		{
		  //INITIAL X	
		  var initialX:int = 165;
		  var initialY:int = _initialY;
		  var previousX:int;
		  var space:int = 0;
		  //====================== 
		  
		  for(var i:int = 0; i < arrayHolder.length;i++)
		  {
			 
			   var newX:int = initialX + previousX + space;
			   
			  //SETS THE X AND Y OF THE TOOLS IN THE ARRAY
			  arrayHolder[i].x = newX;
			  arrayHolder[i].y = initialY;
		
			  //ADDS THEM TO THE SCREEN
			  addChild(arrayHolder[i]);
			  //======================== 
			  trace(arrayHolder[i]);
			  //ADDS AND EVENT LISTENER FOR TOOL CREATION
			  arrayHolder[i].addEventListener(MouseEvent.MOUSE_DOWN,onDown);
			  //=====================================================================
			  
			  //set initialX
			  initialX = 0;
			  //============
			  space = 120;
			  
			  //set previous x 
			  previousX = arrayHolder[i].x;
			  //==================================
			 
		  }
		  //clear from memory
		  previousX = null;
		  initialX = null;
		  space = null;
		  newX = null;
		  initialY = null;
		  //=================
		}
		//======================================================================
		
		//REMOVES DEFAULT TOOLS OF THE SCREEN
		public function removeTools(arrayHolder:Array):void
		{
		  for(var i:int = 0; i<arrayHolder.length;i++)
		  {
			//REMOVES THE TOOLS OFF THE SCREEN
			removeChild(arrayHolder[i]);
			//REMOVES THE TOOL LISTENER
			arrayHolder[i].removeEventListener(MouseEvent.MOUSE_DOWN,onDown);
		  }
			
		}
		//=========================================================================
		
		//TOOL BUTTON EVENT LISTENER
		public function onDown(e:Event):void
		{
			//REMOVES TOOLBOX BACKGROUND
			 removeChild(background_tab_bitmap);
			 //HOVER OPTION
			 //tools_icon_class.icontoolremove();
			 hud_class.addtoolboxevent();
			 hud_class.level_class.addeventtools();
			 //IF THE BUTTON WAS THE PLIER BUTTON
			 if(e.target == plierSprite)
			 {
				//ADDS PLIER TO SCREEN
			 	hud_class.level_class.addplier();
			 }
			 //=================================
			 
			 //IF THE BUTTON WAS THE GRINDER BUTTON
			 if(e.target == grinder_button_mc)
			 {
				 //ADDS GRINDER TO SCREEN
			 	hud_class.level_class.addgrinder();
			 }
			 //=====================================
			 
			  //IF THE BUTTON WAS THE DRILL BUTTON
			 if(e.target == drill_button_mc)
			 {
				 //ADDS DRILL TO SCREEN
			 	hud_class.level_class.adddrill();
			 }
			 //=====================================
			  //IF THE BUTTON WAS THE HAMMER BUTTON
			 if(e.target == hammer_button_mc)
			 {
				 //ADDS DRILL TO SCREEN
			 	hud_class.level_class.addhammer();
			 }
			 //=====================================
			 //REMOVES THE DEFAULT BUTTONS OFF THE SCREEN
			 removeTools(this._defaultTools);
			 removeTools(this._storeTools);
			 
		}
		//================================================
		
		public function backgroundimage()
		{
			//cache image 
			background_tab_bitmap.cacheAsBitmap = true;
			//position on screen
			background_tab_bitmap.x = 150;
			background_tab_bitmap.y = 120;
			//set bitmap to bitmapdata
			background_tab_bitmapdata.draw(background_tab_bitmap);
			//add object
			addChild(background_tab_bitmap);
		}
		//ARROW BUTTONS
		/*
		public function arrowbuttons()
		{
			//cache image 
			rightarrow_button_bitmap.cacheAsBitmap = true;
			//set bitmap to bitmapdata
			rightarrow_button_bitmapdata.draw(rightarrow_button_bitmap);
			//add object
			rightarrow_button_mc.addChild(rightarrow_button_bitmap);
			//position on screen
			rightarrow_button_mc.x = 550;
			rightarrow_button_mc.y = 205;
			rightarrow_button_mc.addEventListener(MouseEvent.MOUSE_DOWN, rightarrowdown);
			addChild(rightarrow_button_mc);
			
			//cache image 
			leftarrow_button_bitmap.cacheAsBitmap = true;
			//set bitmap to bitmapdata
			leftarrow_button_bitmapdata.draw(leftarrow_button_bitmap);
			//add object
			leftarrow_button_mc.addChild(leftarrow_button_bitmap);
			//position on screen
			leftarrow_button_mc.x = 150;
			leftarrow_button_mc.y = 205;
			leftarrow_button_mc.addEventListener(MouseEvent.MOUSE_DOWN, leftarrowdown);
			addChild(leftarrow_button_mc);
		}
		private function rightarrowdown(event:MouseEvent)
		{
			trace("down");
			rightarrow_button_mc.removeEventListener(MouseEvent.MOUSE_DOWN, rightarrowdown);
		}
		private function leftarrowdown(event:MouseEvent)
		{
			leftarrow_button_mc.removeEventListener(MouseEvent.MOUSE_DOWN, leftarrowdown);
			leftarrowtween();
			
		}
		public function leftarrowtween()
		{
			trace("down");
			if(suturing_button_mc.parent)
			{
				var suturing_tween = new Tween(suturing_button_mc, "x", Strong.easeOut, 535,165, 1, true);
				suturing_tween.addEventListener(TweenEvent.MOTION_CHANGE, onChange);
				function onChange(e:TweenEvent):void
				{
					if(suturing_button_mc.x == 165)
					{
						if(suturing_button_mc.parent)
						{
							suturing_button_mc.parent.removeChild(suturing_button_mc);
						}
						
					}
				}
				suturing_tween.start();
			}
			if(hammer_button_mc.parent)
			{
				var hammer_tween = new Tween(hammer_button_mc, "x", Strong.easeOut, 410,165, 1, true);
				hammer_tween.addEventListener(TweenEvent.MOTION_CHANGE, onChange);
				function onChange(e:TweenEvent):void
				{
					if(hammer_button_mc.x == 165)
					{
						if(hammer_button_mc.parent)
						{
							hammer_button_mc.parent.removeChild(hammer_button_mc);
						}
						
					}
				}
				hammer_tween.start();
			}
			if(drill_button_mc.parent)
			{
				var drill_tween = new Tween(drill_button_mc, "x", Strong.easeOut, 290,165, 1, true);
				drill_tween.addEventListener(TweenEvent.MOTION_CHANGE, onChange);
				function onChange(e:TweenEvent):void
				{
					if(drill_button_mc.x == 165)
					{
						if(drill_button_mc.parent)
						{
							drill_button_mc.parent.removeChild(drill_button_mc);
						}
					}
				}
				drill_tween.start();
			}
			if(grinder_button_mc.parent)
			{
				var grindertimer:Timer = new Timer(1000,1);
				grindertimer.addEventListener(TimerEvent.TIMER, grinderlistener);
				function grinderlistener(evt:TimerEvent)
				{
					grindertimer.removeEventListener(TimerEvent.TIMER, grinderlistener);
					if(grinder_button_mc.parent)
					{
							grinder_button_mc.parent.removeChild(grinder_button_mc);
					}
				}
				//start timer event
				grindertimer.start();
			}
			
		}
		*/
		/*
		private function plierOver(event:MouseEvent)
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			//cache image
			tools_icon_class.icontool4();

		}
		private function plierOut(event:MouseEvent)
		{
			tools_icon_class.icontoolremove();
			
		}
		*/
	
	
		/*
		private function grinderOver(event:MouseEvent)
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			//cache image 
			grinder_background_bitmap.cacheAsBitmap = true;
			//position on screen
			grinder_background_bitmap.x = 165;
			grinder_background_bitmap.y = 140;
			//set bitmap to bitmapdata
			grinder_background_bitmapdata.draw(grinder_background_bitmap);
			//add object
			addChild(grinder_background_bitmap);
		
			tools_icon_class.icontool1();

		}
		private function grinderOut(event:MouseEvent)
		{
			removeChild(grinder_background_bitmap);
			tools_icon_class.icontoolremove();
			
		}
		*/
		
		//DRILL BUTTON
		//========================================================
		public function drillbutton()
		{
			//cache image 
			drill_button_bitmap.cacheAsBitmap = true;
			//set bitmap to bitmapdata
			drill_button_bitmapdata.draw(drill_button_bitmap);
			//add object
			drill_button_mc.addChild(drill_button_bitmap);
			//position on screen
			drill_button_mc.x = 290;
			drill_button_mc.y = 140;
			//drill_button_mc.addEventListener(MouseEvent.MOUSE_OVER, drillOver);
			//drill_button_mc.addEventListener(MouseEvent.MOUSE_OUT, drillOut);
			drill_button_mc.addEventListener(MouseEvent.MOUSE_DOWN, drillDown);
			addChild(drill_button_mc);
		}
		/*
		private function drillOver(event:MouseEvent)
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			//cache image 
			drill_background_bitmap.cacheAsBitmap = true;
			//position on screen
			drill_background_bitmap.x = 290;
			drill_background_bitmap.y = 140;
			//set bitmap to bitmapdata
			drill_background_bitmapdata.draw(drill_background_bitmap);
			//add object
			addChild(drill_background_bitmap);
			
			//add tool
			tools_icon_class.icontool2();
		}
		private function drillOut(event:MouseEvent)
		{
			removeChild(drill_background_bitmap);
			//remove tool
			tools_icon_class.icontoolremove();
			
		}
		*/
		
		private function drillDown(event:MouseEvent)
		{
			tabRemove();
			//HOVER OPTION
			//tools_icon_class.icontoolremove();
			hud_class.addtoolboxevent();
			hud_class.level_class.addeventtools();
			hud_class.level_class.adddrill();
			
		}
		//============================================================
		
		//HAMMER BUTTON
		//=========================================================
		public function hammerbutton()
		{
			//cache image 
			hammer_button_bitmap.cacheAsBitmap = true;
			//set bitmap to bitmapdata
			hammer_button_bitmapdata.draw(hammer_button_bitmap);
			//add object
			hammer_button_mc.addChild(hammer_button_bitmap);
			//position on screen
			hammer_button_mc.x = 410;
			hammer_button_mc.y = 140;
			//hammer_button_mc.addEventListener(MouseEvent.MOUSE_OVER, hammerOver);
			//hammer_button_mc.addEventListener(MouseEvent.MOUSE_OUT, hammerOut);
			hammer_button_mc.addEventListener(MouseEvent.MOUSE_DOWN, hammerDown);
			addChild(hammer_button_mc);
		}
		/*
		private function hammerOver(event:MouseEvent)
		{
			hud_class.level_class.sound_screen_class.buttonsoundon();
			//cache image 
			hammer_background_bitmap.cacheAsBitmap = true;
			//position on screen
			hammer_background_bitmap.x = 410;
			hammer_background_bitmap.y = 140;
			//set bitmap to bitmapdata
			hammer_background_bitmapdata.draw(hammer_background_bitmap);
			//add object
			addChild(hammer_background_bitmap);
			
			//add tool
			tools_icon_class.icontool3();
		}
		private function hammerOut(event:MouseEvent)
		{
			removeChild(hammer_background_bitmap);
			//remove tool
			tools_icon_class.icontoolremove();
		
		}
		*/
		private function hammerDown(event:MouseEvent)
		{
			tabRemove();
			//HOVER OPTION
			//tools_icon_class.icontoolremove();
			hud_class.addtoolboxevent();
			hud_class.level_class.addeventtools();
			hud_class.level_class.addhammer();
		  
		}
		//===========================================
		public function suturingbutton()
		{
			//cache image 
			suturing_button_bitmap.cacheAsBitmap = true;
			//set bitmap to bitmapdata
			suturing_button_bitmapdata.draw(suturing_button_bitmap);
			//add object
			suturing_button_mc.addChild(suturing_button_bitmap);
			//position on screen
			suturing_button_mc.x = 535;
			suturing_button_mc.y = 140;
			//hammer_button_mc.addEventListener(MouseEvent.MOUSE_OVER, hammerOver);
			//hammer_button_mc.addEventListener(MouseEvent.MOUSE_OUT, hammerOut);
			//hammer_button_mc.addEventListener(MouseEvent.MOUSE_DOWN, hammerDown);
			addChild(suturing_button_mc);
		}
		//===================================================================================
		
////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
