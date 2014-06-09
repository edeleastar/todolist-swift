import UIKit


@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController
{
  var items = ToDoItem[]()
  
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
  
  // #pragma mark - Table view delegate
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
  {
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    var task = self.items[indexPath.row] as ToDoItem
    task.completed = !task.completed
    tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
  }
  
  // #pragma mark - Table view data source
  override func numberOfSectionsInTableView(tableView: UITableView?) -> Int
  {
    return 1
  }
  
  override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int
  {
    return items.count
  }
  
  @IBAction func unwindToList (segue: UIStoryboardSegue?)
  {
    var controller = segue?.sourceViewController as AddToDoItemViewController
    if controller.todoItem != nil
    {
      items.append(controller.todoItem!)
      self.tableView.reloadData()
    }
  }
  
  override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell?
  {
    let cell           = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ListPrototypeCell")
    var task           = items[indexPath.row]
    
    cell.text          = task.itemName
    cell.accessoryType = task.completed ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    
    return cell
  }
  
  override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool
  {
    return true
  }

  override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?)
  {
    if editingStyle == .Delete
    {
      var index:Int = indexPath!.row
      items.removeAtIndex(index)
      tableView?.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
    }
    else if editingStyle == .Insert
    {
    }
  }
  
  override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?)
  {
  }

  override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool
  {
    return true
  }
}
