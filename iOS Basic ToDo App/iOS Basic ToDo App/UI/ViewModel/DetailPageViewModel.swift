//
//  DetailPageViewModel.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation

class DetailPageViewModel {
    
    var tRepo = TasksDaoRepository()
    
    func updateTask(taskId: Int, taskName: String) {
        tRepo.updateTask(taskId: taskId, taskName: taskName)
    }
}
