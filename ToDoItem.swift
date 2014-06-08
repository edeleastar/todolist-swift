
class ToDoItem
{
  var completed = false
  var itemName  = ""
  
  init(completed: Bool = false, itemName:String = "empty")
  {
    self.completed = completed
    self.itemName  = itemName
  }
}
