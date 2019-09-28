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

    var didEntryToWorkRegion: EmptyBlock?
    var didUpdateDistance: CLProximityBlock?

    // MARK: Private Properties

    private var baseBeacon: Beacon
    private var locationManager: CLLocationManager

    init(with baseBeacon: Beacon, locationManager: CLLocationManager) {
        self.locationManager = locationManager
        self.baseBeacon = baseBeacon
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
                if CLLocationManager.isRangingAvailable(), let region = baseBeacon.region {
                    scaning(beacon: region)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
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
