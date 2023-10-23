//
//  AddTaskPageViewModel.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation

class AddTaskPageViewModel {
    
    var tRepo = TasksDaoRepository()
    
    func saveTask(taskName: String) {
        tRepo.saveTask(taskName: taskName)
    }
}
