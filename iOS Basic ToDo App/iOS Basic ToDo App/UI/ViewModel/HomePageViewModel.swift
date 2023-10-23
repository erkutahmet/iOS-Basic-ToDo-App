//
//  HomePageViewModel.swift
//  iOS Basic ToDo App
//
//  Created by Sudenaz Alkan on 23.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var tRepo = TasksDaoRepository()
    var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    init() {
        copyDatabase()
        tasksList = tRepo.tasksList
        uploadTasks()
    }
    
    func deleteTask(taskId: Int) {
        tRepo.deleteTask(taskId: taskId)
    }
    
    func searchTask(searchText: String) {
        tRepo.searchTask(searchText: searchText)
    }
    
    func uploadTasks() {
        tRepo.uploadTasks()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "task", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: placeToCopy.path) {
            print("It already have DataBase")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch {}
        }
    }
}
