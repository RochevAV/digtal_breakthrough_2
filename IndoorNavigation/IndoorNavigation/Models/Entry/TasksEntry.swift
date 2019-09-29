//
//  Tasks.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

struct TasksEntry: Codable {
    let items: [TaskEntry]
}

// MARK: - RawMappable

extension TasksEntry: RawMappable {
    typealias Raw = Json
}
