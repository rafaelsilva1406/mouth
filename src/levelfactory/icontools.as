package levelfactory  
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	public class icontools extends Sprite{
		//level class
		public var toolsmenu_class:toolsmenu;
		
		private var grinder_icon_mc:grindericonclass = new grindericonclass();
		
		private var drill_icon_mc:dentistdrilliconclass = new dentistdrilliconclass();
	
		private var hammer_icon_mc:hammericonclass = new hammericonclass();
		
		private var plier_icon_mc:plier_mc = new plier_mc();
		
		public function icontools(link_class:toolsmenu) {
			// constructor code
					//add to class
			toolsmenu_class = link_class;
			this.addEventListener(Event.ENTER_FRAME, toolspin);
			
		}
		public function icontool1()
		{
			//position on screen
			grinder_icon_mc.x = 400;
			grinder_icon_mc.y = 285;
			//add object
			addChild(grinder_icon_mc);
		}
		public function icontool2()
		{
			//position on screen
			drill_icon_mc.x = 400;
			drill_icon_mc.y = 285;
			//add object
			addChild(drill_icon_mc);
		 }
		public function icontool3()
		{
			//position on screen
			hammer_icon_mc.x = 400;
			hammer_icon_mc.y = 285;
			//add object
			addChild(hammer_icon_mc);
		}
		public function icontool4()
		{
			//position on screen
			plier_icon_mc.x = 400;
			plier_icon_mc.y = 285;
			//add object
			addChild(plier_icon_mc);
		}
		private function toolspin(event:Event):void 
		{
			if(grinder_icon_mc.parent)
			{
				
				grinder_icon_mc.rotation+=1;
			}
			if(drill_icon_mc.parent)
			{
				
				drill_icon_mc.rotation+=1;
			}
			if(hammer_icon_mc.parent)
			{
				
				hammer_icon_mc.rotation+=1;
			}
			if(plier_icon_mc.parent)
			{
				
				plier_icon_mc.rotation+=1;
			}
		}
		
		public function icontoolremove()
		{
			if(grinder_icon_mc.parent)
			{
				
				grinder_icon_mc.parent.removeChild(grinder_icon_mc);
			}
			if(drill_icon_mc.parent)
			{
				
				drill_icon_mc.parent.removeChild(drill_icon_mc);
			}
			if(hammer_icon_mc.parent)
			{
				
				hammer_icon_mc.parent.removeChild(hammer_icon_mc);
			}
			if(plier_icon_mc.parent)
			{
				
				plier_icon_mc.parent.removeChild(plier_icon_mc);
			}
			
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
