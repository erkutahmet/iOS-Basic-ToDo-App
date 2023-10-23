//
//  AddTaskPage.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import UIKit

class AddTaskPage: UIViewController {

    @IBOutlet weak var newTaskTextField: UITextField!

    let addTaskVM = AddTaskPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let taskName = newTaskTextField.text {
            let task_name = taskName.replacingOccurrences(of: " ", with: "")
            
            if task_name != String() {
                let tName = taskName.trimmingCharacters(in: .whitespaces)
                addTaskVM.saveTask(taskName: tName)
                navigationController?.popToRootViewController(animated: true)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Please check fields!", preferredStyle: .alert)
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                    alertController.dismiss(animated: true, completion: nil)
                }
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
