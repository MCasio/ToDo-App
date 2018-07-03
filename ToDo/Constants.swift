//
//  Constants.swift
//  ToDo
//
//  Created by Amr Mohamed on 6/23/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation

struct TodoTask: Codable {
    var name: String
    var completed: Bool
    var type: TaskType
}

enum TaskType:String, Codable {
    case argent, medium , low
}

var todoList: [TodoTask]?

var encodedData = try? JSONEncoder().encode(todoList)
