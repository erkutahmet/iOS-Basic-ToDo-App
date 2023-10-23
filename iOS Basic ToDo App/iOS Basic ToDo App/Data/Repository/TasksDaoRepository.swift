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
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        
        db = FMDatabase(path: databaseURL.path())
    }
    
    func saveTask(taskName: String) {
        db?.open()
        do {
            if taskName != String() {
                try db!.executeUpdate("INSERT INTO tasks (task_name) VALUES(?)", values: [taskName])
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func updateTask(taskId: Int, taskName: String) {
        db?.open()
        do {
            if taskName != String() {
                try db!.executeUpdate("UPDATE tasks SET task_name = ? WHERE task_id = ?", values: [taskName, taskId])
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()

    }
    
    func deleteTask(taskId: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM tasks WHERE task_id = ?", values: [taskId])
            uploadTasks()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchTask(searchText: String) {
        db?.open()
        var list = [Tasks]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM tasks WHERE task_name LIKE '%\(searchText)%", values: nil)
            
            while rs.next() {
                let task = Tasks(task_id: Int(rs.string(forColumn: "task_id"))!,
                                 task_name: rs.string(forColumn: "task_name")!)
                
                list.append(task)
            }
            tasksList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    
        db?.close()
    }
    
    func uploadTasks() {
        db?.open()
        var list = [Tasks]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM tasks", values: nil)
            
            while rs.next() {
                let task = Tasks(task_id: Int(rs.string(forColumn: "task_id"))!,
                                 task_name: rs.string(forColumn: "task_name")!)
                
                list.append(task)
            }
            
            tasksList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
