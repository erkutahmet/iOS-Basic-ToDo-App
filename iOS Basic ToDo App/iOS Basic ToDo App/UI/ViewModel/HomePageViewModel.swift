//
//  HomePageViewModel.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation

class HomePageViewModel {
    
    var tRepo = TasksDaoRepository()
    
    func deleteTask(taskId: Int) {
        tRepo.deleteTask(taskId: taskId)
    }
    
    func searchTask(searchText: String) {
        tRepo.searchTask(searchText: searchText)
    }
}
