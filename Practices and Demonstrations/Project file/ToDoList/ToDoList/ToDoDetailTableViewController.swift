//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Wayne on 2021/12/10.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var toDo: ToDo?
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            dueDateLabel.textColor = .black
            updateDateLabel(date: dueDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
         
        guard segue.identifier == "saveUnwind" else {
            return
        }
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected == true
        let dueDate = dueDatePicker.date
        let notes = textView.text
        
        toDo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.isComplete
            dueDatePicker.date = toDo.dueDate
            textView.text = toDo.notes
        } else {
            dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        }
        updateSaveButtonState()
        updateDateLabel(date: dueDatePicker.date)
    }

    @IBAction func titleTextFieldChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateLabel(date: sender.date)
    }
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    
    func updateDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dateFormatter.string(from: date)
    }
    

}
