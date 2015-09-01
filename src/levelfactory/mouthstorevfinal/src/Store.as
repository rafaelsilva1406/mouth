package levelfactory.mouthstorevfinal.src
{//START PACKAGE
	
	import flash.accessibility.AccessibilityImplementation;
	import flash.desktop.Clipboard;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.globalization.LocaleID;
	import levelfactory.toolsmenu;
	import levelfactory.hud;
	import levelfactory.GameInfo;
	
	/**
	 * ...
	 * @author Ricardo Limo
	 */
	public class Store extends Sprite 
	{//START STORE CLASS
		
		//ASSET FOR STORE
		[Embed(source="assets/Store/Background.png")]
		private const STORE:Class;
		public var _store:Bitmap = new STORE();
		
		[Embed(source = "assets/Store/shelfing.png")]
		private const SHELF:Class;
		public var _shelf:Bitmap = new SHELF();
		
		[Embed(source = "assets/Store/SlidingDoor 1.png")]
		private const SLIDINGDOOR:Class;
		
		[Embed(source = "assets/Store/NAtool.png")]
		private const NATOOL:Class;
		public var _na1:Bitmap = new (NATOOL);
	
		
		
		//DOORS AND BUTTONS
		private var _slidingDoor1:SlidingDoor = new SlidingDoor( -30, 235, 10, false, false);
		private var _doorButton1:DoorButton = new DoorButton(120, 150, _slidingDoor1);
		
		private var _slidingDoor2:SlidingDoor = new SlidingDoor(237, 235, 10, false, false);
		private var _doorButton2:DoorButton = new DoorButton(350, 150, _slidingDoor2);
		
		private var _slidingDoor3:SlidingDoor = new SlidingDoor(495, 235, 10, false, true);
		private var _doorButton3:DoorButton = new DoorButton(620, 150, _slidingDoor3);
		
		private var _specialDoor:SpecialDoor = new SpecialDoor(90, -30, 15, true);
		private var _backArrowBtn:BackArrow = new BackArrow(30, 5);
		//============================================================================
		
		
		
		//TOOLS
		private var _JawTrap:JawTrap = new JawTrap();
		private var _BaseballBat:BaseballBat = new BaseballBat();
		private var _CrowBar:CrowBar = new CrowBar();
		private var _DentistDrill:DentistDrill = new DentistDrill();
		private var _GoldTeeth:GoldTeeth = new GoldTeeth();
		private var _Grinder:Grinder = new Grinder();
		private var _Hammer:Hammer = new Hammer();
		private var _HandDrill:HandDrill = new HandDrill();
		private var _Nitrogen:Nitrogen = new Nitrogen();
		private var _Piercings:Piercings = new Piercings();
		private var _Pliers:Pliers = new Pliers();
		private var _RazorWire:RazorWire = new RazorWire();
		private var _Scapel:Scapel = new Scapel();
		private var _Thread:Thread = new Thread();
		//=======================================================
		
		//STORE VARS AND STUFF
		public static var _currentOpenDoor:SlidingDoor;
		public static var _toolLimit:Number;
		public static var _instance:Store;
		
	
		private var _toolHolder:Array;
		//======================================================
		public function Store()
		{//START FUNCTION STORE
			
			//STORES THE STORE PNG ON THE CURRENT MEMORY
			_store.cacheAsBitmap = true;
			_toolLimit = 0;
			_instance = this;
			
			_toolHolder = new Array();
			addChild(_store);
			
			
			//SPECIAL TOOLS AND DOOR
			_BaseballBat.setXY(280, 40);
			_BaseballBat.setOriginalXY(280, 40);
			//_na1.x = 280;
			//_na1.y = 10;
			//addChild(_BaseballBat);
			
			
			_CrowBar.setXY(480, 15);
			_CrowBar.setOriginalXY(480, 15);
			//addChild(_CrowBar);
			
			_Nitrogen.setXY(280, 80);
			_Nitrogen.setOriginalXY(280, 80);
			//addChild(_Nitrogen);
			
			_JawTrap.setXY(480, 80);
			_JawTrap.setOriginalXY(480, 80);
			//addChild(_JawTrap);
			
			addChild(_specialDoor);
			//================================
			
			//FRONT SHELF
			_shelf.x = 0;
			_shelf.y = 0;
			addChild(_shelf);
			//=====================
			
			//arrow btn
			addChild(_backArrowBtn);
			//ADDS BUTTONS
			addChild(_doorButton1);
			addChild(_doorButton2);
			addChild(_doorButton3);
			//======================
			//REGULAR TOOLS
			//====================================
			
			//LEFT SHELF TOOLS
			_RazorWire.setXY(10, 235);
			_RazorWire.setOriginalXY(10, 235);
			//addChild(_RazorWire);
			
			_DentistDrill.setXY(50, 320);
			_DentistDrill.setOriginalXY(50, 320);
			addChild(_DentistDrill);
			
			_HandDrill.setXY(40, 367);
			_HandDrill.setOriginalXY(40, 367);
			//addChild(_HandDrill);
			//=================================
			
			//MIDDLE SHELF TOOLS
			_Grinder.setXY(320, 255);
			_Grinder.setOriginalXY(320, 255);
			addChild(_Grinder);
			
			_Thread.setXY(320, 320);
			_Thread.setOriginalXY(320, 320);
			addChild(_Thread);
			
			_Pliers.setXY(320, 390);
			_Pliers.setOriginalXY(320, 390);
			addChild(_Pliers);
			//==================================
			
			//RIGHT SHELF TOOLS
			_Hammer.setXY(580, 250);
			_Hammer.setOriginalXY(580, 250);
			addChild(_Hammer);
			
			_GoldTeeth.setXY(580, 320);
			_GoldTeeth.setOriginalXY(580, 320);
			addChild(_GoldTeeth);
			
			_Piercings.setXY(580, 367);
			_Piercings.setOriginalXY(580, 367);
			//addChild(_Piercings);
			//==================================
			
			//=============================================
			
			//SLIDING DOORS AND BUTTONS
			_slidingDoor1.setAsset(SLIDINGDOOR);
			addChild(_slidingDoor1)
			_slidingDoor3.setAsset(SLIDINGDOOR);
			addChild(_slidingDoor3);
			_slidingDoor2.setAsset(SLIDINGDOOR);
			addChild(_slidingDoor2);

			//=================================
			
			
		}//END FUNCTION STORE
		
	
		public function pushTool(_Obj:String):void
		{
			GameInfo.storeArray.push(_Obj);
		}
		
		public function deleteStore():void
		{
			
	
			this._DentistDrill.deleteTool();
			this._DentistDrill = null;
			
			this._doorButton1.deleteDoorButton();
			this._doorButton1 = null;
			
			this._doorButton2.deleteDoorButton();
			this._doorButton2 = null;
			
			this._doorButton3.deleteDoorButton();
			this._doorButton3 = null;
			
			this._slidingDoor1.deleteDoor();
			this._slidingDoor1 = null;
			
			this._slidingDoor2.deleteDoor();
			this._slidingDoor2 = null;
			
			this._slidingDoor3.deleteDoor();
			this._slidingDoor3 = null;
			
			this._specialDoor.deleteDoor();
			this._specialDoor = null;
			
			this._GoldTeeth.deleteTool();
			this._GoldTeeth = null;
			
			this._Grinder.deleteTool();
			this._Grinder = null;
			
			this._Hammer.deleteTool();
			this._Hammer = null;
			
			this._Pliers.deleteTool();
			this._Pliers = null;
			
			removeChild(this._shelf);
			this._shelf = null;

			removeChild(this._store);
			this._store = null;
			
			this._Thread.deleteTool();
			this._Thread = null;
			
			this._backArrowBtn.deleteBtn();
			this._backArrowBtn = null;
			
			
			}
		
	}//END STORE CLASS
	
}//END PACKAGE