import UIKit


@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController,  UITableViewDataSource, UITableViewDelegate
{
  var tasks: NSMutableArray = NSMutableArray()
  
  func loadinitialData()
  {
    //tasks.addObject(ToDoItem(completed:false, itemName:"Buy Eggs"))
    //tasks.addObject(ToDoItem(completed:false, itemName:"Run away"))
  }
  
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
    loadinitialData()
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  // #pragma mark - Table view delegate
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
  {
    self.tableView = tableView
    
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    var task = self.tasks[indexPath.row] as ToDoItem
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
    return tasks.count
  }
  
  @IBAction func unwindToList (segue: UIStoryboardSegue?)
  {
    var controller = segue?.sourceViewController as AddToDoItemViewController
    if controller.todoItem != nil
    {
      tasks.addObject(controller.todoItem)
      self.tableView.reloadData()
    }
  }
  
  override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell?
  {
    let cell           = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ListPrototypeCell")
    var task           = self.tasks[indexPath.row] as ToDoItem
    
    cell.text          = task.itemName
    cell.accessoryType = task.completed ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    
    return cell
  }
}
