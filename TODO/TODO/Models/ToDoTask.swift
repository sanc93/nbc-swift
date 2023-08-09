//
//  ToDoTasks.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/08.
//

import Foundation

struct ToDoTask: Codable {
    var id: UUID // UUID()로 고유 ID값 생성
    var inputText: String
    var date: Date
    var isCompleted: Bool
}
