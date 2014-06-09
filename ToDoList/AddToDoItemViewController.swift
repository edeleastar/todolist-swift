import UIKit

class AddToDoItemViewController: UIViewController
{
  var todoItem : ToDoItem?
  
  @IBOutlet var toDoItemText : UITextField
  @IBOutlet var doneButton   : UIButton
  
  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
  {
    if let button = sender as? NSObject
    {
      todoItem = button == doneButton ? ToDoItem(itemName:toDoItemText.text): nil
    }
  }
  
  init(coder aDecoder: NSCoder!)
  {
    super.init(coder: aDecoder)
  }
}
