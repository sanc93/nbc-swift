//
//  ToDoTasks.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/08.
//

import Foundation

struct ToDoTask {
    var id: UUID // UUID로 고유 ID값 생성. 향후 이 UUID값을 id값으로 사용해서 용이하게 데이터 추가/변경 가능
    var inputText: String
    var date: Date
    var isCompleted: Bool
}
