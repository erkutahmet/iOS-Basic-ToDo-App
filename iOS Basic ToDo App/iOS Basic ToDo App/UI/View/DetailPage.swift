//
//  DetailPage.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var updateTaskTextField: UITextField!
    
    var task: Tasks?
    
    let detailVM = DetailPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
    private func setUP() {
        if let t = task {
            updateTaskTextField.text = t.name
        }
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        if let taskName = updateTaskTextField.text, let t = task {
            let task_name = taskName.replacingOccurrences(of: " ", with: "")
            
            if task_name != String() {
                let tName = taskName.trimmingCharacters(in: .whitespaces)
                detailVM.updateTask(taskId: t.id!, taskName: tName)
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
