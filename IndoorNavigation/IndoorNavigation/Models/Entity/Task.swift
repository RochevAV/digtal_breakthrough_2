//
//  Task.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

struct Task {
    let identifier: String
    let details: [String]
}

// MARK: - DTOConvertible

extension Task: DTOConvertible {
    typealias DTO = TaskEntry

    static func from(dto model: DTO) throws -> Task {
        return Task(identifier: model.identifier,
                    details: model.details)
    }

    func toDTO() throws -> DTO {
        return TaskEntry(identifier: self.identifier,
                         details: self.details)
    }
}
