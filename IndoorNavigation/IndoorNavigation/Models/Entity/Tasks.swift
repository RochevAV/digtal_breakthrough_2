//
//  Tasks.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

struct Tasks {
    public let items: [Task]
}

// MARK: - DTOConvertible

extension Tasks: DTOConvertible {
    typealias DTO = TasksEntry

    static func from(dto model: DTO) throws -> Tasks {
        return .init(items: try .from(dto: model.items))
    }

    func toDTO() throws -> DTO {
        return try .init(items: self.items.toDTO())
    }

}
