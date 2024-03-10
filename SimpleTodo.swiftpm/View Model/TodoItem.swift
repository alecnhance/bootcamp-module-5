//
//  TodoItem.swift
//  SimpleTodo
//
//  Created by Noah Sadir on 2/18/24.
//

import Foundation

struct TodoItem: Identifiable, Hashable {
    static var idCounter = 0
    
    var id: Int
    var description: String
    
    init(_ description: String) {
        self.description = description
        self.id = TodoItem.idCounter
        TodoItem.idCounter += 1
    }
}
