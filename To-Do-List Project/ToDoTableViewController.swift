//
//  ToDoTableViewController.swift
//  To-Do-List Project
//
//  Created by Mariana Chavez on 7/19/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    func createToDos() -> [ToDo]{
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        return [swift, dog]
    }
    
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let toDo = toDos[indexPath.row]
        if toDo.important {
            cell.textLabel?.text = "❗" + toDo.name
        }else{
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // this gives us a single ToDo
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
        return true
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDo{
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    

}
