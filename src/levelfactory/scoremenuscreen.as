/* rafael silva last update 8/1/2012  */
//set dir were class locaded
package  levelfactory
{//START PACKAGE

	//import flash builder libs
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.system.System;
	import flash.system.fscommand;
	import flash.desktop.NativeApplication;
	//===============================
	
	public class scoremenuscreen extends Sprite
	{//START SCOREMENUSCREEN CLASS
	
		//SCOREMENU BACKGROUND
		[Embed(source = "assets/button/playagain/play_again_background.png",compression = true)]
		private const scoreMenuBck:Class;
		private var scoreMenuBckBitmap:Bitmap = new scoreMenuBck();
		//=======================================================================================
		
		//YES BUTTON ASSET
		[Embed(source = "assets/button/playagain/yes_button.png",compression = true)]
		private const YESBTN:Class;
		private var yesBtnBitmap:Bitmap = new YESBTN();
		private var yesBtnHolder:Sprite = new Sprite();
		//========================================================================================
		
		//NO BUTTON ASSET
		[Embed(source = "assets/button/playagain/no_button.png",compression = true)]
		private const NOBTN:Class;
		private var noBtnBitmap:Bitmap = new NOBTN();
		private var noBtnHolder:Sprite = new Sprite();
		//========================================================================================
		
		//TEXT FIELDS FOR FINAL SCORE AND TOOL USED
		//=============================================
		private var textFormat:TextFormat = new TextFormat();
		private var _finalScore:TextField = new TextField();
		private var _toolUsed:TextField = new TextField();
		//=============================================
		
		//================================================
		//                 CONSTRUCTOR
		//================================================
		
		public function scoremenuscreen()
		{//START SCOREMENUSCREEN FUNCTION
		
			//SCORE SCREEN BACKGROUND
			//============================================
			
			//SCORE BACKGROUND ASSET TO MEMORY
			scoreMenuBckBitmap.cacheAsBitmap = true;
			//======================================
			
			//SETS SCOREBCK X AND Y COORDS
			scoreMenuBckBitmap.x = 0;
			scoreMenuBckBitmap.y = 0;
			//==============================
			
			//DISPLAYS THE BACKGROUND TO THE SCREEN
			addChild(scoreMenuBckBitmap);
			//======================================
			//============================================
			
			//SCORE SCREEN YES BUTTON
			//=============================================
			
			//SCORE YES BUTTON ASSET TO MEMORY
			yesBtnBitmap.cacheAsBitmap = true;
			//======================================
			
			//ADD BITMAP TO SPRITE HOLDER FOR LISTENER PURPOSES
			this.yesBtnHolder.addChild(this.yesBtnBitmap);
			//SETS SCOREBCK X AND Y COORDS
			yesBtnHolder.x = 250;
			yesBtnHolder.y = 300;
			//==============================
			
			//SCORE NO BUTTON ASSET TO MEMORY
			noBtnBitmap.cacheAsBitmap = true;
			//======================================
			
			//ADD BITMAP TO SPRITE HOLDER FOR LISTENER PURPOSES
			this.noBtnHolder.addChild(this.noBtnBitmap);
			//SETS SCOREBCK X AND Y COORDS
			noBtnHolder.x = 400;
			noBtnHolder.y = 300;
			//==============================
			
			
			//DISPLAYS THE YES AND NO BUTTON TO THE SCREEN
			addChild(yesBtnHolder);
			addChild(noBtnHolder);
			this.yesBtnHolder.addEventListener(MouseEvent.CLICK, playAgain);
			this.noBtnHolder.addEventListener(MouseEvent.CLICK, quit);
			//======================================
			//==============================================
			
			//TEXT FORMAT
			//===============================
			textFormat.size = 25;
			//===============================
			
			//FINAL SCORE TEXTFIELD
			//=======================================
			_finalScore.textColor = 0xff0000;
			_finalScore.defaultTextFormat = textFormat;
			_finalScore.x = 450;
			_finalScore.y = 90;
			addChild(_finalScore);
			//=========================================
			
			//TOOL USED TEXTFIELD
			//=========================================
			_toolUsed.textColor = 0xff0000;
			_toolUsed.defaultTextFormat = textFormat;
			_toolUsed.x = 450;
			_toolUsed.y = _finalScore.y + 30;
			addChild(_toolUsed);
			//=========================================
			
		}//END SCOREMENUSCREEN FUNCTION
		
		//=============================================================
		//                      END CONSTRUCTOR
		//=============================================================
		
		
		//=====================================================================
		//                         START MOUSE EVENTS
		//=====================================================================
		
		//PLAY AGAIN
		public function playAgain(e:Event):void
		{//START PLAY AGAIN EVENT FUNCTION
		
			//REMOVES YESBTNHOLDER LISTENER
			this.yesBtnHolder.removeEventListener(MouseEvent.CLICK, playAgain);
			//==================================================================
			
			//DESTROYS THE SCORE SCREEN
			scoreMenuDestroy();
			//=========================
			
			//STARTS THE GAME FROM THE TITLE SCREEN
			Main._Main.show_starttitle();
			//=====================================	
			
		}//END PLAY AGAIN EVENT FUNCTION
		
		//QUIT
		public function quit(e:Event):void
		{
			//REMOVES YESBTNHOLDER AND NOBTNHOLDER LISTENERS
			this.yesBtnHolder.removeEventListener(MouseEvent.CLICK, playAgain);
			this.noBtnHolder.removeEventListener(MouseEvent.CLICK, quit);
			//==================================================================
			
			//DESTROYS THE SCORE SCREEN
			scoreMenuDestroy();
			//=========================
			
			//COLLECTS GARBAGE TO FREE USED MEMORY
			System.gc();
			//=====================================
			
			//THIS IS THE COMMAND TO CLOSE APP. IN PHONES AND TABLETS
			//NativeApplication.nativeApplication.exit();
			//========================================================
			
			//THIS IS THE COMMAND TO CLOSE APP. IN DESKTOP/ WEBPAGES
			fscommand("quit");
			//=====================================================
			
			
		}
		
		//=======================================================
		//                  END MOUSE EVENTS
		//=======================================================
		
		//SETS FINAL SCORE
		public function setFinalScore(final_Score:int):void
		{
			_finalScore.text = String(final_Score);
			
		}
		
		//SETS TOOL USED
		public function setToolUsed(_tool:String):void
		{
			var toolScore:int = _tool * _tool;
			this._toolUsed.text = toolScore;
			
		}
		
		//SCORE MENU DESTROY
		public function scoreMenuDestroy():void
		{//START SCORE MENU DESTROY FUNCTION
			
			//REMOVES SCORE MENU BACKGROUND BITMAP
			this.removeChild(this.scoreMenuBckBitmap);
			//========================================
			
			//FREES SCORE MENU BACKGROUND MEMORY LOCATION
			scoreMenuBckBitmap = null;
			//===========================================
			
			
			//YES BUTTON
			//=====================================================
			
				//REMOVES THE YES BUTTON BITMAP FROM ITS SPRITE HOLDER
				yesBtnHolder.removeChild(this.yesBtnBitmap);
				//=====================================================
				
				//FREES THE YES BUTTON MEMORY LOCATION
				yesBtnBitmap = null;
				//=====================================
				
				//REMOVES THE YES BUTTON HOLDER SPRITE FROM THE SCREEN
				this.removeChild(this.yesBtnHolder);
				//====================================================
				
				//FREES THE YES BUTTON HOLDER MEMORY LOCATION
				yesBtnHolder = null;
				//===========================================
			
			//====================================================
			
			//NO BUTTON
			//===================================================
			
				//REMOVES THE NO BUTTON BITMAP FROM ITS SPRITE HOLDER
				noBtnHolder.removeChild(this.noBtnBitmap);
				//=====================================================
				
				//FREES THE NO BUTTON MEMORY LOCATION
				noBtnBitmap = null;
				//=====================================
				
				//REMOVES THE NO BUTTON HOLDER SPRITE FROM THE SCREEN
				this.removeChild(this.noBtnHolder);
				//====================================================
				
				//FREES THE NO BUTTON HOLDER MEMORY LOCATION
				noBtnHolder = null;
				//===========================================
				
			//====================================================
			
			
			//REMOVE AND FREE MEMORY OF FINAL SCORE AND TOOL USED
			//===================================================
			
				//REMOVES FINAL SCORE FROM SCREEN
				this.removeChild(_finalScore);
				//=============================
				
				//FREES THE FINAL SCORE MEMORY LOCATION
				_finalScore = null;
				//====================================
				
				//REMOVES TOOLUSED FROM SCREEN
				this.removeChild(_toolUsed);
				//==============================
				
				//FREES THE TOOL USED MEMORY LOCATION
				_toolUsed = null;
				//===================================
			
			//========================================================
			
			
			//FREES THE TEXT FORMAT MEMORY LOCATION
			textFormat = null;
			//=====================================
			
		}//END SCORE MENU DESTROY FUNCTION

	}//END CLASS SCOREMNEUSCREEN
	
}//END PACKAGE
