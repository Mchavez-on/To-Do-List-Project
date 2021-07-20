//
//  AddToDoViewController.swift
//  To-Do-List Project
//
//  Created by Mariana Chavez on 7/19/21.
//

import UIKit

class AddToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context  = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
        // we are creating a new ToDoCD object here, naming it toDo
        let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
        
        // if the titleTextField has text, we will call that text titleText
        if let titleText = titleTextField.text{
            // we will take the titleText and assign that value to toDo.name
            // this .name and .important came from the attributes you typed in on the Core Data page!
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
            try? context.save()
            
            //previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
            //previousVC.toDos.append(toDo)
             //this line made me start at the final view controller
            //navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
