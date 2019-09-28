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

    private(set) var state: State = .disabled
    var baseBeacon: Beacon?

    var didEnteredToWorkRegion: EmptyBlock?
    var didCameoutToWorkRegion: EmptyBlock?
    var didUpdateDistance: CLProximityBlock?

    // MARK: Private Properties

    private var locationManager: CLLocationManager

    init(with locationManager: CLLocationManager) {
        self.locationManager = locationManager
        super.init()
        configure()
    }

    // MARK: Public Methods

    func configure() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    func scaning(beacon: CLBeaconRegion) {
        locationManager.startMonitoring(for: beacon)
        locationManager.startRangingBeacons(in: beacon)
    }
}

// MARK: - CLLocationManagerDelegate

extension BeaconRadar: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable(), let region = baseBeacon?.region {
                    scaning(beacon: region)
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {

        guard !beacons.isEmpty else {
            updateDistance(.unknown)
            return
        }
        updateDistance(beacons[0].proximity)
        didEnteredToWorkRegion?()
        let beacon = beacons.first(where: { item in
            if let uuid = baseBeacon?.getUuid {
                if #available(iOS 13.0, *) {
                    return item.uuid == uuid
                } else {
                    return false
                }
            }
            return false
        })
        if beacon != nil {

        }
    }

    func updateDistance(_ distance: CLProximity) {
        didUpdateDistance?(distance)
    }
}

extension Beacon {

    var region: CLBeaconRegion? {
        guard
            let uuid = UUID(uuidString: uuid),
            let major = UInt16(major),
            let minor = UInt16(minor)
        else {
                return nil
        }
        return CLBeaconRegion(proximityUUID: uuid,
                              major: major,
                              minor: minor,
                              identifier: identifier)
    }

}
