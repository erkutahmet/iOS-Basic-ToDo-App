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
            addTaskVM.saveTask(taskName: taskName)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
