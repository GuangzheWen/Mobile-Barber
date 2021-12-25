//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Wayne on 2021/12/10.
//

import UIKit

class ToDoListTableViewController: UITableViewController, ToDoTableViewCellDelegate {
    
    func checkMarkTapped(sender: ToDoTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            toDos[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(toDos: toDos)
        }
    }
    
    
    var toDos: [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDos = ToDo.loadToDos() {
            self.toDos = toDos
        } else {
//            self.toDos = ToDo.loadSampleToDos()
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
        
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(toDos: toDos)
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath) as! ToDoTableViewCell

        
        // Configure the cell...
        let toDo = toDos[indexPath.row]
        cell.titleLabel?.text = toDo.title
        cell.isCompletionButton.isSelected = toDo.isComplete
        cell.delegate = self
        return cell
    }
    
    @IBAction func unwindToToDoListTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {return}
        let detailVC = segue.source as! ToDoDetailTableViewController
        if let toDo = detailVC.toDo {
            // toDos.firstIndex(of: toDo)
            if let indexOfExistingToDo = tableView.indexPathForSelectedRow {
                toDos[indexOfExistingToDo.row] = toDo
                tableView.reloadRows(at: [indexOfExistingToDo], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: toDos.count, section: 0)
                toDos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
           
        }
        ToDo.saveToDos(toDos: toDos)
        
    }

    @IBSegueAction func editCell(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else {return nil}
        
        let detailVC = ToDoDetailTableViewController(coder: coder)
        detailVC?.toDo = toDos[indexPath.row]
        
        return detailVC
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
