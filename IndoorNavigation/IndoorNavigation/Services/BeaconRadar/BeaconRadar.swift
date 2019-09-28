//
//  BeaconRadar.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import Foundation
import CoreLocation

enum State {
    case enabled
    case disabled
    case notAvailable
}

class BeaconRadar: NSObject {

    // MARK: - Public Properties

    var state: State = .disabled

    // MARK: Private Properties

    private var locationManager: CLLocationManager

    init(with locationManager: CLLocationManager) {
        self.locationManager = locationManager
    }

}

// MARK: - CLLocationManagerDelegate

extension BeaconRadar: CLLocationManagerDelegate {

}
