//
//  HomePageViewModel.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var tRepo = TasksDaoRepository()
    var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    init() {
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
}
