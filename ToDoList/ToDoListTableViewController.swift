import UIKit


@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController
{
  var todoItems = ToDoItem[]()
  
  init(style: UITableViewStyle)
  {
    super.init(style: style)
  }
  
  init(coder aDecoder: NSCoder!)
  {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = self.editButtonItem()
  }
  
  @IBAction func unwindToList (segue: UIStoryboardSegue?)
  {
    var controller = segue?.sourceViewController as AddToDoItemViewController
    if controller.todoItem != nil
    {
      todoItems.append(controller.todoItem!)
      self.tableView.reloadData()
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView?) -> Int
  {
    return 1
  }
  
  override func tableView(tableView: UITableView?, numberOfRowsInSection: Int) -> Int
  {
    return todoItems.count
  }
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath : NSIndexPath!)
  {
    tableView.deselectRowAtIndexPath(didSelectRowAtIndexPath, animated: false)
    var task = self.todoItems[didSelectRowAtIndexPath.row] as ToDoItem
    task.completed = !task.completed
    tableView.reloadRowsAtIndexPaths([didSelectRowAtIndexPath], withRowAnimation: UITableViewRowAnimation.None)
  }

  override func tableView(tableView: UITableView?, cellForRowAtIndexPath : NSIndexPath!) -> UITableViewCell?
  {
    let cell           = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ListPrototypeCell")
    var task           = todoItems[cellForRowAtIndexPath.row]
    
    cell.text          = task.itemName
    cell.accessoryType = task.completed ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    
    return cell
  }
  
  override func tableView(tableView: UITableView?, canEditRowAtIndexPath : NSIndexPath?) -> Bool
  {
    return true
  }

  override func tableView(tableView: UITableView?, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath?)
  {
    if commitEditingStyle == .Delete
    {
      if let index = forRowAtIndexPath?.row
      {
        todoItems.removeAtIndex(index)
        tableView?.deleteRowsAtIndexPaths([forRowAtIndexPath!], withRowAnimation: .Fade)
      }
    }
    else if commitEditingStyle == .Insert
    {
    }
  }
  
  override func tableView(tableView: UITableView?, moveRowAtIndexPath : NSIndexPath?, toIndexPath: NSIndexPath?)
  {
  }

  override func tableView(tableView: UITableView?, canMoveRowAtIndexPath : NSIndexPath?) -> Bool
  {
    return true
  }
}
