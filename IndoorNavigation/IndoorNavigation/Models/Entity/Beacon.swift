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
    let id: String
    let distance: String
}

// MARK: - DTOConvertible

extension Beacon: DTOConvertible {
    typealias DTO = BeaconEntry

    static func from(dto model: DTO) throws -> Beacon {
        return Beacon(id: model.beaconId, distance: model.distance)
    }

    func toDTO() throws -> DTO {
        return BeaconEntry(beaconId: self.id,
                           distance: self.distance)
    }
}
