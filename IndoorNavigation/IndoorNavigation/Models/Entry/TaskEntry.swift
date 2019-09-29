//
//  Task.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

struct TaskEntry {
    let identifier: String
    let details: [String]
}

// MARK: - Decodable

extension TaskEntry: Codable {

    enum CodingKeys: String, CodingKey {
        case identifier
        case details
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.details = try container.decode(Array<String>.self, forKey: .details)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.details, forKey: .details)
    }
}

// MARK: - RawMappable

extension TaskEntry: RawMappable {
    typealias Raw = Json
}
