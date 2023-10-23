//
//  TasksDaoRepository.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation

class TasksDaoRepository {
    
    func saveTask(taskName: String) {
        print("Task Saved: \(taskName)")
    }
    
    func updateTask(taskId: Int, taskName: String) {
        print("Task Updated: \(taskId) - \(taskName)")
    }
    
    func deleteTask(taskId: Int) {
        print("\(taskId) -> deleted!")
    }
    
    func searchTask(searchText: String) {
        print("-> \(searchText)")
    }
}
