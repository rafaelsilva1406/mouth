/* rafael silva last update 7/25/2012 */

//set the dir name where class located
package startfactory 
{
	//call libs going to use for flash builder
	import flash.display.Sprite;
	
	public class titlescreen extends Sprite{
		//class structure
		public var main_class:Main;
		
		//add background object class
		private var title_background_obj:titlebackground;
		
		//add character object class
		private var character_button_obj:characterclass;
		
		//add instruction object class
		private var instruction_button_obj:instructionclass;
		
		
		public function titlescreen(passed_class:Main)
		{
			// constructor code
			
			//class structure
			main_class = passed_class;
			
			//add title object class
			title_background_obj = new titlebackground(this);
			addChild(title_background_obj);
			
			//add character object class 
			character_button_obj = new characterclass(this);
			addChild(character_button_obj);
			
			instruction_button_obj = new instructionclass(this);
			addChild(instruction_button_obj);
			
		}
		public function destroystart()
		{
			//remove background image 
			title_background_obj.destroybackground();
			//remove var that is used to set class
			removeChild(title_background_obj);
			//remove button image
			character_button_obj.destroycharacter();
			//remove var is used to class
			removeChild(character_button_obj);
			instruction_button_obj.destroyinstruction();
			removeChild(instruction_button_obj);
			
		}
////////////////////////////////////////////////////////////////////////////////////////////////
	}
	
}
