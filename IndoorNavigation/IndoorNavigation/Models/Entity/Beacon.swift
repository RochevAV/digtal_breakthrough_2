//
//  Beacon.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit
import Foundation

struct Beacon {
    let identifier: String
    let uuid: String
    let major: String
    let minor: String
    let distance: Int
}

extension Beacon {

    var getUuid: UUID? {
        return UUID(uuidString: uuid)
    }
}

// MARK: - DTOConvertible

extension Beacon: DTOConvertible {
    typealias DTO = BeaconEntry

    static func from(dto model: DTO) throws -> Beacon {
        return Beacon(identifier: model.identifier,
                      uuid: model.uuid,
                      major: model.major,
                      minor: model.minor,
                      distance: model.distance)
    }

    func toDTO() throws -> DTO {
        return BeaconEntry(identifier: self.identifier,
                           uuid: self.uuid,
                           major: self.major,
                           minor: self.minor,
                           distance: self.distance)
    }
}
