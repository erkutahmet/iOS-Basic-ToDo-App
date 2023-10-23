//
//  TasksDaoRepository.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation
import RxSwift

class TasksDaoRepository {
    var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    func saveTask(taskName: String) {
        print("Task Saved: \(taskName)")
    }
    
    func updateTask(taskId: Int, taskName: String) {
        print("Task Updated: \(taskId) - \(taskName)")
        uploadTasks()
    }
    
    func deleteTask(taskId: Int) {
        print("\(taskId) -> deleted!")
        uploadTasks()
    }
    
    func searchTask(searchText: String) {
        print("-> \(searchText)")
    }
    
    func uploadTasks() {
        var list = [Tasks]()
        let t1 = Tasks(task_id: 1, task_name: "Feed dog")
        let t2 = Tasks(task_id: 2, task_name: "Write some code.")
        let t3 = Tasks(task_id: 3, task_name: "Make food")
        let t4 = Tasks(task_id: 4, task_name: "Go shopping")
        let t5 = Tasks(task_id: 5, task_name: "Seen a doctor")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        list.append(t4)
        list.append(t5)
        
        tasksList.onNext(list)
    }
}
