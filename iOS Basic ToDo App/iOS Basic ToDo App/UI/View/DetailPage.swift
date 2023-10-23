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
            detailVM.updateTask(taskId: t.id!, taskName: taskName)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
