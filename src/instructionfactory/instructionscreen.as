/* rafael Silva 7/30/2012 */
//link background and button object give them further functionality

//package class 
package instructionfactory
{
	//import flash builder libs
	import flash.display.Sprite;
	
	
	public class instructionscreen extends Sprite
	{
		
		//class structure
		public var main_class:Main;
		
		//add background image
		private var instruction_background_class:instructionbackgroundobject;
		
		//add back button
		private var back_button_class:instructionbuttonobject;
		
		// constructor code
		public function instructionscreen(passed_class:Main) {
			
		
			//link functionality to class
			main_class = passed_class;
						
			//add background screen image 
			instruction_background_class = new instructionbackgroundobject(this);
			addChild(instruction_background_class);
			
			//add back button image
			back_button_class = new instructionbuttonobject(this);
			addChild(back_button_class);
		}
/////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
