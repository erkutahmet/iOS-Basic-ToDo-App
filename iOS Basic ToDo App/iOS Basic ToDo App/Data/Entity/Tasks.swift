//
//  Tasks.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import Foundation

class Tasks {
    var id: Int?
    var name: String?
    
    init() {
        
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
