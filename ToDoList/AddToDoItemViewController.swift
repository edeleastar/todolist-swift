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
    if sender != nil &&  sender as NSObject == doneButton
    {
      todoItem = ToDoItem(itemName:toDoItemText.text)
    }
  }
  
  init(coder aDecoder: NSCoder!)
  {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
}
